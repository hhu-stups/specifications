MACHINE TransactionsSimple2

SETS
    USER = {u1,u2,u3};
    STATE = {user_start, basket_done, wait_for_offers, no_offers, offers_ready, offer_selected, offers_rejected,
             offers_released, finished};
    STATE_SP = {start, ready_to_make_offer, waiting_for_answer, answer_received, done};
    SERVICE_PROVIDER = {s1,s2,s3};
    REQUEST = {QUOTE, COMMIT, RELEASE};
    RESPONSE = {YES, NO, CANCEL};
    STATUS = {NONE, QUOTED, COMMITED, RELEASED};
    OUTPUT = {NOT_READY, DONE, NOT_DONE}

VARIABLES
    user,
    state,
    offers,
    commited_offer,
    output,
    msg_BK2SP,
    msg_SP2BK,
    stateSP,
    service

INVARIANT
    user : USER &
    state : STATE &
    offers : POW(SERVICE_PROVIDER) &
    commited_offer : POW(SERVICE_PROVIDER) &
    output : OUTPUT &
    msg_BK2SP : SERVICE_PROVIDER +-> REQUEST &
    msg_SP2BK : SERVICE_PROVIDER +-> RESPONSE &
    stateSP : SERVICE_PROVIDER --> STATE_SP &
    service : SERVICE_PROVIDER --> STATUS &

    ( card(commited_offer) : {0,1} ) &
    ( state /= finished => output = NOT_READY ) &
    ( state = finished => output : {DONE, NOT_DONE} ) &
    ( output = DONE => service~[{COMMITED}] = commited_offer ) &
    ( output = NOT_DONE => commited_offer = {} & COMMITED /: ran(service) ) &
    ( state = finished & COMMITED : ran(service) => service~[{COMMITED}] = commited_offer ) &
    ( state = finished & COMMITED /: ran(service) => commited_offer = {} )

INITIALISATION
    user := u1 ||
    state := user_start  ||
    offers := {} ||
    commited_offer := {} ||
    output := NOT_READY ||
    msg_BK2SP := {} ||
    msg_SP2BK := {} ||
    stateSP := %ss.(ss:SERVICE_PROVIDER | start) ||
    service := %ss.(ss:SERVICE_PROVIDER | NONE)

