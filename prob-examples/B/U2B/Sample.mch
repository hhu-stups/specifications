MACHINE Sample 
/*" U2B3.6.11 generated this component from Package Sample "*/
SETS
	ROUTEELEMENT = {route_el};
	PROPOSEDROUTE = {proprout1};
	EXPANDEDROUTE = {exprout1};
	PLACENAME = {placename1};
	PLACEONROAD = {por};
	ROAD = {r1};
	ROADNAME = {rname1};
	SEGMENT = {seg1};
	GEOGRAPHY = {geo1}
CONSTANTS
	PLACEELEMENT,
	PLACESEGMENT,
	ROADELEMENT,
	ROADSEGMENT,
	INSERTEDROAD
PROPERTIES
	PLACEELEMENT : POW(ROUTEELEMENT) &
	PLACESEGMENT : POW(SEGMENT) &
	ROADELEMENT : POW(ROUTEELEMENT) &
	ROADSEGMENT : POW(SEGMENT) &
	INSERTEDROAD : POW(SEGMENT)
VARIABLES
	SyntacticallyValidProposedRoute,
	ValidProposedRoute,
	Route,
	FirstRouteElement,
	LastRouteElement,
	NumberOfRouteElements,
	ValidExpandedRoute,
	Segments,
	FirstSegment,
	LastSegment,
	NumberOfSegments,
	PlaceElement,
	PlaceElementName,
	Place,
	Connects,
	PlaceSegmentName,
	ConnectsAt,
	PlacesOnRoad,
	FirstPlaceOnRoad,
	LastPlaceOnRoad,
	NumberOfPlacesOnRoad,
	ConnectsToSegment,
	RoadName,
	RoadElement,
	RoadSegmentName,
	ConnectsToRoad,
	Road,
	
	/* Constants added: */
	PLACEELEMENT,
	PLACESEGMENT,
	ROADELEMENT,
	ROADSEGMENT,
	INSERTEDROAD
	
