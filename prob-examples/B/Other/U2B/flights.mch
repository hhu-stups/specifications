MACHINE /*SYSTEM*/ flights 
/*" U2B3.7.7 generated this component from Package flights 31/03/2004 18:42:43 "*/
SETS
	AIRPORT={LHR,CDG, MUN}; /* ,MUN}; */
	FLIGHT;
	OPERATOR = {op1,op2};
	FLIGHT_STATE={pre_book,booking,expired}
CONSTANTS
	ROUTESEG,
	operator
PROPERTIES
	ROUTESEG:POW(AIRPORT*AIRPORT) & card(ROUTESEG) = 3 & /* ROUTESEG = { LHR |-> CDG, CDG |-> MUN, MUN |-> LHR } & */
	!(aa).(aa:AIRPORT=>(aa|->aa)/:ROUTESEG) &
	operator : ROUTESEG --> OPERATOR 
DEFINITIONS
type_invariant == (
	flight_state : FLIGHT --> FLIGHT_STATE &
	sched : FLIGHT --> POW(ROUTESEG)
) ;
invariant == (type_invariant)
VARIABLES
	flight_state,
	sched
INVARIANT
	invariant
INITIALISATION
	flight_state, sched :(invariant & flight_state = FLIGHT * {pre_book} )

OPERATIONS /*EVENTS*/
 open =
ANY thisFLIGHT WHERE
	thisFLIGHT:FLIGHT
THEN
	SELECT flight_state(thisFLIGHT)=pre_book
	THEN   flight_state(thisFLIGHT):=booking
	END
END
;
 close =
ANY thisFLIGHT WHERE
	thisFLIGHT:FLIGHT
THEN
	SELECT flight_state(thisFLIGHT)=booking
	THEN   flight_state(thisFLIGHT):=expired
	END
END
END

