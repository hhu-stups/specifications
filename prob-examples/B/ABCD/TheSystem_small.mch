MACHINE  TheSystem_small
 
SETS
        USER = {u1}; /* made finite by mal */
	SESS = {sess1,sess2}; /* made finite by mal */
	U_REQUEST  = {bc,br,uc,ur,       none};
        U_STATE    = {s0,s1,s2,s3,s4,s5,s6,s7};
        HOTEL      = {h1,h2,          noHotel};
        CAR_RENT   = {c1,c2,        noCarRent};
        CARD       = {valid,wrong,    unknown};
        ROOM       = {h1a, h2a};
        CAR        = {c1a, c2a}; 
	RESP       = {done,impossible,undef}
 
VARIABLES

	session,
        respons,
        r_hotel,
        c_rent,
        u_card,
        u_state,
        u_hotel,
        u_rental,
        u_request,
        r_user,
        c_user

INVARIANT

	session:   SESS +-> USER       &  
	respons:   USER --> RESP       &
	r_hotel:   ROOM --> HOTEL      &
        c_rent:    CAR  --> CAR_RENT   &
	u_card:    USER -->  CARD      &	
	u_state:   USER -->  U_STATE   & 	
	u_hotel:   USER -->  HOTEL     &
	u_rental:  USER -->  CAR_RENT  & 
	u_request: USER -->  U_REQUEST & 
        r_user:    ROOM >+>  USER      &
        c_user:    CAR  >+>  USER 
        /* PROB finds counter example to last bit 
        
        initialise_machine
        login(u1)
        bookCar(u1)
        enterCard(u1)
        response(u1)
        again(u1)
        bookCar(u1)
        enterCard(u1)
        response(u1)


        */


INITIALISATION

	session   := {} || /* SESS * { }         || */
	u_state   := USER * {s0}        ||
	u_request := USER * {none}      ||
	u_card    := USER * {unknown}   ||
        u_hotel   := USER * {noHotel}   ||
        u_rental  := USER * {noCarRent} ||
        respons   := USER * {undef}     ||     
	r_hotel   := ({h1a} * {h1}) \/ ({h2a} * {h2}) ||
        c_rent    := ({c1a} * {c1}) \/ ({c2a} * {c2})   ||
     r_user := {} || /* added by mal */
     c_user := {}
 
OPERATIONS

response(uu)=
	PRE uu: USER
        THEN
		SELECT u_state(uu)  = s6
                  THEN u_state(uu) := s7
                END
        ||
                SELECT ((u_request(uu) = br) & (u_hotel(uu) = noHotel))
		THEN
                	IF   dom(r_user) <<: ROOM
                        THEN 
				ANY rr, hh WHERE 
                                 rr: (ROOM-dom(r_user)) & r_hotel(rr) = hh                           
                                THEN
                                 r_user(rr)  := uu  ||
                                 u_hotel(uu) := hh  ||
                                 respons(uu) := done 
                                END
                        ELSE respons(uu) := impossible
                        END

                WHEN ((u_request(uu) = br) & (u_hotel(uu) = h1))
                THEN
			IF (dom(r_user) /\ {h1a})  <<: {h1a} 
                        THEN 
				ANY rr WHERE 
                                 rr: ({h1a}-({h1a} /\ dom(r_user)))                  	
			        THEN
                                 r_user(rr)  := uu  ||  
                                 respons(uu) := done 
                                END
			ELSE respons(uu) := impossible
			END
 
                WHEN ((u_request(uu) = br) & (u_hotel(uu) = h2))
                THEN
                        IF (dom(r_user) /\ {h2a})  <<: {h2a}
                        THEN 
				ANY rr WHERE
                                 rr: ({h2a}-({h2a} /\ dom(r_user)))
                                THEN
                                 r_user(rr)  := uu  ||  
                                 respons(uu) := done
                                END
                        ELSE respons(uu) := impossible  
                	END

		WHEN ((u_request(uu) = bc) & (u_rental(uu) = noCarRent))
                THEN
                        IF   dom(c_user) <<: CAR  
                        THEN ANY ca, re WHERE
                                 ca: (CAR-dom(c_user)) & c_rent(ca) = re 
                             THEN
                                 c_user(ca)   := uu  ||
                                 c_rent(ca) := re  ||
                                 respons(uu) := done
                             END
                        ELSE respons(uu) := impossible
                        END

                WHEN ((u_request(uu) = bc) & (u_rental(uu) = c1))
                THEN
                        IF (dom(c_user) /\ {c1a})  <<: {c1a}
                        THEN 
				ANY ca WHERE
                                 ca: ({c1a}-({c1a} /\ dom(c_user)))
                                THEN
                                 c_user(ca)  := uu ||
				 respons(uu) := done
                                END
                        ELSE respons(uu) := impossible
			END

                WHEN ((u_request(uu) = bc) & (u_rental(uu) = c2))
                THEN
                        IF (dom(c_user) /\ {c2a})  <<: {c2a}
                        THEN 
				ANY ca WHERE
                                 ca: ({c2a}-({c2a} /\ dom(c_user)))
                                THEN
                                 c_user(ca)  := uu ||
				 respons(uu) := done
                                END
                        ELSE respons(uu) := impossible
			END

		WHEN (u_request(uu) = ur) 
                THEN
                        IF   ((ran(r_user)) /\ {uu}) = {uu}  
                        THEN 
				ANY rr WHERE
                                 r_user(rr) = uu  
                                THEN
                                /* dom(r_user) := (dom(r_user))-{rr} || */
                                 r_user := {rr}<<|  r_user  ||
                                 respons(uu) := done
                                END
                        ELSE respons(uu) := impossible
                        END        

		WHEN (u_request(uu) = uc)
                THEN
                        IF   ((ran(c_user)) /\ {uu}) = {uu}
                        THEN 
				ANY ca WHERE
                                 c_user(ca) = uu
                                THEN
                                 /* dom(c_user) := (dom(r_user))-{ca} || */
                                 /* I guess this should be c_user */
                                 c_user :=  {ca}<<| c_user  ||
                                 respons(uu) := done
                                END
                        ELSE respons(uu) := impossible
                        END   
                END                
        END;


