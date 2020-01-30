MODEL lift9

DEFINITIONS SET_PREF_SHOW_EVENTB_ANY_VALUES==TRUE 
SETS CABLE_STATUS={CABLE_WINDING,CABLE_UNWINDING,CABLE_STOP};
DOOR_POSITION={OPEN,HALF,CLOSED};
DOOR_ENGINE={DOOR_OPEN,DOOR_CLOSE,DOOR_STOP}

CONSTANTS N,bool_bool2Num

PROPERTIES (N : NATURAL1) & N>2 
& (bool_bool2Num : ((BOOL * BOOL) --> NATURAL)) 
& (bool_bool2Num((TRUE |-> FALSE)) = 2) 
& ! b.((b : BOOL) => ((b : BOOL) => (bool_bool2Num((FALSE |-> b)) = 1))) 
& (bool_bool2Num((TRUE |-> TRUE)) = 0) & (CABLE_WINDING /= CABLE_UNWINDING) 
& (CABLE_WINDING /= CABLE_STOP) & (CABLE_UNWINDING /= CABLE_STOP) 
& (OPEN /= HALF) & (OPEN /= CLOSED) & (HALF /= CLOSED) 
& (DOOR_OPEN /= DOOR_CLOSE) & (DOOR_OPEN /= DOOR_STOP) & (DOOR_CLOSE /= DOOR_STOP)

VARIABLES cabin_between_floors,cabin_buttons,cabin_floor,cable_engine,
door_engine,door_position,down_buttons,floor_sensor,goingUp,up_buttons

INVARIANT (cabin_floor : (0 .. N)) & (cabin_between_floors : BOOL) 
& (cable_engine : CABLE_STATUS) 
& ((cable_engine = CABLE_STOP) => (cabin_between_floors = FALSE)) 
& (door_position : DOOR_POSITION) 
& ((cable_engine /= CABLE_STOP) => (door_position = CLOSED)) 
& (door_engine : DOOR_ENGINE) 
& ((cable_engine /= CABLE_STOP) => (door_engine = DOOR_CLOSE)) 
& ((door_position = HALF) => (door_engine /= DOOR_STOP)) 
& (floor_sensor : (-1 .. N)) 
& ((cabin_between_floors = TRUE) => (floor_sensor = -1)) 
& ((cabin_between_floors = FALSE) => (floor_sensor = cabin_floor)) 
& (up_buttons : ((0 .. (N - 1)) --> BOOL)) & (down_buttons : ((1 .. N) --> BOOL)) 
& (cabin_buttons : ((0 .. N) --> BOOL)) & (goingUp : BOOL)

INITIALISATION cabin_floor := (0) 
|| cabin_between_floors := (FALSE) 
|| cable_engine := (CABLE_STOP) 
|| door_position := (CLOSED) 
|| door_engine := (DOOR_CLOSE) 
|| floor_sensor := (0) 
|| up_buttons := (((0)..((N)-(1)))*({FALSE})) 
|| down_buttons := (((1)..(N))*({FALSE})) 
|| cabin_buttons := (((0)..(N))*({FALSE})) 
|| goingUp := (FALSE)

OPERATIONS
cabinReachesFloorUp = 
SELECT (cable_engine = CABLE_WINDING) 
& (cabin_between_floors = TRUE) 
THEN cabin_floor := ((cabin_floor)+(1)) || cabin_between_floors := (FALSE) 
|| floor_sensor := ((cabin_floor)+(1)) 
END ;

cabinLeavesFloorUp = 
SELECT (cabin_between_floors = FALSE) & (cabin_floor /= N) 
& (door_position = CLOSED) 
& (door_engine = DOOR_CLOSE) 
& (TRUE : ((up_buttons[(cabin_floor .. (N - 1))]) \/ (down_buttons[((cabin_floor + 1) .. N)]) \/ (cabin_buttons[((cabin_floor + 1) .. N)]))) 
& (goingUp = TRUE) & (TRUE /: ((cabin_buttons[{cabin_floor}]) \/ (up_buttons[{cabin_floor}]))) 
THEN cabin_between_floors := (TRUE) || cable_engine := (CABLE_WINDING) 
|| floor_sensor := (-1) 
END ;

cabinReachesFloorDown = 
SELECT (cabin_between_floors = TRUE) & (cable_engine = CABLE_UNWINDING) 
THEN cabin_between_floors := (FALSE) || cabin_floor := ((cabin_floor)-(1)) 
|| floor_sensor := ((cabin_floor)-(1)) 
END ;

cabinLeavesFloorDown = 
SELECT (cabin_between_floors = FALSE) & (cabin_floor /= 0) 
& (door_position = CLOSED) & (door_engine = DOOR_CLOSE) 
& (TRUE : ((up_buttons[(0 .. (cabin_floor - 1))]) \/ (down_buttons[(1 .. cabin_floor)]) \/ (cabin_buttons[(0 .. (cabin_floor - 1))]))) 
& (goingUp = FALSE) & (TRUE /: ((cabin_buttons[{cabin_floor}]) \/ (down_buttons[{cabin_floor}]))) 
THEN cabin_between_floors := (TRUE) || cable_engine := (CABLE_UNWINDING) 
|| floor_sensor := (-1) 
END ;

stopCableEngineWhileDown = 
SELECT (cabin_between_floors = FALSE) & (cable_engine /= CABLE_STOP) 
& (goingUp = FALSE) & (TRUE : ((cabin_buttons[{cabin_floor}]) \/ (down_buttons[{cabin_floor}]))) 
THEN cable_engine := (CABLE_STOP) 
END ;

 stopCableEngineWhileUp = 
