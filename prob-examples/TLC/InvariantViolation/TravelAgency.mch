MACHINE  TravelAgency
/* contains an error that can be found by model checking */
/* machine developed by Carla Ferreira (the final machine contains no errors) */
SETS
    USER = {user1,user2};
    SESSION = {sess1,sess2, sess3};
    SESSION_REQUEST = {bc, br, uc, ur, none};
    SESSION_STATE = {s0, s1, s2, s3, s4, s5, s6, s7};
    HOTEL = {h1, h2, noHotel};
    CAR_RENT = {c1, c2, noCarRent};
    CARD = {valid, wrong, unknown};
    ROOM = {h1a, h1b, h2a, h2b};
    CAR = {c1a, c1b, c2a, c2b};
    RESP = {done, impossible, undef}

CONSTANTS
    AGENCY_USER

PROPERTIES
    AGENCY_USER <: USER & AGENCY_USER /= {}

VARIABLES
    session,
    session_response,
    session_card,
    session_state,
    session_request,
    user_hotel_bookings,
    user_rental_bookings,
    rooms_hotel,
    cars_rental,
    global_room_bookings,
    global_car_bookings

DEFINITIONS
    rooms_available(h) == (dom(global_room_bookings)/\rooms_hotel~[{h}]) /= rooms_hotel~[{h}];
    cars_available(r) == (dom(global_car_bookings)/\cars_rental~[{r}]) /= cars_rental~[{r}]

INVARIANT

    session: SESSION +-> USER & /*AGENCY_USER & */
    session_response: SESSION +-> RESP &
    session_card: SESSION +->  CARD &
    session_state: SESSION +->  SESSION_STATE &
    session_request: SESSION +->  SESSION_REQUEST &
    user_hotel_bookings: USER +-> HOTEL & /* AGENCY_USER +->  HOTEL & */
    user_rental_bookings: USER +->  CAR_RENT & /* AGENCY_USER +->  CAR_RENT & */
    rooms_hotel: ROOM --> HOTEL &
    cars_rental: CAR --> CAR_RENT &
    global_room_bookings: ROOM >+> USER  &
    global_car_bookings: CAR >+> USER &


    dom(session)=dom(session_response) & dom(session)=dom(session_card) &
    dom(session)=dom(session_state) & dom(session)=dom(session_request) &

    dom(user_hotel_bookings)=dom(user_rental_bookings) &

    ran(session) <: dom(user_hotel_bookings)
    
    &

         
         ( sess1:dom(session) & session_card(sess1) /= valid =>
            session_response(sess1) = undef )
    


INITIALISATION

    session := {} ||
    session_response := {} ||
    session_card := {} ||
    session_state := {} ||
    session_request := {} ||
    user_hotel_bookings := {} ||
    user_rental_bookings := {} ||
    rooms_hotel := {h1a |-> h1, h1b |-> h1, h2a |-> h2, h2b |-> h2} ||
    cars_rental := {c1a |-> c1, c1b |-> c1, c2a |-> c2, c2b |-> c2} ||
    /* global_room_bookings : ( global_room_bookings : ROOM >+>USER ) ||
    global_car_bookings : ( global_car_bookings : CAR >+> USER ) */
    global_room_bookings := {} ||
    global_car_bookings := {}


