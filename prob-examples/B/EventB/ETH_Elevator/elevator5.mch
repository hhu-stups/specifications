MODEL elevator5
SETS CABLE_COMMAND={CABLE_WINDING,CABLE_UNWINDING,CABLE_STOP};DOOR_POSITION={DOOR_OPENED,DOOR_HALF,DOOR_CLOSED};DOOR_COMMAND={DOOR_OPEN,DOOR_CLOSE,DOOR_STOP}
CONSTANTS N,bool2Num2
PROPERTIES (N : NATURAL1) & (bool2Num2 : ((BOOL * BOOL) --> NATURAL)) & (bool2Num2((TRUE |-> FALSE)) = 2) & ! b.((b : BOOL) => ((b : BOOL) => (bool2Num2((FALSE |-> b)) = 1))) & (bool2Num2((TRUE |-> TRUE)) = 0)
VARIABLES phyCableEngineStatus,phyDoorEngineStatus,phyDoorPosition,phyElevatorBetweenFloors,phyElevatorFloor
INVARIANT (phyElevatorFloor : (0 .. N)) & (phyElevatorBetweenFloors : BOOL) & (phyCableEngineStatus : CABLE_COMMAND) & ((phyCableEngineStatus = CABLE_STOP) => (phyElevatorBetweenFloors = FALSE)) & (phyDoorPosition : DOOR_POSITION) & ((phyCableEngineStatus /= CABLE_STOP) => (phyDoorPosition = DOOR_CLOSED)) & (phyDoorEngineStatus : DOOR_COMMAND) & ((phyCableEngineStatus /= CABLE_STOP) => (phyDoorEngineStatus = DOOR_CLOSE)) & ((phyDoorPosition = DOOR_HALF) => (phyDoorEngineStatus /= DOOR_STOP)) & phyCableEngineStatus:CABLE_COMMAND & phyDoorEngineStatus:DOOR_COMMAND & phyDoorPosition:DOOR_POSITION & phyElevatorBetweenFloors:BOOL & phyElevatorFloor:INTEGER
ASSERTIONS (bool2Num2((FALSE |-> FALSE)) = 1) & (bool2Num2((FALSE |-> TRUE)) = 1)

DEFINITIONS
SET_PREF_SHOW_EVENTB_ANY_VALUES==TRUE 
INITIALISATION phyElevatorFloor :: (0 .. N) || phyElevatorBetweenFloors := FALSE || phyCableEngineStatus := CABLE_STOP || phyDoorPosition := DOOR_CLOSED || phyDoorEngineStatus := DOOR_STOP
OPERATIONS
 elevatorReachesFloorUp = SELECT (phyCableEngineStatus = CABLE_WINDING) & (phyElevatorBetweenFloors = TRUE) THEN phyElevatorFloor := (1 + phyElevatorFloor) || phyElevatorBetweenFloors := FALSE END ;
 elevatorLeavesFloorUp = SELECT (phyElevatorBetweenFloors = FALSE) & (phyElevatorFloor /= N) & (phyDoorPosition = DOOR_CLOSED) & (phyDoorEngineStatus = DOOR_CLOSE) THEN phyElevatorBetweenFloors := TRUE || phyCableEngineStatus := CABLE_WINDING END ;
 elevatorReachesFloorDown = SELECT (phyCableEngineStatus = CABLE_UNWINDING) & (phyElevatorBetweenFloors = TRUE) THEN phyElevatorBetweenFloors := FALSE END ;
 elevatorLeavesFloorDown = SELECT (phyElevatorBetweenFloors = FALSE) & (phyElevatorFloor /= 0) & (phyDoorPosition = DOOR_CLOSED) & (phyDoorEngineStatus = DOOR_CLOSE) THEN phyElevatorFloor := (phyElevatorFloor - 1) || phyElevatorBetweenFloors := TRUE || phyCableEngineStatus := CABLE_UNWINDING END ;
 stopCableEngine = SELECT (phyCableEngineStatus /= CABLE_STOP) & (phyElevatorBetweenFloors = FALSE) THEN phyCableEngineStatus := CABLE_STOP END ;
 doorOpensWhenClosed = SELECT (phyDoorPosition = DOOR_CLOSED) & (phyCableEngineStatus = CABLE_STOP) & (phyDoorEngineStatus = DOOR_STOP) THEN phyDoorPosition := DOOR_HALF || phyDoorEngineStatus := DOOR_OPEN END ;
 doorOpensWhenHalf = SELECT (phyDoorPosition = DOOR_HALF) & (phyDoorEngineStatus = DOOR_OPEN) THEN phyDoorPosition := DOOR_OPENED END ;
 doorClosesWhenOpened = SELECT (phyDoorPosition = DOOR_OPENED) & (phyDoorEngineStatus = DOOR_STOP) THEN phyDoorPosition := DOOR_HALF || phyDoorEngineStatus := DOOR_CLOSE END ;
 doorClosesWhenHalf = SELECT (phyDoorPosition = DOOR_HALF) & (phyDoorEngineStatus = DOOR_CLOSE) THEN phyDoorPosition := DOOR_CLOSED END ;
 stopDoorEngine = SELECT (phyDoorEngineStatus /= DOOR_STOP) & (phyCableEngineStatus = CABLE_STOP) & (phyDoorPosition /= DOOR_HALF) THEN phyDoorEngineStatus := DOOR_STOP END 
END