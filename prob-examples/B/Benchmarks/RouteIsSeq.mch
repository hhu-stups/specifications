MACHINE RouteIsSeq 

SETS
	ROUTEELEMENT = { A34, M4, Oxford, Swindon, Newbury }
VARIABLES
	Route
INITIALISATION
	   Route := [] 
INVARIANT
	Route : seq(ROUTEELEMENT) 
OPERATIONS
 AddElement (TheRouteElement) =
PRE
	TheRouteElement:ROUTEELEMENT
THEN
	Route := Route ^ [ TheRouteElement ]
END;

 Inj1 = PRE Route: iseq1(ROUTEELEMENT) THEN skip END ;
 NotInj = PRE Route/: iseq(ROUTEELEMENT) THEN skip END;
 NotInj1 = PRE Route/: iseq1(ROUTEELEMENT) THEN skip END 
 
END