OPERATIONS

    /* USER */
    login (uu) =
    PRE uu:USER THEN
        SELECT state = user_start
        THEN
            user := uu ||
            state := basket_done ||
            offers := {}
        END
    END;

    resp <-- user_commit  =
        SELECT offers /= {} & state = offers_ready
        THEN
            ANY ss WHERE ss:SERVICE_PROVIDER & ss:offers
            THEN
                commited_offer := {ss} ||
                offers := offers - {ss} ||
                state := offer_selected ||
                resp := ss
            END
        END;

    user_reject  =
        SELECT state = offers_ready
        THEN
            commited_offer := {} ||
            state := offers_rejected
        END;

    /* TRANSACTION */
    req_offer =
        SELECT state = basket_done
        THEN
            msg_BK2SP := msg_BK2SP \/ %ss.(ss:SERVICE_PROVIDER | QUOTE) ||
            state := wait_for_offers
        END;

    resp <-- recv_offer  =
        ANY ss WHERE ss:SERVICE_PROVIDER & ss:dom(msg_SP2BK) & state = wait_for_offers
        THEN
            IF msg_SP2BK(ss) = YES THEN offers := offers \/ {ss} END ||
            msg_SP2BK := {ss} <<| msg_SP2BK ||
            resp := ss
        END;

    time_out =
        SELECT state = wait_for_offers
        THEN
            IF offers /= {}
            THEN
                state := offers_ready
            ELSE
                state := no_offers
            END
        END;

    resp <-- withdraw_offer(ss) =
        PRE ss : SERVICE_PROVIDER
        THEN
            SELECT state:{wait_for_offers, offers_ready, offers_rejected, offer_selected} &
                   ss:offers \/ commited_offer
            THEN
                IF ss:offers
                THEN
                    offers := offers - {ss}
                ELSE
                    commited_offer := {} ||
                    state := offers_rejected
                END ||
                resp := ss
            END
        END;

    release_offers  =
        SELECT state = offers_rejected
        THEN
            msg_BK2SP := msg_BK2SP \/ %ss.(ss:offers | RELEASE) ||
            offers := {} ||
            state := offers_released
        END;

    commit_offer(ss)  =
        PRE ss : SERVICE_PROVIDER
        THEN
            SELECT ss:commited_offer & state = offer_selected &
                   stateSP(ss) = waiting_for_answer & service(ss) = QUOTED
            THEN
                service(ss) := COMMITED ||
                stateSP(ss) := done ||
                commited_offer := {ss} ||
                state := offers_rejected
            WHEN ss:commited_offer & state = offer_selected &
                (stateSP(ss) /= waiting_for_answer or service(ss) /= QUOTED)
            THEN
                commited_offer := {} ||
                state := offers_rejected
            END
        END;

    res <-- reply_user =
        SELECT state : {offers_released, no_offers}
        THEN
            IF commited_offer /= {}
            THEN
                output := DONE ||
                res := DONE
            ELSE
                output := NOT_DONE ||
                res := NOT_DONE
            END ||
            state := finished
        END;

    clear_BK_msg =
    SELECT msg_SP2BK /= {} & state = finished
    THEN
        msg_SP2BK := {}
    END;

    /* SERVICE_PROVIDER */
    recv_request (ss) =
    PRE
        ss : SERVICE_PROVIDER
    THEN
        SELECT stateSP(ss) = start & msg_BK2SP(ss) = QUOTE
        THEN
            stateSP(ss) := ready_to_make_offer ||
            msg_BK2SP := {ss} <<| msg_BK2SP
        END
    END;

    resp <-- make_offer (ss) =
    PRE
        ss : SERVICE_PROVIDER
    THEN
        SELECT stateSP(ss) = ready_to_make_offer
        THEN
            CHOICE
                service(ss) := QUOTED ||
                msg_SP2BK(ss) := YES ||
                stateSP(ss) := waiting_for_answer ||
                resp := YES
            OR
                service(ss) := NONE ||
                msg_SP2BK(ss) := NO ||
                stateSP(ss) := done ||
                resp := NO
            END
        END
    END;

    withdraw_service (ss) =
    PRE ss : SERVICE_PROVIDER
    THEN
        SELECT stateSP(ss) = waiting_for_answer & service(ss) = QUOTED
        THEN
            service(ss) := NONE ||
            stateSP(ss) := done
        END
    END;

    release_service (ss) =
    PRE ss : SERVICE_PROVIDER
    THEN
        SELECT msg_BK2SP(ss) = RELEASE & stateSP(ss) = waiting_for_answer & service(ss) = QUOTED
        THEN
            msg_BK2SP := {ss} <<| msg_BK2SP ||
            service(ss) := NONE ||
            stateSP(ss) := done
        END
    END;

    clear_SP_msg(ss) =
    PRE ss : SERVICE_PROVIDER
    THEN
        SELECT ss:dom(msg_BK2SP) & stateSP(ss) = done
        THEN
            msg_BK2SP := {ss} <<| msg_BK2SP
        END
    END;

    resp <-- lose_msg2SP =
    ANY msg WHERE msg:SERVICE_PROVIDER & msg:dom(msg_BK2SP)
    THEN
        msg_BK2SP := {msg} <<| msg_BK2SP ||
        resp := msg
    END;

    resp <-- lose_msg2T =
    ANY msg WHERE msg:SERVICE_PROVIDER & msg:dom(msg_SP2BK)
    THEN
        msg_SP2BK := {msg} <<| msg_SP2BK ||
        resp := msg
    END
END