INVARIANT
 /* COnstants added: */
	PLACEELEMENT : POW(ROUTEELEMENT) &
	PLACESEGMENT : POW(SEGMENT) &
	ROADELEMENT : POW(ROUTEELEMENT) &
	ROADSEGMENT : POW(SEGMENT) &
	INSERTEDROAD : POW(SEGMENT)
	
	&
	SyntacticallyValidProposedRoute : PROPOSEDROUTE --> BOOL &
	ValidProposedRoute : PROPOSEDROUTE --> BOOL &
	Route : PROPOSEDROUTE --> (NAT1 +-> ROUTEELEMENT) &
	FirstRouteElement : PROPOSEDROUTE --> ROUTEELEMENT &
	LastRouteElement : PROPOSEDROUTE --> ROUTEELEMENT &
	NumberOfRouteElements : PROPOSEDROUTE --> NAT &
	ValidExpandedRoute : EXPANDEDROUTE --> BOOL &
	Segments : EXPANDEDROUTE --> NAT1 +-> SEGMENT &
	FirstSegment : EXPANDEDROUTE --> SEGMENT &
	LastSegment : EXPANDEDROUTE --> SEGMENT &
	NumberOfSegments : EXPANDEDROUTE --> NAT &
	PlaceElement : PLACENAME >->> PLACEELEMENT  &
	PlaceElementName : PLACEELEMENT >->> PLACENAME   &
	Place : PLACEONROAD >->> PLACENAME &
	Connects : PLACEONROAD --> POW1(ROUTEELEMENT) &
	PlaceSegmentName : PLACESEGMENT >->> PLACENAME &
	ConnectsAt : ROAD --> (SEGMENT --> FIN (NAT)) &
	PlacesOnRoad : ROAD --> NAT1 +-> PLACEONROAD &
	FirstPlaceOnRoad : ROAD --> PLACEONROAD &
	LastPlaceOnRoad : ROAD --> PLACEONROAD &
	NumberOfPlacesOnRoad : ROAD --> NAT &
	ConnectsToSegment : ROAD --> POW(SEGMENT) &
	RoadName : ROAD --> ROADNAME &
	RoadElement : ROADNAME >->> ROADELEMENT &
	RoadSegmentName : ROADSEGMENT >->> ROADNAME &
	ConnectsToRoad : SEGMENT --> POW(ROAD) &
	Road : INSERTEDROAD >->> ROAD &
	ROUTEELEMENT = ROADELEMENT \/ PLACEELEMENT  &
	  ROADELEMENT /\ PLACEELEMENT = {} &
	!(thisPROPOSEDROUTE).(thisPROPOSEDROUTE:PROPOSEDROUTE => (
	SyntacticallyValidProposedRoute(thisPROPOSEDROUTE) = TRUE <=>
	  (NumberOfRouteElements(thisPROPOSEDROUTE) > 1 &
	   FirstRouteElement(thisPROPOSEDROUTE) : PLACEELEMENT &
	   LastRouteElement(thisPROPOSEDROUTE) : PLACEELEMENT &
	   FirstRouteElement(thisPROPOSEDROUTE) /= LastRouteElement(thisPROPOSEDROUTE)) &
	  dom (Route(thisPROPOSEDROUTE)) = 1 .. NumberOfRouteElements(thisPROPOSEDROUTE) &
	  !(i).(
	    i : dom (Route(thisPROPOSEDROUTE))
	  =>
	    RouteElements (i) : ROUTEELEMENT
	  ) &
	  FirstRouteElement(thisPROPOSEDROUTE) = Routes (1) &
	  LastRouteElement(thisPROPOSEDROUTE) = Route(thisPROPOSEDROUTE) (NumberOfRouteElements(thisPROPOSEDROUTE)) )) &
	!(thisEXPANDEDROUTE).(thisEXPANDEDROUTE:EXPANDEDROUTE => (
	dom (Segments(thisEXPANDEDROUTE)) = 1 .. NumberOfSegments(thisEXPANDEDROUTE) &
	  !(i).(
	    i : dom (Segments(thisEXPANDEDROUTE))
	  =>
	    Segments(thisEXPANDEDROUTE) (i) : SEGMENT
	  ) &
	  FirstSegment(thisEXPANDEDROUTE) = Segments(thisEXPANDEDROUTE) (1) &
	  LastSegment(thisEXPANDEDROUTE) = Segments(thisEXPANDEDROUTE) (NumberOfSegments(thisEXPANDEDROUTE)) )) &
	union(ran(Connects)) = ROUTEELEMENT &
	!(thisROAD).(thisROAD:ROAD => (
	size (PlacesOnRoad(thisROAD)) > 1 &
	  !(p1, p2).(
	    p1 : ran (PlacesOnRoad(thisROAD)) &
	    p2 : ran (PlacesOnRoad(thisROAD)) &
	    p1 /= p2
	  =>
	    Place(p1) /= Place(p2)
	  ) &
	  !(s, n).(
	    s : SEGMENT &
	    n : NAT
	  =>
	    n : ConnectsAt(thisROAD) (s) <=>
	    (
	      (
	        s : PLACESEGMENT &
	        PlaceSegmentName (s) =
	          PlaceOnRoadName (PlacesOnRoad(thisROAD) (n))
	      )
	      or
	      (
	        s : PLACESEGMENT &
	        PlaceElement (PlaceSegmentName (s)) :
	          Connects (PlacesOnRoad(thisROAD) (n))
	      )
	      or
	      (
	        s : ROADSEGMENT &
	        RoadElement (RoadName(thisROAD) (s)) :
	          Connects (PlacesOnRoad(thisROAD) (n))
	      )
	    )
	  ) &
	  dom (PlacesonRoad) = 1 .. NumberOfPlacesOnRoad(thisROAD) &
	  !(i).(
	    i : dom (PlacesOnRoad(thisROAD))
	  =>
	    PlacesOnRoad(thisROAD) (i) : PLACEONROAD
	  ) &
	  FirstPlaceOnRoad(thisROAD) = PlacesOnRoad(thisROAD) (1) &
	  LastPlaceOnRoad(thisROAD) =
	    PlacesOnRoad(thisROAD) (NumberOfPlacesOnRoad(thisROAD)) &
	  ConnectsAt(thisROAD) (ConnectsToSegment(thisROAD)) /= {} )) &
	!(thisSEGMENT).(thisSEGMENT:SEGMENT => (
	!(r).(
	    r : dom (ConnectsToRoad(thisSEGMENT))
	  =>
	    ConnectsAt (r) (thisSEGMENT) /= {}
	  ) &
	  SEGMENT = ROADSEGMENT \/ INSERTEDROAD \/ PLACESEGMENT &
	  ROADSEGMENT /\ INSERTEDROAD = {} &
	  ROADSEGMENT /\ PLACESEGMENT = {} &
	  INSERTEDROAD /\ PLACESEGMENT = {} ))
