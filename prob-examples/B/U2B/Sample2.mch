MACHINE Sample 
/*" U2B3.6.15 generated this component from Package Sample "*/
SETS
	ROUTEELEMENT={routeelement0};
	PROPOSEDROUTE={proposedroute0};
	EXPANDEDROUTE={expandedroute0};
	PLACENAME={placename0};
	PLACEONROAD={placeonroad0};
	ROAD={road0};
	ROADNAME={roadname0};
	SEGMENT={segment0};
	GEOGRAPHY={geography0}
	
	;
	PLACEELEMENT = {placelement0};
	ROADELEMENT = {roadelement0} ;
	INSERTEDROAD = {insertedroad0};
	PLACESEGMENT = {placesegment0};
	ROADSEGMENT = {segment0}
/* CONSTANTS
	PLACEELEMENT,
	ROADELEMENT,
	INSERTEDROAD,
	PLACESEGMENT,
	ROADSEGMENT
PROPERTIES
	PLACEELEMENT = {placelement0} &
	ROADELEMENT = {roadelement0} &
	INSERTEDROAD = {insertedroad0} &
	PLACESEGMENT = {placesegment0} &
	ROADSEGMENT = {segment0}
	*/
DEFINITIONS
    INV == (	SyntacticallyValidProposedRoute : PROPOSEDROUTE --> BOOL &
	ValidProposedRoute : PROPOSEDROUTE --> BOOL &
	Route : PROPOSEDROUTE --> (NAT1 +-> ROUTEELEMENT) &
	FirstRouteElement : PROPOSEDROUTE --> ROUTEELEMENT &
	LastRouteElement : PROPOSEDROUTE --> ROUTEELEMENT &
	NumberOfRouteElements : PROPOSEDROUTE --> NAT &
	ValidExpandedRoute : EXPANDEDROUTE --> BOOL &
	Segments : EXPANDEDROUTE --> (NAT1 +-> SEGMENT) &
	FirstSegment : EXPANDEDROUTE --> SEGMENT &
	LastSegment : EXPANDEDROUTE --> SEGMENT &
	NumberOfSegments : EXPANDEDROUTE --> NAT &
	PlaceElement : PLACENAME >->> PLACEELEMENT &
	PlaceElementName : PLACEELEMENT >->> PLACENAME &
	Place : PLACEONROAD >->> PLACENAME &
	Connects : PLACEONROAD --> POW1(ROUTEELEMENT) &
	ConnectsAt : ROAD --> (SEGMENT --> FIN (NAT)) &
	PlacesOnRoad : ROAD --> (NAT1 +-> PLACEONROAD) &
	FirstPlaceOnRoad : ROAD --> PLACEONROAD &
	LastPlaceOnRoad : ROAD --> PLACEONROAD &
	NumberOfPlacesOnRoad : ROAD --> NAT &
	ConnectsToSegment : ROAD --> POW(SEGMENT) &
	RoadName : ROAD --> ROADNAME &
	RoadElement : ROADNAME >->> ROADELEMENT &
	ConnectsToRoad : SEGMENT --> POW(ROAD) &
	Road : INSERTEDROAD >->> ROAD &
	PlaceSegmentName : PLACESEGMENT >->> PLACENAME &
	RoadSegmentName : ROADSEGMENT >->> ROADNAME &
	ROUTEELEMENT = ROADELEMENT \/ PLACEELEMENT &
	  ROADELEMENT /\ PLACEELEMENT = {}
	  
	   &
/*	  
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
	  LastRouteElement(thisPROPOSEDROUTE) = Route(thisPROPOSEDROUTE) (NumberOfRouteElements(thisPROPOSEDROUTE)) ))
	  
	   &

	!(thisEXPANDEDROUTE).(thisEXPANDEDROUTE:EXPANDEDROUTE => (
	dom (Segments(thisEXPANDEDROUTE)) = 1 .. NumberOfSegments(thisEXPANDEDROUTE) &
	  !(i).(
	    i : dom (Segments(thisEXPANDEDROUTE))
	  =>
	    Segments(thisEXPANDEDROUTE) (i) : SEGMENT
	  ) &
	  FirstSegment(thisEXPANDEDROUTE) = Segments(thisEXPANDEDROUTE) (1) &
	  LastSegment(thisEXPANDEDROUTE) = Segments(thisEXPANDEDROUTE) (NumberOfSegments(thisEXPANDEDROUTE)) )) 
	  
	  &

	
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
	  ConnectsAt(thisROAD) (ConnectsToSegment(thisROAD)) /= {} ))
	  
	   &

	   
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
*/
	)
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
	ConnectsAt,
	PlacesOnRoad,
	FirstPlaceOnRoad,
	LastPlaceOnRoad,
	NumberOfPlacesOnRoad,
	ConnectsToSegment,
	RoadName,
	RoadElement,
	ConnectsToRoad,
	Road,
	PlaceSegmentName,
	RoadSegmentName
INVARIANT
    INV
INITIALISATION
   
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
	ConnectsAt,
	PlacesOnRoad,
	FirstPlaceOnRoad,
	LastPlaceOnRoad,
	NumberOfPlacesOnRoad,
	ConnectsToSegment,
	RoadName,
	RoadElement,
	ConnectsToRoad,
	Road,
	PlaceSegmentName,
	RoadSegmentName : (INV)
	
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