OPERATIONS

    sid_ <-- login(uu) =
    PRE uu : USER /* AGENCY_USER */
    THEN
      SELECT uu : dom(user_hotel_bookings) /* New session for a known user */
      THEN
        skip
      WHEN uu /: dom(user_hotel_bookings)  /* A new user - information needs to be created */
      THEN
        user_hotel_bookings(uu) := noHotel ||
        user_rental_bookings(uu) := noCarRent
      END
      ||
      ANY sid WHERE sid : SESSION & sid /: dom(session)  /* Creating a new session for the user */
      THEN
        session(sid) := uu ||
        session_response(sid) := undef ||
        session_card(sid) := unknown ||
        session_state(sid) := s1 ||
        session_request(sid) := none ||
    sid_ := sid
      END
    END;

   bookRoom(sid)=
    PRE sid : SESSION
        THEN
          SELECT sid:dom(session) & session_state(sid) = s1 & session_request(sid) = none
          THEN
            session_state(sid) := s3 ||
            session_request(sid) := br
          END
        END;

    bookCar(sid)=
    PRE sid : SESSION
        THEN
          SELECT sid:dom(session) & session_state(sid) = s1 & session_request(sid) = none
          THEN
            session_state(sid) := s5 ||
            session_request(sid) := bc
          END
        END;

    unbookRoom(sid)=
    PRE sid : SESSION
        THEN
          SELECT sid:dom(session) & session_state(sid) = s1 & session_request(sid) = none
          THEN
            session_state(sid) := s2 ||
            session_request(sid) := ur
          END
        END;

    unbookCar(sid)=
    PRE sid : SESSION
        THEN
          SELECT sid:dom(session) & session_state(sid) = s1  & session_request(sid) = none
          THEN
            session_state(sid) := s4 ||
            session_request(sid) := uc
          END
        END;

    enterCard(sid)=
        PRE sid : SESSION
        THEN
          SELECT sid:dom(session) & session_state(sid) : {s2,s3,s4,s5}
          THEN
            session_state(sid) := s6 ||
            ANY cc WHERE cc: (CARD-{unknown})
            THEN
              session_card(sid) := cc
            END
          END
        END;

    retryCard(sid)=
        PRE  sid : SESSION
        THEN
          SELECT sid:dom(session) & session_state(sid) = s6 & session_card(sid) = wrong
          THEN
            ANY cc WHERE cc: (CARD-{unknown})
            THEN
              session_card(sid) := cc
            END
          END
        END;

            
    response(sid)=
        PRE sid : SESSION
        THEN
          SELECT sid:dom(session) & session_state(sid)  = s6
          THEN
            session_state(sid) := s7
          END
          ||
          SELECT session_request(sid) = br & user_hotel_bookings(session(sid)) = noHotel
          THEN
            IF dom(global_room_bookings) <<: ROOM
            THEN
              ANY rr, hh WHERE rr:ROOM-dom(global_room_bookings) & hh:HOTEL & rooms_hotel(rr) = hh
              THEN
                global_room_bookings(rr) := session(sid) ||
                user_hotel_bookings(session(sid)) := hh  ||
                session_response(sid) := done
              END
            ELSE session_response(sid) := impossible
            END
      WHEN session_request(sid) = br & user_hotel_bookings(session(sid)) /= noHotel
          THEN
            IF (dom(global_room_bookings)/\
                 rooms_hotel~[{user_hotel_bookings(session(sid))}]) /=
                   rooms_hotel~[{user_hotel_bookings(session(sid))}]
            THEN
              ANY rr WHERE rr:ROOM-dom(global_room_bookings) & rooms_hotel(rr) = user_hotel_bookings(session(sid))
              THEN
                global_room_bookings := global_room_bookings \/ { rr |-> session(sid)} ||
                session_response(sid) := done
              END
            ELSE
              session_response(sid) := impossible
            END

      WHEN session_request(sid) = bc & user_rental_bookings(session(sid)) = noCarRent
          THEN
            IF dom(global_car_bookings) <<: CAR
            THEN
              ANY cc, re WHERE cc:CAR-dom(global_car_bookings) & re:CAR_RENT & cars_rental(cc) = re
              THEN
                global_car_bookings(cc) := session(sid) ||
                user_rental_bookings(session(sid)) := re  ||
                session_response(sid) := done
              END
            ELSE session_response(sid) := impossible
            END

          WHEN session_request(sid) = bc & user_rental_bookings(session(sid)) /= noCarRent
          THEN
            IF (dom(global_car_bookings) /\ cars_rental~[{user_rental_bookings(session(sid))}]) 
              /= cars_rental~[{user_rental_bookings(session(sid))}]
            THEN
              ANY cc WHERE cc:CAR-dom(global_car_bookings) & cars_rental(cc) = user_rental_bookings(session(sid))
              THEN
                global_car_bookings(cc) := session(sid) ||
                session_response(sid) := done
              END
            ELSE
              session_response(sid) := impossible
            END

          WHEN session_request(sid) = ur
          THEN
            IF session(sid) : ran(global_room_bookings)
            THEN
              ANY rr WHERE rr:dom(global_room_bookings) & global_room_bookings(rr) = session(sid)
              THEN
                global_room_bookings := {rr} <<| global_room_bookings ||
                session_response(sid) := done ||
                IF {xx | xx:dom(global_room_bookings) & global_room_bookings(xx) = session(sid)} = {rr}
                THEN user_hotel_bookings(session(sid)) := noHotel END
              END
            ELSE
              session_response(sid) := impossible
            END

          WHEN session_request(sid) = uc
          THEN
            IF session(sid) : ran(global_car_bookings)
            THEN
              ANY cc WHERE cc:dom(global_car_bookings) & global_car_bookings(cc) = session(sid)
              THEN
                global_car_bookings := {cc} <<| global_car_bookings ||
                session_response(sid) := done ||
                IF {xx | xx:dom(global_car_bookings) & global_car_bookings(xx) = session(sid)} = {cc}
                THEN user_rental_bookings(session(sid)) := noCarRent END
              END
            ELSE
              session_response(sid) := impossible
            END
      END
        END;

   again(sid)=
        PRE sid : SESSION
        THEN
          SELECT sid:dom(session) & session_state(sid)  = s7
          THEN
            session_state(sid) := s1 ||
            session_request(sid) := none ||
            session_response(sid) := undef ||
            session_card(sid) := unknown
          END
        END;

    logout(sid)=
        PRE sid : SESSION
        THEN
          SELECT sid:dom(session) & session_state(sid) : {s6,s7}
          THEN
            session := {sid} <<| session ||
            session_response := {sid} <<| session_response ||
            session_card := {sid} <<| session_card ||
            session_state := {sid} <<| session_state ||
            session_request := {sid} <<| session_request
          END
        END

END

