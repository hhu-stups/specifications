MACHINE  FinalTravelAgency

/* finalised for the example shown in this paper */

SETS
    USER = {user_uu};
    SESSION = {session1}; /*{session_E33A3D300DF96619B6A0DF6A1FF76C7B};*/
    REQUEST = {bc, br, uc, ur, none};
    STATE = {s1, s2, s3, s4};
    HOTEL = {h1, h2};
    CAR_RENT = {c1, c2};
    CARD = {valid, wrong, unknown};
    ROOM = {h1a, h2a, h1b, h2b};
    CAR  = {c1a, c2a, c1b, c2b};
    RESP = {done, impossible, undef}

VARIABLES
    /* AGENCY DB */
   /*    session,*/
    session_user,
    session_response,
    session_card,
    session_state,
    session_request,
    agency_hotel_bookings,
    agency_rental_bookings,
    users_hotel,
    users_rental,

    /* ProB */
    rooms_hotel,
    cars_rental

DEFINITIONS
    rooms_available(h) ==  (dom(agency_hotel_bookings) /\ rooms_hotel~[{h}]) /= rooms_hotel~[{h}] ;
    cars_available(r) == (dom(agency_rental_bookings) /\ cars_rental~[{r}]) /= cars_rental~[{r}]

INVARIANT
/*    session <: SESSION &*/
    session_user: SESSION +-> USER &
    session_response: SESSION +-> RESP &
    session_card: SESSION +-> CARD &
    session_state: SESSION +-> STATE &
    session_request: SESSION +-> REQUEST &
    agency_hotel_bookings: ROOM +-> USER &
    agency_rental_bookings: CAR +-> USER &
    users_hotel : USER +-> HOTEL &
    users_rental : USER +-> CAR_RENT &

    rooms_hotel : ROOM --> HOTEL &
    cars_rental : CAR --> CAR_RENT &

    dom(session_user) = dom(session_response) & dom(session_user) = dom(session_card) &
    dom(session_user) = dom(session_state) & dom(session_user) = dom(session_request) &

    /* INV1 */
    ran(agency_hotel_bookings) = dom(users_hotel) &

    /* INV2 */
    ran(agency_rental_bookings) = dom(users_rental) &

    /* INV3 */
    !user.( user:ran(agency_hotel_bookings) =>
              agency_hotel_bookings~[{user}] <: rooms_hotel~[{users_hotel(user)}] ) &

    /* INV4 */
    !user.( user:ran(agency_rental_bookings) =>
              agency_rental_bookings~[{user}] <: cars_rental~[{users_rental(user)}] ) &

    /* INV5 */
    !ss1.( ss1:dom(session_card) & session_card(ss1) /= valid => session_response(ss1) = undef ) &

    /* INV6 */
    !ss1.( ss1:dom(session_card) & session_state(ss1) = s4 => session_response(ss1) /= undef ) &

    /* INV7 */
    !ss1.( ss1:dom(session_card) & session_state(ss1) = s3 => session_card(ss1) = valid ) &
    !ss1.( ss1:dom(session_card) & session_state(ss1) = s4 => session_card(ss1) = valid ) &

    /* INV8 */
    !ss1.( ss1:dom(session_card) & session_request(ss1) = br & session_response(ss1) = impossible &
            session_user(ss1):dom(users_hotel) =>
            dom(agency_hotel_bookings) /\ rooms_hotel~[{users_hotel(session_user(ss1))}] =
                rooms_hotel~[{users_hotel(session_user(ss1))}] ) 

INITIALISATION
/*    session := {} ||*/
    session_user := {} ||
    session_response := {} ||
    session_card := {} ||
    session_state := {} ||
    session_request := {} ||
    agency_hotel_bookings := {} ||
    agency_rental_bookings := {} ||
    users_hotel := {} ||
    users_rental := {} ||

    rooms_hotel := {h1a |-> h1, h1b |-> h1, h2a |-> h2, h2b |-> h2} ||
    cars_rental := {c1a |-> c1, c1b |-> c1, c2a |-> c2, c2b |-> c2}

