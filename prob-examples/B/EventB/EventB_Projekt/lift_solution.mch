MODEL lift_solution

DEFINITIONS SET_PREF_SHOW_EVENTB_ANY_VALUES==TRUE;
Rconv == (N-r);
ANIMATION_FUNCTION ==
( {r,c,i|r:0..N & ((c=2 & i=0) or (c=1 & i=2) or (c=3 & i=9 & r/=0 & r/=N)
		or (c=3 & r=N & i=13) or (c=3 & r=0 & i=14) )} <+
   (
   {r,c,i|r:1..N-1 & (Rconv: dom(up_buttons |> {TRUE}) & down_buttons(Rconv)=FALSE & c=3 & i=7 ) }
    \/
   {r,c,i|r=N & Rconv: dom(up_buttons |> {TRUE}) & c=3 & i=11 }
    \/
   {r,c,i|r=0 & Rconv: dom(down_buttons |> {TRUE}) & c=3 & i=12 }
    \/
   {r,c,i|r:1..N-1 & (Rconv: dom(down_buttons |> {TRUE} ) & up_buttons(Rconv)=FALSE & c=3 & i=8) }
    \/
  {r,c,i|r:1..N-1 & (Rconv: dom(down_buttons |> {TRUE} ) & up_buttons(Rconv)=TRUE & c=3 & i=10) }
    \/
   {r,c,i|r:0..N & (Rconv: dom(cabin_buttons |> {TRUE}) & c=2 & i=1) }
    \/
    {r,c,i|r:0..N & Rconv=cabin_floor & c=1 &
          ((door_position=OPEN & i=3) or (door_position=CLOSED & i=4) or (door_position=HALF & i=3))}
   )
   \/ {r,c,i| r=N+1 & c=1 &
         ((goingUp=TRUE & i=5) or (goingUp=FALSE & i=6)) } );
      ANIMATION_IMG0 == "images/B_CallButtonOff.gif";
      ANIMATION_IMG1 == "images/B_CallButtonOn.gif";
      ANIMATION_IMG2 == "images/LiftEmpty.gif";
      ANIMATION_IMG3 == "images/B_LiftOpen.gif";
      ANIMATION_IMG4 == "images/B_LiftClosed.gif";
      ANIMATION_IMG5 == "images/B_up_arrow.gif";
      ANIMATION_IMG6 == "images/B_down_arrow.gif";
      ANIMATION_IMG7 == "images/B_UpButton_On.gif";
      ANIMATION_IMG8 == "images/B_DownButton_On.gif";
      ANIMATION_IMG9 == "images/B_UpDownButtons_Off.gif";
      ANIMATION_IMG10 == "images/B_UpDownButtons_On.gif";
      ANIMATION_IMG11 == "images/B_CallButtonUp_On.gif";
      ANIMATION_IMG12 == "images/B_CallButtonDown_On.gif";
      ANIMATION_IMG13 == "images/B_CallButtonUp_Off.gif";
      ANIMATION_IMG14 == "images/B_CallButtonDown_Off.gif"


SETS CABLE_STATUS={CABLE_WINDING,CABLE_UNWINDING,CABLE_STOP};
DOOR_POSITION={OPEN,HALF,CLOSED};
DOOR_ENGINE={DOOR_OPEN,DOOR_CLOSE,DOOR_STOP}

CONSTANTS N,bool_bool2Num

PROPERTIES (N : NATURAL1) & N>2
& N:NAT1 /* added to avoid virtual time-outs */
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
SELECT (cabin_between_floors = FALSE)
& (cable_engine /= CABLE_STOP)
& (goingUp = FALSE)
& (TRUE : ((cabin_buttons[{cabin_floor}]) \/ (down_buttons[{cabin_floor}])))
THEN cable_engine := (CABLE_STOP)
END ;

 stopCableEngineWhileUp =
SELECT (cabin_between_floors = FALSE)
& (cable_engine /= CABLE_STOP) & (goingUp = TRUE)
& (TRUE : ((cabin_buttons[{cabin_floor}]) \/ (up_buttons[{cabin_floor}])))
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
ANY lfloor WHERE (lfloor : (0 .. (N - 1))) & (up_buttons(lfloor) = FALSE)
THEN up_buttons := ((up_buttons)<+({(lfloor)|->(TRUE)}))
END ;

upButtonOff = ANY lfloor WHERE (lfloor : (0 .. (N - 1))) & (up_buttons(lfloor) = TRUE) & (cabin_floor = lfloor) & (door_position = OPEN)
THEN up_buttons := ((up_buttons)<+({(lfloor)|->(FALSE)}))
END ;

downButtonOn = ANY lfloor WHERE (lfloor : (1 .. N)) & (down_buttons(lfloor) = FALSE)
THEN down_buttons := ((down_buttons)<+({(lfloor)|->(TRUE)}))
END ;

downButtonOff = ANY lfloor WHERE (lfloor : (1 .. N)) & (down_buttons(lfloor) = TRUE) & (cabin_floor = lfloor) & (door_position = OPEN)
THEN down_buttons := ((down_buttons)<+({(lfloor)|->(FALSE)}))
END ;

cabinButtonOn = ANY lfloor WHERE (lfloor : (0 .. N)) & (cabin_buttons(lfloor) = FALSE) THEN cabin_buttons := ((cabin_buttons)<+({(lfloor)|->(TRUE)}))
END ;

cabinButtonOff = ANY lfloor WHERE (lfloor : (0 .. N)) & (cabin_buttons(lfloor) = TRUE) & (cabin_floor = lfloor) & (door_position = OPEN)
THEN cabin_buttons := ((cabin_buttons)<+({(lfloor)|->(FALSE)}))
END ;

changeDirectionFromUpToDown =
SELECT (cable_engine /= CABLE_UNWINDING) & (door_position = CLOSED)
& (door_engine = DOOR_CLOSE)
& (TRUE : ((up_buttons[(0 .. (cabin_floor - 1))])
\/ (down_buttons[(1 .. cabin_floor)]) \/ (cabin_buttons[(0 .. (cabin_floor - 1))])))
& (goingUp = TRUE)
& (TRUE /: ((up_buttons[(cabin_floor .. (N - 1))])
\/ (down_buttons[((cabin_floor + 1) .. N)]) \/ (cabin_buttons[(cabin_floor .. N)])))
& (cabin_floor /= -1)
THEN goingUp := (FALSE)
END ;

 changeDirectionFromDownToUp =
SELECT (cable_engine /= CABLE_WINDING) & (door_position = CLOSED)
& (door_engine = DOOR_CLOSE)
& (TRUE : ((up_buttons[(cabin_floor .. (N - 1))])
	\/ (down_buttons[((cabin_floor + 1) .. N)])
	\/ (cabin_buttons[((cabin_floor + 1) .. N)])))
& (goingUp = FALSE)
& (TRUE /: ((up_buttons[(0 .. (cabin_floor - 1))])
	\/ (down_buttons[(1 .. cabin_floor)])
	\/ (cabin_buttons[(0 .. cabin_floor)])))
& (cabin_floor /= -1)
THEN goingUp := (TRUE)
END
END
