MODEL elevator11
/*
I have tried putting the various models through the ProB animator.
It seems that starting at level 11 the lift "quasi-deadlocks", i.e., all that can be performed are pushing buttons, but the lift itself does not move.
Is this right, or is there a bug in ProB ?
Did you try putting the models through an animator (Brama ?).

Below is the coverage that ProB obtains for your 11th refinement (i.e., there are 28 ways to press the up-button, 28 for the down-button and 35 for the floor button; but no other event becomes enabled; there are 15 states in total).
I also attach the "classical B" translation that our Plugin generates for elevator11.



NODES
deadlocked:0
invariant_violated:0
open:0
live:15
total:15
TOTAL_OPERATIONS
105
COVERED_OPERATIONS
setup_constants:7
initialise_machine:7
userPressesUpButton:28
userPressesDownButton:28
userPressedFloorButton:35
UNCOVERED_OPERATIONS
elevatorReachesFloorUp
elevatorLeavesFloorUp
elevatorReachesFloorDown
elevatorLeavesFloorDown
stopCableEngine
doorOpensWhenClosed
doorOpensWhenHalf
doorClosesWhenOpened
doorClosesWhenHalf
stopDoorEngine
userReleasesUpButton
userReleaseDownButton
userReleasesFloorButton
upButtonLitOn
upButtonLitOff
downButtonLitOn
downButtonLitOff
floorButtonLitOn
floorButtonLitOff
ctrl_startWindingCableEngine
ctrl_changeDirectionFromUpToDown
ctrl_changeDirectionFromDownToUp
ctrl_startUnwindingCableEngine
ctrl_stopCableEngine
ctrl_startOpeningDoorEngine
ctrl_startClosingDoorEngine
ctrl_stopDoorEngineWhenClosed
ctrl_stopDoorEngineWhenOpened
ctrl_upButtonLitOn
ctrl_upButtonLitOff
ctrl_downButtonLitOn
ctrl_downButtonLitOff
ctrl_floorButtonLitOn
ctrl_floorButtonLitOff
*/
SETS CABLE_COMMAND={CABLE_WINDING,CABLE_UNWINDING,CABLE_STOP};DOOR_POSITION={DOOR_OPENED,DOOR_HALF,DOOR_CLOSED};DOOR_COMMAND={DOOR_OPEN,DOOR_CLOSE,DOOR_STOP}
CONSTANTS N,bool2Num2
PROPERTIES (N : NATURAL1) & (bool2Num2 : ((BOOL * BOOL) --> NATURAL)) & (bool2Num2((TRUE |-> FALSE)) = 2) & ! b.((b : BOOL) => ((b : BOOL) => (bool2Num2((FALSE |-> b)) = 1))) & (bool2Num2((TRUE |-> TRUE)) = 0)
VARIABLES attractedDown,attractedUp,cableEngineCommand,cableEngineStatus,currentFloor,doorEngineCommand,doorEngineStatus,doorPosition,downButtonOn,downButtonPressed,floorButtonOn,floorButtonPressed,goingUp,phyCableEngineStatus,phyDoorEngineStatus,phyDoorPosition,phyDownButtonLit,phyDownButtonPressed,phyElevatorBetweenFloors,phyElevatorFloor,phyFloorButtonLit,phyFloorButtonPressed,phyUpButtonLit,phyUpButtonPressed,requestFloor,upButtonOn,upButtonPressed
INVARIANT (phyElevatorFloor : (0 .. N)) & (phyElevatorBetweenFloors : BOOL) & (phyCableEngineStatus : CABLE_COMMAND) & ((phyCableEngineStatus = CABLE_STOP) => (phyElevatorBetweenFloors = FALSE)) & (phyDoorPosition : DOOR_POSITION) & ((phyCableEngineStatus /= CABLE_STOP) => (phyDoorPosition = DOOR_CLOSED)) & (phyDoorEngineStatus : DOOR_COMMAND) & ((phyCableEngineStatus /= CABLE_STOP) => (phyDoorEngineStatus = DOOR_CLOSE)) & ((phyDoorPosition = DOOR_HALF) => (phyDoorEngineStatus /= DOOR_STOP)) & (cableEngineStatus : CABLE_COMMAND) & (cableEngineCommand : CABLE_COMMAND) & (cableEngineStatus = phyCableEngineStatus) & ((cableEngineCommand /= CABLE_STOP) => (phyDoorPosition = DOOR_CLOSED)) & ((cableEngineCommand /= CABLE_STOP) => (phyDoorEngineStatus = DOOR_CLOSE)) & ((cableEngineCommand = CABLE_STOP) => (phyElevatorBetweenFloors = FALSE)) & (doorPosition : DOOR_POSITION) & (doorEngineStatus : DOOR_COMMAND) & (doorEngineCommand : DOOR_COMMAND) & (doorPosition = phyDoorPosition) & (doorEngineStatus = phyDoorEngineStatus) & ((doorPosition = DOOR_HALF) => (doorEngineCommand /= DOOR_STOP)) & ((doorEngineCommand /= DOOR_CLOSE) => (phyCableEngineStatus = CABLE_STOP)) & ((cableEngineCommand /= CABLE_STOP) => (doorEngineCommand = DOOR_CLOSE)) & (currentFloor : (-1 .. N)) & ((phyElevatorBetweenFloors = TRUE) => (currentFloor = -1)) & ((phyElevatorBetweenFloors = FALSE) => (currentFloor = phyElevatorFloor)) & (phyUpButtonPressed : ((0 .. (N - 1)) --> BOOL)) & (phyUpButtonLit : ((0 .. (N - 1)) --> BOOL)) & (phyDownButtonPressed : ((1 .. N) --> BOOL)) & (phyDownButtonLit : ((1 .. N) --> BOOL)) & (phyFloorButtonPressed : ((0 .. N) --> BOOL)) & (phyFloorButtonLit : ((0 .. N) --> BOOL)) & (upButtonPressed : ((0 .. (N - 1)) --> BOOL)) & (downButtonPressed : ((1 .. N) --> BOOL)) & (floorButtonPressed : ((0 .. N) --> BOOL)) & (upButtonOn : ((0 .. (N - 1)) --> BOOL)) & (downButtonOn : ((1 .. N) --> BOOL)) & (floorButtonOn : ((0 .. N) --> BOOL)) & (upButtonPressed = phyUpButtonPressed) & (downButtonPressed = phyDownButtonPressed) & (floorButtonPressed = phyFloorButtonPressed) & (requestFloor : BOOL) & (attractedUp : BOOL) & (attractedDown : BOOL) & (goingUp : BOOL) & attractedDown:BOOL & attractedUp:BOOL & cableEngineCommand:CABLE_COMMAND & cableEngineStatus:CABLE_COMMAND & currentFloor:INTEGER & doorEngineCommand:DOOR_COMMAND & doorEngineStatus:DOOR_COMMAND & doorPosition:DOOR_POSITION & downButtonOn:POW((INTEGER * BOOL)) & downButtonPressed:POW((INTEGER * BOOL)) & floorButtonOn:POW((INTEGER * BOOL)) & floorButtonPressed:POW((INTEGER * BOOL)) & goingUp:BOOL & phyCableEngineStatus:CABLE_COMMAND & phyDoorEngineStatus:DOOR_COMMAND & phyDoorPosition:DOOR_POSITION & phyDownButtonLit:POW((INTEGER * BOOL)) & phyDownButtonPressed:POW((INTEGER * BOOL)) & phyElevatorBetweenFloors:BOOL & phyElevatorFloor:INTEGER & phyFloorButtonLit:POW((INTEGER * BOOL)) & phyFloorButtonPressed:POW((INTEGER * BOOL)) & phyUpButtonLit:POW((INTEGER * BOOL)) & phyUpButtonPressed:POW((INTEGER * BOOL)) & requestFloor:BOOL & upButtonOn:POW((INTEGER * BOOL)) & upButtonPressed:POW((INTEGER * BOOL))
ASSERTIONS (bool2Num2((FALSE |-> FALSE)) = 1) & (bool2Num2((FALSE |-> TRUE)) = 1)