SELECT (cabin_between_floors = FALSE) & (cable_engine /= CABLE_STOP) & (goingUp = TRUE) & (TRUE : ((cabin_buttons[{cabin_floor}]) \/ (up_buttons[{cabin_floor}]))) 
THEN cable_engine := (CABLE_STOP) 
END ;

 doorOpenWhenClosedWhenUp = 
SELECT (door_position = CLOSED) & (cable_engine = CABLE_STOP) 
& (door_engine = DOOR_STOP) 
& (TRUE : ((cabin_buttons[{cabin_floor}]) \/ (up_buttons[{cabin_floor}]))) 
& (goingUp = TRUE) 
THEN door_position := (HALF) || door_engine := (DOOR_OPEN) 
END ;

 doorOpenWhenClosedWhenDown = 
SELECT (door_position = CLOSED) & (cable_engine = CABLE_STOP) 
& (door_engine = DOOR_STOP) 
& (TRUE : ((cabin_buttons[{cabin_floor}]) \/ (down_buttons[{cabin_floor}]))) 
& (goingUp = FALSE) 
THEN door_position := (HALF) || door_engine := (DOOR_OPEN) 
END ;

doorOpenWhenHalf = 
SELECT (door_position = HALF) & (door_engine = DOOR_OPEN) 
THEN door_position := (OPEN) 
END ;

doorCloseWhenOpen = 
SELECT (door_position = OPEN) & (door_engine = DOOR_STOP) 
& (((TRUE /: ((cabin_buttons[{cabin_floor}]) \/ (up_buttons[{cabin_floor}]))) 
& (goingUp = TRUE)) or ((TRUE /: ((cabin_buttons[{cabin_floor}]) \/ (down_buttons[{cabin_floor}]))) & (goingUp = FALSE))) 
THEN door_position := (HALF) || door_engine := (DOOR_CLOSE) 
END ;

doorCloseWhenHalf = 
SELECT (door_position = HALF) & (door_engine = DOOR_CLOSE) 
THEN door_position := (CLOSED) 
END ;

stopDoorEngineWhenClosed = 
SELECT (door_engine = DOOR_CLOSE) & (door_position = CLOSED) 
& (cable_engine = CABLE_STOP) 
& (((TRUE : ((cabin_buttons[{cabin_floor}]) \/ (up_buttons[{cabin_floor}]))) 
& (goingUp = TRUE)) or ((TRUE : ((cabin_buttons[{cabin_floor}]) \/ (down_buttons[{cabin_floor}]))) & (goingUp = FALSE))) 
THEN door_engine := (DOOR_STOP) 
END ;

stopDoorEngineWhenOpen = 
SELECT (door_engine = DOOR_OPEN) & (door_position = OPEN) 
& (cable_engine = CABLE_STOP) 
THEN door_engine := (DOOR_STOP) 
END ;

upButtonOn = 
ANY floor WHERE (floor : (0 .. (N - 1))) & (up_buttons(floor) = FALSE) 
THEN up_buttons := ((up_buttons)<+({(floor)|->(TRUE)})) 
END ;

upButtonOff = ANY floor WHERE (floor : (0 .. (N - 1))) & (up_buttons(floor) = TRUE) & (cabin_floor = floor) & (door_position = OPEN) 
THEN up_buttons := ((up_buttons)<+({(floor)|->(FALSE)})) 
END ;

downButtonOn = ANY floor WHERE (floor : (1 .. N)) & (down_buttons(floor) = FALSE) 
THEN down_buttons := ((down_buttons)<+({(floor)|->(TRUE)})) 
END ;

downButtonOff = ANY floor WHERE (floor : (1 .. N)) & (down_buttons(floor) = TRUE) & (cabin_floor = floor) & (door_position = OPEN) 
THEN down_buttons := ((down_buttons)<+({(floor)|->(FALSE)})) 
END ;

cabinButtonOn = ANY floor WHERE (floor : (0 .. N)) & (cabin_buttons(floor) = FALSE) THEN cabin_buttons := ((cabin_buttons)<+({(floor)|->(TRUE)})) 
END ;

cabinButtonOff = ANY floor WHERE (floor : (0 .. N)) & (cabin_buttons(floor) = TRUE) & (cabin_floor = floor) & (door_position = OPEN) 
THEN cabin_buttons := ((cabin_buttons)<+({(floor)|->(FALSE)})) 
END ;

changeDirectionFromUpToDown = 
SELECT (cable_engine /= CABLE_UNWINDING) & (door_position = CLOSED) 
& (door_engine = DOOR_CLOSE) 
& (TRUE : ((up_buttons[(0 .. (cabin_floor - 1))]) \/ (down_buttons[(1 .. cabin_floor)]) \/ (cabin_buttons[(0 .. (cabin_floor - 1))]))) 
& (goingUp = TRUE) 
& (TRUE /: ((up_buttons[(cabin_floor .. (N - 1))]) \/ (down_buttons[((cabin_floor + 1) .. N)]) \/ (cabin_buttons[((cabin_floor + 1) .. N)]))) 
& (cabin_floor /= -1) 
THEN goingUp := (FALSE) 
END ;

 changeDirectionFromDownToUp = 
SELECT (cable_engine /= CABLE_UNWINDING) & (door_position = CLOSED) 
& (door_engine = DOOR_CLOSE) 
& (TRUE : ((up_buttons[(cabin_floor .. (N - 1))]) \/ (down_buttons[((cabin_floor + 1) .. N)]) \/ (cabin_buttons[((cabin_floor + 1) .. N)]))) & (goingUp = FALSE) 
& (TRUE /: ((up_buttons[(0 .. (cabin_floor - 1))]) \/ (down_buttons[(1 .. cabin_floor)]) \/ (cabin_buttons[(0 .. (cabin_floor - 1))]))) & (cabin_floor /= -1) 
THEN goingUp := (TRUE) 
END 
END