MACHINE RouteIsSet 
SETS
	ROUTEELEMENT = { A34, M4, Oxford, Swindon, Newbury }
VARIABLES
	Route
INITIALISATION
	   Route := {} 
INVARIANT
	Route : POW(ROUTEELEMENT) 
OPERATIONS
 AddElement (TheRouteElement) =
PRE
	TheRouteElement:ROUTEELEMENT
THEN
	Route := Route \/ { TheRouteElement }
END
END
