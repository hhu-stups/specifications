MODEL elevator0
CONSTANTS N
PROPERTIES (N : NATURAL1)
VARIABLES phyElevatorFloor
INVARIANT (phyElevatorFloor : (0 .. N)) & phyElevatorFloor:INTEGER

DEFINITIONS
SET_PREF_SHOW_EVENTB_ANY_VALUES==TRUE 
INITIALISATION phyElevatorFloor :: (0 .. N)
OPERATIONS
 moveToFloor = ANY floor WHERE (floor : (0 .. N)) THEN phyElevatorFloor := floor END 
END