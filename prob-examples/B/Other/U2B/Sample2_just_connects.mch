MACHINE Sample2_mod
/*" U2B3.6.15 generated this component from Package Sample "*/
SETS
	ROUTEELEMENT={placelement0, roadelement0};
	PROPOSEDROUTE={proposedroute0};
	EXPANDEDROUTE={expandedroute0};
	PLACENAME={placename0};
	PLACEONROAD={placeonroad0};
	ROAD={road0};
	ROADNAME={roadname0};
	SEGMENT={segment0,insertedroad0,placesegment0};
	GEOGRAPHY={geography0}

DEFINITIONS
    INV == (
	Connects : PLACEONROAD --> POW1(ROUTEELEMENT) &
	
	union(ran(Connects)) = ROUTEELEMENT
	       )
	       
VARIABLES
	Connects
INVARIANT
    INV
INITIALISATION
   
	Connects: (INV)
	
OPERATIONS

 TestUnionRanConnects = PRE union(ran(Connects)) = ROUTEELEMENT THEN skip END 

END