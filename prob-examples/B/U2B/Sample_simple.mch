MACHINE
 Sample_simple
SETS
	ROAD = {road1,r2,r3} ;
	SEGMENT = {seg1}
 
VARIABLES
    ConnectsAt, NumberOfPlacesOnRoad
    
INVARIANT 
	NumberOfPlacesOnRoad : ROAD --> NAT &  /* has 384 different initialisations ! */
	ConnectsAt : ROAD --> (SEGMENT +-> FIN (NAT))

INITIALISATION
	/* NumberOfPlacesOnRoad := {} || */
	 NumberOfPlacesOnRoad :: ROAD --> NAT || /*  384 initialisations ! || */
	 ConnectsAt := {}
	 /*	ConnectsAt :: ROAD --> (SEGMENT --> FIN (NAT) ) */
	
OPERATIONS
   cc <-- numberPlaces(rr) = 
      PRE
         rr: ROAD 
      THEN
         cc := NumberOfPlacesOnRoad(rr)
      END
      /*;
      
   cc <-- connects(rr,ss) = 
      PRE
         rr: ROAD & ss: SEGMENT
      THEN
         cc := ConnectsAt(rr,ss)
      END */
      
END