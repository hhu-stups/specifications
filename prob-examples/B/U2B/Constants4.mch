MACHINE Constants 
DEFINITIONS
   INV == 
      (Segments : EXPANDEDROUTE --> (NN +-> SEGMENT))
SETS
	EXPANDEDROUTE = {expr};
	SEGMENT = {seg1};
	NN = {n1,n2,n3}
VARIABLES
    Segments
INVARIANT
    INV
INITIALISATION
   	Segments : (INV)
OPERATIONS
  test = skip
END