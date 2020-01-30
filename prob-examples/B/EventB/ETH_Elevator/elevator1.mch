MODEL elevator1
CONSTANTS N
PROPERTIES (N : NATURAL1)
VARIABLES phyElevatorFloor
INVARIANT (phyElevatorFloor : (0 .. N)) & phyElevatorFloor:INTEGER

DEFINITIONS
SET_PREF_SHOW_EVENTB_ANY_VALUES==TRUE 
INITIALISATION phyElevatorFloor :: (0 .. N)
OPERATIONS
 moveToFloorUp = SELECT (phyElevatorFloor /= N) THEN phyElevatorFloor := (1 + phyElevatorFloor) END ;
 moveToFloorDown = SELECT (phyElevatorFloor /= 0) THEN phyElevatorFloor := (phyElevatorFloor - 1) END 
END