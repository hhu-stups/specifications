MACHINE Constants 
SETS
	ROUTEELEMENT = {route_el1,route_el2}
CONSTANTS
	m25, xx
PROPERTIES
	m25: ROUTEELEMENT & xx: POW(ROUTEELEMENT) & xx = {m25}
VARIABLES
    pp
INVARIANT
   pp : ROUTEELEMENT
INITIALISATION
   pp := m25
OPERATIONS
   pp_eq_m25 = PRE pp=m25 THEN skip END
END