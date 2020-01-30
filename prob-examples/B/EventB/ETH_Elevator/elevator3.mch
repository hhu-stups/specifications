MODEL elevator3
SETS CABLE_COMMAND={CABLE_WINDING,CABLE_UNWINDING,CABLE_STOP}
CONSTANTS N,bool2Num2
PROPERTIES (N : NATURAL1) & (bool2Num2 : ((BOOL * BOOL) --> NATURAL)) & (bool2Num2((TRUE |-> FALSE)) = 2) & ! b.((b : BOOL) => ((b : BOOL) => (bool2Num2((FALSE |-> b)) = 1))) & (bool2Num2((TRUE |-> TRUE)) = 0)
VARIABLES phyCableEngineStatus,phyElevatorBetweenFloors,phyElevatorFloor
INVARIANT (phyElevatorFloor : (0 .. N)) & (phyElevatorBetweenFloors : BOOL) & (phyCableEngineStatus : CABLE_COMMAND) & ((phyCableEngineStatus = CABLE_STOP) => (phyElevatorBetweenFloors = FALSE)) & phyCableEngineStatus:CABLE_COMMAND & phyElevatorBetweenFloors:BOOL & phyElevatorFloor:INTEGER
ASSERTIONS (bool2Num2((FALSE |-> FALSE)) = 1) & (bool2Num2((FALSE |-> TRUE)) = 1)

DEFINITIONS
SET_PREF_SHOW_EVENTB_ANY_VALUES==TRUE 
INITIALISATION phyElevatorFloor :: (0 .. N) || phyElevatorBetweenFloors := FALSE || phyCableEngineStatus := CABLE_STOP
OPERATIONS
 elevatorReachesFloorUp = SELECT (phyCableEngineStatus = CABLE_WINDING) & (phyElevatorBetweenFloors = TRUE) THEN phyElevatorFloor := (1 + phyElevatorFloor) || phyElevatorBetweenFloors := FALSE END ;
 elevatorLeavesFloorUp = SELECT (phyElevatorBetweenFloors = FALSE) & (phyElevatorFloor /= N) THEN phyElevatorBetweenFloors := TRUE || phyCableEngineStatus := CABLE_WINDING END ;
 elevatorReachesFloorDown = SELECT (phyCableEngineStatus = CABLE_UNWINDING) & (phyElevatorBetweenFloors = TRUE) THEN phyElevatorBetweenFloors := FALSE END ;
 elevatorLeavesFloorDown = SELECT (phyElevatorBetweenFloors = FALSE) & (phyElevatorFloor /= 0) THEN phyElevatorFloor := (phyElevatorFloor - 1) || phyElevatorBetweenFloors := TRUE || phyCableEngineStatus := CABLE_UNWINDING END ;
 stopCableEngine = SELECT (phyCableEngineStatus /= CABLE_STOP) & (phyElevatorBetweenFloors = FALSE) THEN phyCableEngineStatus := CABLE_STOP END 
END