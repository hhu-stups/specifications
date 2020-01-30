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
CONSTANTS
	PLACEELEMENT,
	ROADELEMENT,
	
	ROADSEGMENT,
	INSERTEDROAD,
	PLACESEGMENT
PROPERTIES
	   ROADSEGMENT = {segment0} & PLACESEGMENT = {placesegment0} & INSERTEDROAD = {insertedroad0}
	   
	    & PLACEELEMENT = {placelement0} &
    PLACEELEMENT: POW(ROUTEELEMENT) & ROADELEMENT: POW(ROUTEELEMENT) &
	ROADELEMENT = {roadelement0} &
    
    
	ROUTEELEMENT = ROADELEMENT \/ PLACEELEMENT &
	  ROADELEMENT /\ PLACEELEMENT = {} & PLACEELEMENT = {placelement0} & 
	
	ROADSEGMENT: POW(SEGMENT) & INSERTEDROAD: POW(SEGMENT) & PLACESEGMENT: POW(SEGMENT) 
	   &
	 SEGMENT = ROADSEGMENT \/ INSERTEDROAD \/ PLACESEGMENT &
	  ROADSEGMENT /\ INSERTEDROAD = {} &
	  ROADSEGMENT /\ PLACESEGMENT = {} &
	  INSERTEDROAD /\ PLACESEGMENT = {} 
	
DEFINITIONS
    INV == (	SyntacticallyValidProposedRoute : PROPOSEDROUTE --> BOOL &
	ValidProposedRoute : PROPOSEDROUTE --> BOOL
	
	&
	
	Connects : PLACEONROAD --> POW1(ROUTEELEMENT) &
	
	
	union(ran(Connects)) = ROUTEELEMENT
	 )
VARIABLES
	SyntacticallyValidProposedRoute,
	ValidProposedRoute,
	Connects
INVARIANT
    INV
INITIALISATION
   
	SyntacticallyValidProposedRoute,
	ValidProposedRoute,
	Connects: (INV)
	
OPERATIONS
 Convert (thisPROPOSEDROUTE) =
PRE
	thisPROPOSEDROUTE:PROPOSEDROUTE
THEN
	skip
END
;
 ExpandRoute (thisPROPOSEDROUTE) =
PRE
	thisPROPOSEDROUTE:PROPOSEDROUTE
THEN
	skip
END
;
 FindWhole (thisEXPANDEDROUTE) =
PRE
	thisEXPANDEDROUTE:EXPANDEDROUTE
THEN
	skip
END
;
 FindFinal (thisEXPANDEDROUTE) =
PRE
	thisEXPANDEDROUTE:EXPANDEDROUTE
THEN
	skip
END
;
 FindInitial (thisEXPANDEDROUTE) =
PRE
	thisEXPANDEDROUTE:EXPANDEDROUTE
THEN
	skip
END
;
 CreateSegment (thisSEGMENT) =
PRE
	thisSEGMENT:SEGMENT
THEN
	skip
END
END