INITIALISATION
	SyntacticallyValidProposedRoute :: PROPOSEDROUTE --> BOOL ||
	ValidProposedRoute :: PROPOSEDROUTE --> BOOL ||
	Route :: PROPOSEDROUTE --> (NAT1 +-> ROUTEELEMENT) ||
	FirstRouteElement :: PROPOSEDROUTE --> ROUTEELEMENT ||
	LastRouteElement :: PROPOSEDROUTE --> ROUTEELEMENT ||
	NumberOfRouteElements :: PROPOSEDROUTE --> NAT ||
	ValidExpandedRoute :: EXPANDEDROUTE --> BOOL ||
	Segments :: EXPANDEDROUTE --> (NAT1 +-> SEGMENT) ||
	FirstSegment :: EXPANDEDROUTE --> SEGMENT ||
	LastSegment :: EXPANDEDROUTE --> SEGMENT ||
	NumberOfSegments :: EXPANDEDROUTE --> NAT ||
	PlaceElement :: PLACENAME >->> ROUTEELEMENT /* changed from PLACEELEMENT */ ||
	PlaceElementName :: ROUTEELEMENT /* changed from PLACEELEMENT */ >->> PLACENAME ||
	Place :: PLACEONROAD >->> PLACENAME ||
	Connects : (Connects:PLACEONROAD --> POW1(ROUTEELEMENT) & union(ran(Connects)) = ROUTEELEMENT) ||
	PlaceSegmentName :: SEGMENT >->> PLACENAME  /* PLACESEGMENT replaced by SEGMENT */ ||
	ConnectsAt :: ROAD --> (SEGMENT --> FIN (NAT)) ||
	PlacesOnRoad :: ROAD --> NAT1 +-> PLACEONROAD ||
	FirstPlaceOnRoad :: ROAD --> PLACEONROAD ||
	LastPlaceOnRoad :: ROAD --> PLACEONROAD ||
	NumberOfPlacesOnRoad :: ROAD --> NAT ||
	ConnectsToSegment :: ROAD --> POW(SEGMENT) ||
	RoadName :: ROAD --> ROADNAME ||
	RoadElement :: ROADNAME >->> ROUTEELEMENT /* changed from ROADELEMENT */ ||
	RoadSegmentName :: SEGMENT /* changed from ROADSEGMENT */ >->> ROADNAME ||
	ConnectsToRoad :: SEGMENT --> POW(ROAD) ||
	Road :: SEGMENT /* changed from INSERTEDROAD */ >->> ROAD ||
	/* EXPANDEDROUTE := {} || */
	 /*  PLACENAME := {} || */
	 /*  PLACEONROAD := {} || */
	 /*  PROPOSEDROUTE := {} || */
	  /* ROAD := {} || */
	  /* ROADNAME := {} || */
	  /* ROUTEELEMENT := {} || */
	 /*  SEGMENT := {} || */
	  ROADELEMENT := {} ||
	  PLACEELEMENT := {} ||
	  ROADSEGMENT := {} ||
	  INSERTEDROAD := {} ||
	  PLACESEGMENT := {} ||
	  Connects := {} ||
	  ConnectsToRoad := {} ||
	  ConnectsToSegment := {} ||
	  Place := {} ||
	  PlaceElement := {} ||
	  PlaceElementName := {} ||
	  PlaceSegmentName := {} ||
	  PlacesOnRoad := {} ||
	  Road := {} ||
	  RoadElement := {} ||
	  RoadName := {} ||
	  RoadSegmentName := {}

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
