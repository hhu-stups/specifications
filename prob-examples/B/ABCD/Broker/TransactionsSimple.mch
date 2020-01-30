MACHINE TransactionsSimple

/* This machine has a problem where inconsistencies can arise because
 commit of offers is not synchronous */

SETS
    USER = {u1,u2,u3};
    STATE = {user_start, basket_done, wait_for_offers, offers_ready, offer_selected, offer_commited,
             offers_released, finished};
    STATE_SP = {start, ready_to_make_offer, waiting_for_answer, answer_received, done};
    SERVICE_PROVIDER = {s1,s2,s3};
    REQUEST = {QUOTE, COMMIT, RELEASE};
    RESPONSE = {YES, NO};
    STATUS = {NONE, QUOTED, COMMITED, RELEASED}

VARIABLES
    user,
    state,
    offers,
    commited_offer,
    msg_T2SP,
    msg_SP2T,

    stateSP,
    service

INVARIANT
    user : USER &
    state : STATE &
    offers : POW(SERVICE_PROVIDER) &
    commited_offer : POW(SERVICE_PROVIDER) &
    msg_T2SP : SERVICE_PROVIDER +-> REQUEST &
    msg_SP2T : SERVICE_PROVIDER +-> RESPONSE &

    stateSP : SERVICE_PROVIDER --> STATE_SP &
    service : SERVICE_PROVIDER --> STATUS
    
    /* added by Michael : */
    & !xx.((xx : commited_offer & state = offer_commited &
        msg_T2SP = {} & msg_SP2T= {}) => (xx |-> COMMITED) : service)

INITIALISATION
    user := u1 ||
    state := user_start  ||
    offers := {} ||
    commited_offer := {} ||
    msg_T2SP := {} ||
    msg_SP2T := {} ||

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

    user_commit  =
        SELECT offers /= {} & state = offers_ready
        THEN
            ANY ss WHERE ss : SERVICE_PROVIDER & ss:offers
            THEN
                commited_offer := {ss} ||
                state := offer_selected
            END
        END;

    user_release  =
        SELECT state = offers_ready
        THEN
            commited_offer := {} ||
            state := offer_selected
        END;

    /* TRANSACTION */
    req_offer =
        SELECT state = basket_done
        THEN
            msg_T2SP := msg_T2SP \/ %ss.(ss:SERVICE_PROVIDER | QUOTE) ||
            state := wait_for_offers
        END;

    recv_offer  =
        ANY ss WHERE ss:SERVICE_PROVIDER & ss:dom(msg_SP2T) & state = wait_for_offers
        THEN
            IF msg_SP2T(ss) = YES THEN offers := offers \/ {ss} END ||
            msg_SP2T := {ss} <<| msg_SP2T
        END;

    time_out =
        SELECT state = wait_for_offers
        THEN
            state := offers_ready
        END;

    release_offers  =
        SELECT state : {offer_selected,offer_commited}
        THEN
            msg_T2SP := msg_T2SP \/ %ss.(ss:offers & ss/:commited_offer | RELEASE) ||
            IF state = offer_commited
            THEN
                state := finished
            ELSE
                state := offers_released
            END
        END;

    commit_offer  =
        ANY ss WHERE ss:commited_offer & state : {offer_selected,offers_released}
        THEN
            msg_T2SP(ss) := COMMIT ||
            IF state = offers_released
            THEN
                state := finished
            ELSE
                state := offer_commited
            END
        END;

    /* SERVICE_PROVIDER */
    recv_request (ss) =
    PRE
        ss : SERVICE_PROVIDER
    THEN
        SELECT stateSP(ss) = start & msg_T2SP(ss) = QUOTE
        THEN
            stateSP(ss) := ready_to_make_offer ||
            msg_T2SP := {ss} <<| msg_T2SP
        END
    END;

    make_offer (ss) =
    PRE
        ss : SERVICE_PROVIDER
    THEN
        SELECT stateSP(ss) = ready_to_make_offer
        THEN
            CHOICE
                service(ss) := QUOTED ||
                msg_SP2T(ss) := YES ||
                stateSP(ss) := waiting_for_answer
            OR
                service(ss) := NONE ||
                msg_SP2T(ss) := NO ||
                stateSP(ss) := done
            END
        END
    END;

    recv_answer (ss) =
    PRE ss : SERVICE_PROVIDER
    THEN
        SELECT msg_T2SP(ss) : {COMMIT,RELEASE} & stateSP(ss) = waiting_for_answer & service(ss) = QUOTED
        THEN
            msg_T2SP := {ss} <<| msg_T2SP ||
            IF msg_T2SP(ss) = COMMIT
            THEN
                service(ss) := COMMITED
            ELSE
                service(ss) := RELEASED
            END ||
            stateSP(ss) := answer_received
        END
    END;

    commit_service (ss) =
    PRE ss : SERVICE_PROVIDER
    THEN
        SELECT stateSP(ss) = answer_received & service(ss) = COMMITED
        THEN
            stateSP(ss) := done
        END
    END;

    release_service (ss) =
    PRE ss : SERVICE_PROVIDER
    THEN
        SELECT stateSP(ss) = answer_received & service(ss) = RELEASED
        THEN
            service(ss) := NONE ||
            stateSP(ss) := done
        END
    END;

    /* The next two operations nondeterministically remove a message from the message queue */

    resp <-- lose_msg2SP =
    ANY msg WHERE msg:SERVICE_PROVIDER & msg:dom(msg_T2SP)
    THEN
        msg_T2SP := {msg} <<| msg_T2SP ||
        resp := msg
    END;

    resp <-- lose_msg2T =
    ANY msg WHERE msg:SERVICE_PROVIDER & msg:dom(msg_SP2T)
    THEN
        msg_SP2T := {msg} <<| msg_SP2T ||
        resp := msg
    END

END

