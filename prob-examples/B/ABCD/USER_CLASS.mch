MACHINE  USER_CLASS	/* U2B4 */


EXTENDS
	CAR_CLASS, ROOM_CLASS
SETS
	USER; USER_STATE = {s0,s1,s2,s3,s4,s5,s6}
DEFINITIONS
	disjoint(f)==!(a1,a2).( a1:dom(f) & a2:dom(f) & a1/=a2 =>  f(a1)/\f(a2)={} )
VARIABLES
	carbookings, roombookings, user_state, resp
INVARIANT
	carbookings : USER --> POW(CAR) & 
	disjoint(carbookings) & 
	roombookings : USER --> POW(ROOM) & 
	disjoint(roombookings) & 
	user_state : USER --> (USER_STATE) & 
	resp : USER --> (BOOL)
INITIALISATION
	carbookings :: USER --> POW(CAR) || 
	roombookings :: USER --> POW(ROOM) || 
	user_state :: USER --> {s0} || 
	resp :: USER --> BOOL
OPERATIONS
BookHotel(thisUSER)=
PRE
	thisUSER : USER
THEN
	SELECT	user_state(thisUSER)=s1
	THEN	user_state(thisUSER):=s2
	END || 
	IF union(ran(roombookings))/=ROOM
	THEN 
	    ANY rm WHERE rm:ROOM-union(ran(roombookings))
	   THEN roombookings(thisUSER):=roombookings(thisUSER)\/{rm} END ||
	    resp(thisUSER):=TRUE
	ELSE resp(thisUSER):=FALSE
	END
END
;
BookCar(thisUSER)=
PRE
	thisUSER : USER
THEN
	SELECT	user_state(thisUSER)=s1
	THEN	user_state(thisUSER):=s4
	END || 
	IF union(ran(carbookings))/=CAR
	THEN 
	    ANY cr WHERE cr:CAR-union(ran(carbookings))
	   THEN carbookings(thisUSER):=carbookings(thisUSER)\/{cr} END ||
	    resp(thisUSER):=TRUE
	ELSE resp(thisUSER):=FALSE
	END
END
;
CancelHotel(thisUSER)=
PRE
	thisUSER : USER
THEN
	SELECT	user_state(thisUSER)=s1
	THEN	user_state(thisUSER):=s3
	END || 
	IF roombookings(thisUSER)/={} THEN
	    ANY rm WHERE rm:roombookings(thisUSER) 
	    THEN roombookings(thisUSER):=roombookings(thisUSER)-{rm} END ||
	    resp(thisUSER):=TRUE
	ELSE
	    resp(thisUSER):=FALSE
	END
END
;
CancelCar(thisUSER)=
PRE
	thisUSER : USER
THEN
	SELECT	user_state(thisUSER)=s1
	THEN	user_state(thisUSER):=s5
	END || 
	IF carbookings(thisUSER)/={} THEN
	    ANY cr WHERE cr:carbookings(thisUSER) 
	    THEN carbookings(thisUSER):=carbookings(thisUSER)-{cr} END ||
	    resp(thisUSER):=TRUE
	ELSE
	    resp(thisUSER):=FALSE
	END
END
;
rr <-- Response(thisUSER)=
PRE
	thisUSER : USER
THEN
	SELECT	user_state(thisUSER)=s2
	THEN	user_state(thisUSER):=s6
	WHEN	user_state(thisUSER)=s3
	THEN	user_state(thisUSER):=s6
	WHEN	user_state(thisUSER)=s4
	THEN	user_state(thisUSER):=s6
	WHEN	user_state(thisUSER)=s5
	THEN	user_state(thisUSER):=s6
	END || 
	rr:=resp(thisUSER)
END
;
Again(thisUSER)=
PRE
	thisUSER : USER
THEN
	SELECT	user_state(thisUSER)=s6
	THEN	user_state(thisUSER):=s1
	END
END
;
Logout(thisUSER)=
PRE
	thisUSER : USER
THEN
	SELECT	user_state(thisUSER)=s6
	THEN	user_state(thisUSER):=s0
	END
END
;
login(thisUSER)=
PRE
	thisUSER : USER
THEN
	SELECT	user_state(thisUSER)=s0
	THEN	user_state(thisUSER):=s1
	END
END
END