OPERATIONS
    login(uu) =
        PRE uu:USER
        THEN
          ANY sid WHERE sid:SESSION & sid/:dom(session_card)
          THEN
            /*session := session \/ {sid} ||*/
            session_user(sid) := uu ||
            session_response(sid) := undef ||
            session_card(sid) := unknown ||
            session_state(sid) := s1 ||
            session_request(sid) := none
          END
        END;

   chooseService(sid,req)=
        PRE sid:SESSION & req:REQUEST
        THEN
          SELECT sid:dom(session_card) & session_state(sid)=s1 & req/=none
          THEN
            session_state(sid) := s2 ||
            session_request(sid) := req
          END
        END;

    enterCard2(sid,cc)=
        PRE sid:SESSION & cc:CARD-{unknown}
        THEN
          SELECT sid:dom(session_card) & session_state(sid)=s2 & session_card(sid)/=valid
          THEN
           /* ANY cc WHERE cc:CARD-{unknown}
            THEN */
              session_card(sid) := cc ||
              IF cc = valid THEN session_state(sid) := s3
              ELSE session_state(sid) := s1 END
           /* END */
          END
        END;

    enterCard(sid)=
        PRE sid:SESSION 
        THEN
          SELECT sid:dom(session_card) & session_state(sid)=s2 & session_card(sid)/=valid
          THEN
           ANY cc WHERE cc:CARD-{unknown}
            THEN 
              session_card(sid) := cc ||
              IF cc = valid THEN session_state(sid) := s3
              ELSE session_state(sid) := s1 END
           END
          END
        END;
   
    
    resp <-- respBookRoom(sid)=
        PRE sid:SESSION
        THEN
          SELECT sid:dom(session_card) & session_state(sid)=s3 & session_request(sid)=br
          THEN
            session_state(sid) := s4 ||
            SELECT session_user(sid)/:dom(users_hotel)
            THEN
              IF dom(agency_hotel_bookings) <<: ROOM
              THEN
                ANY rr, hh WHERE rr:ROOM &
                                 rr:ROOM-dom(agency_hotel_bookings) & hh:HOTEL & rooms_hotel(rr)=hh
                THEN
                  agency_hotel_bookings(rr) := session_user(sid) ||
                  users_hotel(session_user(sid)) := hh  ||
                  session_response(sid) := done ||
                  resp := done
                END
              ELSE
                session_response(sid) := impossible ||
                resp := impossible
              END
            WHEN session_user(sid):dom(users_hotel)
            THEN
              IF (dom(agency_hotel_bookings)/\ rooms_hotel~[{users_hotel(session_user(sid))}]) /=
                  rooms_hotel~[{users_hotel(session_user(sid))}]
              THEN
                ANY rr WHERE rr: ROOM & rr:ROOM-dom(agency_hotel_bookings) &
                             rooms_hotel(rr)=users_hotel(session_user(sid))
                THEN
                  agency_hotel_bookings(rr) := session_user(sid) ||
                  session_response(sid) := done ||
                  resp := done
                END
              ELSE
                session_response(sid) := impossible ||
                resp := impossible
              END
        END
      END
    END;

    resp <-- respBookCar(sid)=
        PRE sid:SESSION
        THEN
          SELECT sid:dom(session_card) & session_state(sid)=s3 & session_request(sid)=bc
          THEN
            session_state(sid) := s4 ||
            SELECT session_user(sid)/:dom(users_rental)
            THEN
              IF dom(agency_rental_bookings) <<: CAR
              THEN
                ANY cc, re WHERE cc:CAR-dom(agency_rental_bookings) & re:CAR_RENT & cars_rental(cc)=re
                THEN
                  agency_rental_bookings(cc) := session_user(sid) ||
                  users_rental(session_user(sid)) := re ||
                  session_response(sid) := done ||
                  resp := done
                END
              ELSE
                session_response(sid) := impossible ||
                resp := impossible
              END
            WHEN session_user(sid):dom(users_rental)
            THEN
              IF (dom(agency_rental_bookings) /\ cars_rental~[{users_rental(session_user(sid))}]) /=
                   cars_rental~[{users_rental(session_user(sid))}]
              THEN
                ANY cc WHERE cc:CAR-dom(agency_rental_bookings) & cars_rental(cc)=users_rental(session_user(sid))
                THEN
                  agency_rental_bookings(cc) := session_user(sid) ||
                  session_response(sid) := done ||
                  resp := done
                END
              ELSE
                session_response(sid) := impossible ||
                resp := impossible
              END
        END
      END
    END;

    resp <-- respUnbookRoom(sid)=
        PRE sid:SESSION
        THEN
          SELECT sid:dom(session_card) & session_state(sid)=s3 & session_request(sid)=ur
          THEN
            session_state(sid) := s4 ||
            IF session_user(sid):ran(agency_hotel_bookings)
            THEN
              ANY rr WHERE rr:dom(agency_hotel_bookings) & agency_hotel_bookings(rr)=session_user(sid)
              THEN
                agency_hotel_bookings := {rr} <<| agency_hotel_bookings ||
                session_response(sid) := done ||
                IF agency_hotel_bookings~[{session_user(sid)}] = {rr}
                THEN users_hotel := {session_user(sid)} <<| users_hotel END ||
                resp := done
              END
            ELSE
              session_response(sid) := impossible ||
              resp := impossible
            END
          END
        END;

    resp <-- respUnbookCar(sid)=
        PRE sid:SESSION
        THEN
          SELECT sid:dom(session_card) & session_state(sid)=s3 & session_request(sid)=uc
          THEN
            session_state(sid) := s4 ||
            IF session_user(sid):ran(agency_rental_bookings)
            THEN
              ANY cc WHERE cc:dom(agency_rental_bookings) & agency_rental_bookings(cc)=session_user(sid)
              THEN
                agency_rental_bookings := {cc} <<| agency_rental_bookings ||
                session_response(sid) := done ||
                IF agency_rental_bookings~[{session_user(sid)}] = {cc}
                THEN users_rental := {session_user(sid)} <<| users_rental END ||
                resp := done
              END
            ELSE
              session_response(sid) := impossible ||
              resp := impossible
            END
          END
        END;

  again(sid)=
        PRE sid:SESSION
        THEN
          SELECT sid:dom(session_card) & session_state(sid)=s4
          THEN
            session_state(sid) := s1 ||
            session_request(sid) := none ||
            session_response(sid) := undef ||
            session_card(sid) := unknown
          END
        END;

    logout(sid)=
        PRE sid:SESSION
        THEN
          SELECT sid:dom(session_card) & (session_state(sid)=s4 or (session_state(sid)=s2 & session_card(sid)=wrong))
          THEN
            /*session := session - {sid} ||*/
            session_user := {sid} <<| session_user ||
            session_response := {sid} <<| session_response ||
            session_card := {sid} <<| session_card ||
            session_state := {sid} <<| session_state ||
            session_request := {sid} <<| session_request
          END
        END;
        

    pickShop(sid) = PRE sid:SESSION THEN skip END
/*
    sendHotelRequest(sid,hh) =  PRE sid:SESSION & hh:HOTEL    THEN skip END;
    sendRentalRequest(sid,rr) = PRE sid:SESSION & rr:CAR_RENT THEN skip END;

    recvRequestHotel(hh) =  PRE hh:HOTEL    THEN skip END;
    recvRequestRental(rr) = PRE rr:CAR_RENT THEN skip END;

    bookRoom(hh) = PRE hh:HOTEL    THEN skip END;
    bookCar(rr) =  PRE rr:CAR_RENT THEN skip END;

    unbookRoom(hh) = PRE hh:HOTEL    THEN skip END;
    unbookCar(rr) =  PRE rr:CAR_RENT THEN skip END;

    replyRequestHotel(hh) =  PRE hh:HOTEL     THEN skip END;
    replyRequestRental(rr) = PRE rr:CAR_RENT  THEN skip END;

    recvReplyHotel(hh) =  PRE hh:HOTEL    THEN skip END;
    recvReplyRental(rr) = PRE rr:CAR_RENT THEN skip END*/

 END