bookCar(uu)=
	PRE uu: USER
	THEN
		SELECT u_state(uu)   = s1  &
                       u_request(uu) = none    
		THEN 
		       u_state(uu)   := s5 || 
		       u_request(uu) := bc
		END
	END;  	


bookRoom(uu)=
        PRE uu: USER
        THEN
                SELECT u_state(uu)   = s1  &
                       u_request(uu) = none
                THEN
                       u_state(uu)   := s3 || 
                       u_request(uu) := br
                END
        END;               


unbookCar(uu)=
        PRE uu: USER
        THEN
                SELECT u_state(uu)   = s1  &
                       u_request(uu) = none
                THEN
                       u_state(uu)   := s4 || 
                       u_request(uu) := uc
                END
        END;     


unbookRoom(uu)=
        PRE uu: USER
        THEN
                SELECT u_state(uu)   = s1  &
                       u_request(uu) = none
                THEN
                       u_state(uu)   := s2 ||  
                       u_request(uu) := ur
                END
        END;    


enterCard(uu)= 
	PRE uu: USER 
	THEN
		SELECT u_state(uu)  = s2
		  THEN u_state(uu) := s6
		  WHEN u_state(uu)  = s3
		  THEN u_state(uu) := s6
		  WHEN u_state(uu)  = s4 
        	  THEN u_state(uu) := s6    
		  WHEN u_state(uu)  = s5
        	  THEN u_state(uu) := s6    
		END
	||
		ANY cc WHERE cc: (CARD-{unknown}) 
		THEN u_card(uu) := cc 
		END  
	END; 


retryCard(uu)=
        PRE uu: USER
        THEN
                SELECT 
			u_card(uu)  = wrong  & 
                        u_state(uu) = s6
                THEN
                        ANY cc WHERE cc: (CARD-{unknown})
                        THEN u_card(uu) := cc
                        END
                END
        END;



login(uu)=
	PRE uu: USER
	THEN
        	SELECT  u_state(uu)  = s0
        	  THEN  u_state(uu) := s1
        	END
	||
		ANY sid WHERE
		  (sid : SESS) & 
		  (sid /: dom(session))
		THEN
		   session(sid) := uu
		END  
	END;


again(uu)=
	PRE uu: USER
	THEN	
        	SELECT  u_state(uu)  = s7
        	  THEN  u_state(uu) := s1
        	END
	||
		u_request(uu) := none
	||
		respons(uu) := undef 
	||
		u_card(uu) := unknown 
	||
		IF (ran(r_user) /\ {uu}) = { } 
                THEN u_hotel(uu) := noHotel
		END
	||
		IF (ran(c_user) /\ {uu}) = { }
		THEN u_rental(uu) := noCarRent
		END 
	END;


logout(uu)=
	PRE uu: USER
	THEN
        	SELECT  u_state(uu)  = s6
        	  THEN  u_state(uu) := s0
		WHEN    u_state(uu)  = s7 
                  THEN  u_state(uu) := s0    
        	END
	||
		u_request(uu) := none
	||
		respons(uu) := undef 
	||
		u_card(uu) := unknown 
	||
                IF (ran(r_user) /\ {uu}) = { }
                THEN u_hotel(uu) := noHotel
                END
        ||
                IF (ran(c_user) /\ {uu}) = { }
                THEN u_rental(uu) := noCarRent      
		END
	END

END

