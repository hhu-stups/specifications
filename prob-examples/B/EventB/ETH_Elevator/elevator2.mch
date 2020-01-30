MODEL elevator2
CONSTANTS N,bool2Num2
PROPERTIES (N : NATURAL1) & (bool2Num2 : ((BOOL * BOOL) --> NATURAL)) & (bool2Num2((TRUE |-> FALSE)) = 2) & ! b.((b : BOOL) => ((b : BOOL) => (bool2Num2((FALSE |-> b)) = 1))) & (bool2Num2((TRUE |-> TRUE)) = 0)
VARIABLES movingUp,phyElevatorBetweenFloors,phyElevatorFloor
INVARIANT (phyElevatorFloor : (0 .. N)) & (phyElevatorBetweenFloors : BOOL) & (movingUp : BOOL) & (((phyElevatorBetweenFloors = TRUE) & (movingUp = TRUE)) => (phyElevatorFloor /= N)) & movingUp:BOOL & phyElevatorBetweenFloors:BOOL & phyElevatorFloor:INTEGER
ASSERTIONS (bool2Num2((FALSE |-> FALSE)) = 1) & (bool2Num2((FALSE |-> TRUE)) = 1)

DEFINITIONS
SET_PREF_SHOW_EVENTB_ANY_VALUES==TRUE 
INITIALISATION phyElevatorFloor :: (0 .. N) || phyElevatorBetweenFloors := FALSE || movingUp :: BOOL
OPERATIONS
 elevatorReachesFloorUp = SELECT (movingUp = TRUE) & (phyElevatorBetweenFloors = TRUE) THEN phyElevatorFloor := (1 + phyElevatorFloor) || phyElevatorBetweenFloors := FALSE END ;
 elevatorLeavesFloorUp = SELECT (phyElevatorBetweenFloors = FALSE) & (phyElevatorFloor /= N) THEN phyElevatorBetweenFloors := TRUE || movingUp := TRUE END ;
 elevatorReachesFloorDown = SELECT (movingUp = FALSE) & (phyElevatorBetweenFloors = TRUE) THEN phyElevatorBetweenFloors := FALSE END ;
 elevatorLeavesFloorDown = SELECT (phyElevatorBetweenFloors = FALSE) & (phyElevatorFloor /= 0) THEN phyElevatorFloor := (phyElevatorFloor - 1) || phyElevatorBetweenFloors := TRUE || movingUp := FALSE END 
END