DEFINITIONS
SET_PREF_SHOW_EVENTB_ANY_VALUES==TRUE 
INITIALISATION phyElevatorFloor := 0 || phyElevatorBetweenFloors := FALSE || phyCableEngineStatus := CABLE_STOP || phyDoorPosition := DOOR_CLOSED || phyDoorEngineStatus := DOOR_STOP || cableEngineStatus := CABLE_STOP || cableEngineCommand := CABLE_STOP || doorPosition := DOOR_CLOSED || doorEngineStatus := DOOR_STOP || doorEngineCommand := DOOR_CLOSE || currentFloor := 0 || phyUpButtonPressed := ((0 .. (N - 1)) * {FALSE}) || phyUpButtonLit := ((0 .. (N - 1)) * {FALSE}) || phyDownButtonPressed := ((1 .. N) * {FALSE}) || phyDownButtonLit := ((1 .. N) * {FALSE}) || phyFloorButtonPressed := ((0 .. N) * {FALSE}) || phyFloorButtonLit := ((0 .. N) * {FALSE}) || upButtonPressed := ((0 .. (N - 1)) * {FALSE}) || downButtonPressed := ((1 .. N) * {FALSE}) || floorButtonPressed := ((0 .. N) * {FALSE}) || upButtonOn := ((0 .. (N - 1)) * {FALSE}) || downButtonOn := ((1 .. N) * {FALSE}) || floorButtonOn := ((0 .. N) * {FALSE}) || requestFloor := FALSE || attractedUp := FALSE || attractedDown := FALSE || goingUp := FALSE
OPERATIONS
 elevatorReachesFloorUp = SELECT (phyCableEngineStatus = CABLE_WINDING) & (phyElevatorBetweenFloors = TRUE) THEN phyElevatorFloor := (1 + phyElevatorFloor) || phyElevatorBetweenFloors := FALSE || currentFloor := (1 + phyElevatorFloor) || requestFloor :: BOOL || attractedUp :: BOOL || attractedDown :: BOOL END ;
 elevatorLeavesFloorUp = SELECT (phyElevatorBetweenFloors = FALSE) & (phyElevatorFloor /= N) & (cableEngineCommand = CABLE_WINDING) THEN phyElevatorBetweenFloors := TRUE || phyCableEngineStatus := CABLE_WINDING || cableEngineStatus := CABLE_WINDING || currentFloor := -1 END ;
 elevatorReachesFloorDown = SELECT (phyCableEngineStatus = CABLE_UNWINDING) & (phyElevatorBetweenFloors = TRUE) THEN phyElevatorBetweenFloors := FALSE || currentFloor := phyElevatorFloor END ;
 elevatorLeavesFloorDown = SELECT (phyElevatorBetweenFloors = FALSE) & (phyElevatorFloor /= 0) & (cableEngineCommand = CABLE_UNWINDING) THEN phyElevatorFloor := (phyElevatorFloor - 1) || phyElevatorBetweenFloors := TRUE || phyCableEngineStatus := CABLE_UNWINDING || cableEngineStatus := CABLE_UNWINDING || currentFloor := -1 || requestFloor :: BOOL || attractedUp :: BOOL || attractedDown :: BOOL END ;
 stopCableEngine = SELECT (phyCableEngineStatus /= CABLE_STOP) & (phyElevatorBetweenFloors = FALSE) THEN phyCableEngineStatus := CABLE_STOP || cableEngineStatus := CABLE_STOP END ;
 doorOpensWhenClosed = SELECT (phyDoorPosition = DOOR_CLOSED) & (phyDoorEngineStatus = DOOR_STOP) & (doorEngineCommand = DOOR_OPEN) THEN phyDoorPosition := DOOR_HALF || phyDoorEngineStatus := DOOR_OPEN || doorPosition := DOOR_HALF || doorEngineStatus := DOOR_OPEN END ;
 doorOpensWhenHalf = SELECT (phyDoorPosition = DOOR_HALF) & (phyDoorEngineStatus = DOOR_OPEN) THEN phyDoorPosition := DOOR_OPENED || doorPosition := DOOR_OPENED END ;
 doorClosesWhenOpened = SELECT (phyDoorEngineStatus = DOOR_STOP) & (phyDoorPosition = DOOR_OPENED) & (phyCableEngineStatus = CABLE_STOP) & (doorEngineCommand = DOOR_OPEN) THEN phyDoorPosition := DOOR_HALF || phyDoorEngineStatus := DOOR_CLOSE || doorPosition := DOOR_HALF || doorEngineStatus := DOOR_CLOSE END ;
 doorClosesWhenHalf = SELECT (phyDoorEngineStatus = DOOR_CLOSE) & (phyDoorPosition = DOOR_HALF) THEN phyDoorPosition := DOOR_CLOSED || doorPosition := DOOR_CLOSED END ;
 stopDoorEngine = SELECT (phyDoorEngineStatus /= DOOR_STOP) & (phyCableEngineStatus = CABLE_STOP) & (phyDoorPosition /= DOOR_HALF) & (cableEngineCommand = CABLE_STOP) THEN phyDoorEngineStatus := DOOR_STOP || doorEngineStatus := DOOR_STOP END ;
 userPressesUpButton = ANY floor WHERE (floor : (0 .. (N - 1))) & (phyUpButtonPressed(floor) = FALSE) THEN phyUpButtonPressed := ({(floor |-> TRUE)} <+ phyUpButtonPressed) || upButtonPressed := ({(floor |-> TRUE)} <+ upButtonPressed) END ;
 userReleasesUpButton = ANY floor WHERE (floor : (0 .. (N - 1))) & (phyUpButtonPressed(floor) = TRUE) THEN phyUpButtonPressed := ({(floor |-> FALSE)} <+ phyUpButtonPressed) || upButtonPressed := ({(floor |-> FALSE)} <+ upButtonPressed) END ;
 userPressesDownButton = ANY floor WHERE (floor : (1 .. N)) & (phyDownButtonPressed(floor) = FALSE) THEN phyDownButtonPressed := ({(floor |-> TRUE)} <+ phyDownButtonPressed) || downButtonPressed := ({(floor |-> TRUE)} <+ downButtonPressed) END ;
 userReleaseDownButton = ANY floor WHERE (floor : (1 .. N)) & (phyDownButtonPressed(floor) = TRUE) THEN phyDownButtonPressed := ({(floor |-> FALSE)} <+ phyDownButtonPressed) || downButtonPressed := ({(floor |-> FALSE)} <+ downButtonPressed) END ;
 userPressedFloorButton = ANY floor WHERE (floor : (0 .. N)) & (phyFloorButtonPressed(floor) = FALSE) THEN phyFloorButtonPressed := ({(floor |-> TRUE)} <+ phyFloorButtonPressed) || floorButtonPressed := ({(floor |-> TRUE)} <+ floorButtonPressed) END ;
 userReleasesFloorButton = ANY floor WHERE (floor : (0 .. N)) & (phyFloorButtonPressed(floor) = TRUE) THEN phyFloorButtonPressed := ({(floor |-> FALSE)} <+ phyFloorButtonPressed) || floorButtonPressed := ({(floor |-> FALSE)} <+ floorButtonPressed) END ;
 upButtonLitOn = ANY floor WHERE (floor : (0 .. (N - 1))) & (phyUpButtonLit(floor) = FALSE) & (upButtonOn(floor) = TRUE) THEN phyUpButtonLit := ({(floor |-> TRUE)} <+ phyUpButtonLit) END ;
 upButtonLitOff = ANY floor WHERE (floor : (0 .. (N - 1))) & (phyUpButtonLit(floor) = TRUE) & (upButtonOn(floor) = FALSE) THEN phyUpButtonLit := ({(floor |-> FALSE)} <+ phyUpButtonLit) END ;
 downButtonLitOn = ANY floor WHERE (floor : (1 .. N)) & (phyDownButtonLit(floor) = FALSE) & (downButtonOn(floor) = TRUE) THEN phyDownButtonLit := ({(floor |-> TRUE)} <+ phyDownButtonLit) END ;
 downButtonLitOff = ANY floor WHERE (floor : (1 .. N)) & (phyDownButtonLit(floor) = TRUE) & (downButtonOn(floor) = FALSE) THEN phyDownButtonLit := ({(floor |-> FALSE)} <+ phyDownButtonLit) END ;
 floorButtonLitOn = ANY floor WHERE (floor : (0 .. N)) & (phyFloorButtonLit(floor) = FALSE) & (floorButtonOn(floor) = TRUE) THEN phyFloorButtonLit := ({(floor |-> TRUE)} <+ phyFloorButtonLit) END ;
 floorButtonLitOff = ANY floor WHERE (floor : (0 .. N)) & (phyFloorButtonLit(floor) = TRUE) & (floorButtonOn(floor) = FALSE) THEN phyFloorButtonLit := ({(floor |-> FALSE)} <+ phyFloorButtonLit) END ;
 ctrl_startWindingCableEngine = SELECT (cableEngineCommand = CABLE_STOP) & (doorPosition = DOOR_CLOSED) & (doorEngineStatus = DOOR_CLOSE) & (doorEngineCommand = DOOR_CLOSE) & (attractedUp = TRUE) & (goingUp = TRUE) & (requestFloor = FALSE) THEN cableEngineCommand := CABLE_WINDING END ;
 ctrl_changeDirectionFromUpToDown = SELECT (cableEngineCommand /= CABLE_UNWINDING) & (doorPosition = DOOR_CLOSED) & (doorEngineStatus = DOOR_CLOSE) & (doorEngineCommand = DOOR_CLOSE) & (attractedDown = TRUE) & (goingUp = TRUE) & (attractedUp = FALSE) & (currentFloor /= -1) THEN goingUp := FALSE || requestFloor :: BOOL END ;
 ctrl_changeDirectionFromDownToUp = SELECT (cableEngineCommand /= CABLE_WINDING) & (doorPosition = DOOR_CLOSED) & (doorEngineStatus = DOOR_CLOSE) & (doorEngineCommand = DOOR_CLOSE) & (attractedUp = TRUE) & (goingUp = FALSE) & (attractedDown = FALSE) & (currentFloor /= -1) THEN goingUp := TRUE || requestFloor :: BOOL END ;
 ctrl_startUnwindingCableEngine = SELECT (cableEngineCommand = CABLE_STOP) & (doorPosition = DOOR_CLOSED) & (doorEngineStatus = DOOR_CLOSE) & (doorEngineCommand = DOOR_CLOSE) & (attractedDown = TRUE) & (goingUp = FALSE) & (requestFloor = FALSE) THEN cableEngineCommand := CABLE_UNWINDING END ;
 ctrl_stopCableEngine = SELECT (cableEngineCommand /= CABLE_STOP) & (currentFloor /= -1) & (requestFloor = TRUE) THEN cableEngineCommand := CABLE_STOP END ;
 ctrl_startOpeningDoorEngine = SELECT (doorEngineCommand = DOOR_STOP) & (cableEngineCommand = CABLE_STOP) & (requestFloor = TRUE) THEN doorEngineCommand := DOOR_OPEN END ;
 ctrl_startClosingDoorEngine = SELECT (doorEngineCommand = DOOR_STOP) & (requestFloor = FALSE) THEN doorEngineCommand := DOOR_CLOSE END ;
 ctrl_stopDoorEngineWhenClosed = SELECT (doorEngineCommand = DOOR_CLOSE) & (doorPosition = DOOR_CLOSED) & (cableEngineCommand = CABLE_STOP) & (cableEngineStatus = CABLE_STOP) & (requestFloor = TRUE) THEN doorEngineCommand := DOOR_STOP END ;
 ctrl_stopDoorEngineWhenOpened = SELECT (doorEngineCommand = DOOR_OPEN) & (doorPosition = DOOR_OPENED) & (cableEngineCommand = CABLE_STOP) & (cableEngineStatus = CABLE_STOP) THEN doorEngineCommand := DOOR_STOP END ;
 ctrl_upButtonLitOn = ANY floor WHERE (floor : (0 .. (N - 1))) & (upButtonOn(floor) = FALSE) & (upButtonPressed(floor) = TRUE) THEN upButtonOn := ({(floor |-> TRUE)} <+ upButtonOn) || requestFloor :: BOOL || attractedUp :: BOOL || attractedDown :: BOOL END ;
 ctrl_upButtonLitOff = SELECT (currentFloor /= N) & (doorPosition /= DOOR_CLOSED) & (upButtonOn(currentFloor) = TRUE) & (goingUp = TRUE) THEN upButtonOn := ({(currentFloor |-> FALSE)} <+ upButtonOn) || requestFloor :: BOOL || attractedUp :: BOOL || attractedDown :: BOOL END ;
 ctrl_downButtonLitOn = ANY floor WHERE (floor : (1 .. N)) & (downButtonOn(floor) = FALSE) & (downButtonPressed(floor) = TRUE) THEN downButtonOn := ({(floor |-> TRUE)} <+ downButtonOn) || requestFloor :: BOOL || attractedUp :: BOOL || attractedDown :: BOOL END ;
 ctrl_downButtonLitOff = SELECT (currentFloor /= 0) & (doorPosition /= DOOR_CLOSED) & (downButtonOn(currentFloor) = TRUE) & (goingUp = FALSE) THEN downButtonOn := ({(currentFloor |-> FALSE)} <+ downButtonOn) || requestFloor :: BOOL || attractedUp :: BOOL || attractedDown :: BOOL END ;
 ctrl_floorButtonLitOn = ANY floor WHERE (floor : (0 .. N)) & (floorButtonOn(floor) = FALSE) & (floorButtonPressed(floor) = TRUE) THEN floorButtonOn := ({(floor |-> TRUE)} <+ floorButtonOn) || requestFloor :: BOOL || attractedUp :: BOOL || attractedDown :: BOOL END ;
 ctrl_floorButtonLitOff = SELECT (doorPosition /= DOOR_CLOSED) & (floorButtonOn(currentFloor) = TRUE) THEN floorButtonOn := ({(currentFloor |-> FALSE)} <+ floorButtonOn) || requestFloor :: BOOL || attractedUp :: BOOL || attractedDown :: BOOL END 
END