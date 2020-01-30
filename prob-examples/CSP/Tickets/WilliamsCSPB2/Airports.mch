MACHINE           Airports

SETS              AIRPORT = {LGW, SOU, AMS}
		
VARIABLES         flights

INVARIANT         flights : AIRPORT <-> AIRPORT 

INITIALISATION    flights := {}

OPERATIONS

  link(a1 , a2) = 
  PRE a1 : AIRPORT & a2 : AIRPORT & not (a2 = a1)
  THEN flights := flights \/ {a1 |-> a2}
  END;

  break(a1 , a2) = 
  PRE a1 : AIRPORT & a2 : AIRPORT & a1 |-> a2:flights
  THEN flights := flights - {a1 |-> a2}
  END

END
