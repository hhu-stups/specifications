
MACHINE Ref3_ControllerSensors_mch_eventb
SETS /* enumerated */
  DOOR_STATE={open,closed,door_moving};
  GEAR_STATE={retracted,extended,gear_moving};
  HANDLE_STATE={up,down};
  PLANE_STATE={ground,flight};
  POSITION={front__,left__,right__};
  SWITCH_STATE={switch_open,switch_closed};
  VALVE_STATE={valve_open,valve_closed};
  STIMULI={open_door_stimulus,close_door_stimulus,retract_gear_stimulus,extend_gear_stimulus,stop_open_door_stimulus,stop_close_door_stimulus,stop_retract_gear_stimulus,stop_extend_gear_stimulus}
ABSTRACT_VARIABLES
  anomaly,
  door_closed,
  door_open,
  gear_extended,
  gear_retracted,
  last_door_action,
  last_gear_action,
  proof_sensors,
  valid_sensors_door_closed,
  valid_sensors_door_open,
  valid_sensors_gear_extended,
  valid_sensors_gear_retracted,
  close_EV,
  extend_EV,
  open_EV,
  retract_EV,
  close_door_valve,
  extend_gear_valve,
  open_door_valve,
  retract_gear_valve,
  door,
  gear
/* PROMOTED OPERATIONS
  env_start_extending,
  env_extend_gear,
  env_retract_gear,
  env_start_retracting,
  env_start_open_door,
  env_open_door,
  env_close_door,
  env_start_close_door,
  env_open_valve_open_door,
  env_close_valve_open_door,
  env_open_valve_close_door,
  env_close_valve_close_door,
  env_open_valve_retract_gear,
  env_close_valve_retract_gear,
  env_open_valve_extend_gear,
  env_close_valve_extend_gear,
  con_set_anomaly_output,
  con_stimulate_open_door_valve,
  con_stop_stimulate_open_door_valve,
  con_stimulate_close_door_valve,
  con_stop_stimulate_close_door_valve,
  con_stimulate_retract_gear_valve,
  con_stop_stimulate_retract_gear_valve,
  con_stimulate_extend_gear_valve,
  con_stop_stimulate_extend_gear_valve,
  sensor_invalid_gear_extended,
  sensor_invalid_gear_retracted,
  sensor_invalid_door_open,
  sensor_invalid_door_closed,
  sensor_invalid_Anomaly */
INVARIANT
    anomaly : BOOL
  & proof_sensors : BOOL
  & close_EV : BOOL
  & extend_EV : BOOL
  & open_EV : BOOL
  & retract_EV : BOOL
  & close_door_valve : VALVE_STATE
  & extend_gear_valve : VALVE_STATE
  & open_door_valve : VALVE_STATE
  & retract_gear_valve : VALVE_STATE
  & /* @Ref3_ControllerSensors:door_closed  */ door_closed : POSITION --> (1 .. 3 --> BOOL)
  & /* @Ref3_ControllerSensors:door_open  */ door_open : POSITION --> (1 .. 3 --> BOOL)
  & /* @Ref3_ControllerSensors:gear_extended  */ gear_extended : POSITION --> (1 .. 3 --> BOOL)
  & /* @Ref3_ControllerSensors:gear_retracted  */ gear_retracted : POSITION --> (1 .. 3 --> BOOL)
  & /* @Ref3_ControllerSensors:last_door_action  */ last_door_action : POW({open_door_stimulus,close_door_stimulus})
  & card(last_door_action) < 2
  & /* @Ref3_ControllerSensors:last_gear_action  */ last_gear_action : POW({extend_gear_stimulus,retract_gear_stimulus})
  & card(last_gear_action) < 2
  & /* @Ref3_ControllerSensors:valid_sensors1  */ valid_sensors_gear_extended : POSITION --> POW(1 .. 3)
  & /* @Ref3_ControllerSensors:valid_sensors2  */ valid_sensors_gear_retracted : POSITION --> POW(1 .. 3)
  & /* @Ref3_ControllerSensors:valid_sensors3  */ valid_sensors_door_open : POSITION --> POW(1 .. 3)
  & /* @Ref3_ControllerSensors:valid_sensors4  */ valid_sensors_door_closed : POSITION --> POW(1 .. 3)
  & (/* @Ref3_ControllerSensors:TEST1  */ anomaly = FALSE & (door(front__) = door_moving or (door(left__) = door_moving or door(right__) = door_moving)) => not(gear(front__) = gear_moving) & (not(gear(left__) = gear_moving) & not(gear(right__) = gear_moving)))
  & (/* @Ref3_ControllerSensors:TEST2  */ anomaly = FALSE & (gear(front__) = gear_moving or (gear(left__) = gear_moving or gear(right__) = gear_moving)) => not(door(front__) = door_moving) & (not(door(left__) = door_moving) & not(door(right__) = door_moving)))
  & /* @Ref2_ControllerOutputs:R41  */ not(open_EV = TRUE & close_EV = TRUE)
  & (/* @Ref2_ControllerOutputs:test1  */ retract_EV = TRUE => open_EV = TRUE)
  & (/* @Ref2_ControllerOutputs:test2  */ extend_EV = TRUE => open_EV = TRUE)
  & (/* @Ref2_ControllerOutputs:TEST1  */ door(front__) = door_moving or (door(left__) = door_moving or door(right__) = door_moving) => not(gear(front__) = gear_moving) & (not(gear(left__) = gear_moving) & not(gear(right__) = gear_moving)))
  & (/* @Ref2_ControllerOutputs:TEST2  */ gear(front__) = gear_moving or (gear(left__) = gear_moving or gear(right__) = gear_moving) => not(door(front__) = door_moving) & (not(door(left__) = door_moving) & not(door(right__) = door_moving)))
  & (/* @Ref1_Valve:test1  */ retract_gear_valve = valve_open => open_door_valve = valve_open)
  & (/* @Ref1_Valve:test2  */ extend_gear_valve = valve_open => open_door_valve = valve_open)
  & (/* @Ref1_Valve:TEST1  */ door(front__) = door_moving or (door(left__) = door_moving or door(right__) = door_moving) => not(gear(front__) = gear_moving) & (not(gear(left__) = gear_moving) & not(gear(right__) = gear_moving)))
  & (/* @Ref1_Valve:TEST2  */ gear(front__) = gear_moving or (gear(left__) = gear_moving or gear(right__) = gear_moving) => not(door(front__) = door_moving) & (not(door(left__) = door_moving) & not(door(right__) = door_moving)))
  & /* @Mch0_GearDoor:inv1  */ gear : POSITION --> GEAR_STATE
  & /* @Mch0_GearDoor:inv2  */ door : POSITION --> DOOR_STATE
INITIALISATION
    BEGIN
         gear := {front__ |-> extended,left__ |-> extended,right__ |-> extended}
      ||
         door := {front__ |-> closed,left__ |-> closed,right__ |-> closed}
      ||
         close_door_valve := valve_closed
      ||
         open_door_valve := valve_closed
      ||
         retract_gear_valve := valve_closed
      ||
         extend_gear_valve := valve_closed
      ||
         open_EV := FALSE
      ||
         close_EV := FALSE
      ||
         retract_EV := FALSE
      ||
         extend_EV := FALSE
      ||
         door_closed := {front__ |-> [TRUE,TRUE,TRUE],left__ |-> [TRUE,TRUE,TRUE],right__ |-> [TRUE,TRUE,TRUE]}
      ||
         door_open := {front__ |-> [FALSE,FALSE,FALSE],left__ |-> [FALSE,FALSE,FALSE],right__ |-> [FALSE,FALSE,FALSE]}
      ||
         gear_extended := {front__ |-> [TRUE,TRUE,TRUE],left__ |-> [TRUE,TRUE,TRUE],right__ |-> [TRUE,TRUE,TRUE]}
      ||
         gear_retracted := {front__ |-> [FALSE,FALSE,FALSE],left__ |-> [FALSE,FALSE,FALSE],right__ |-> [FALSE,FALSE,FALSE]}
      ||
         last_door_action := {}
      ||
         last_gear_action := {}
      ||
         valid_sensors_gear_extended := {front__ |-> {1,2,3},left__ |-> {1,2,3},right__ |-> {1,2,3}}
      ||
         valid_sensors_gear_retracted := {front__ |-> {1,2,3},left__ |-> {1,2,3},right__ |-> {1,2,3}}
      ||
         valid_sensors_door_open := {front__ |-> {1,2,3},left__ |-> {1,2,3},right__ |-> {1,2,3}}
      ||
         valid_sensors_door_closed := {front__ |-> {1,2,3},left__ |-> {1,2,3},right__ |-> {1,2,3}}
      ||
         anomaly := FALSE
      ||
         proof_sensors := FALSE
    END
OPERATIONS
  env_start_extending = 
    SELECT 
        /* @Ref3_ControllerSensors:grd2  */ ran(gear) = {retracted}
      & /* @Ref3_ControllerSensors:grd81  */ ran(door) = {open}
      & /* @Ref3_ControllerSensors:grd3  */ extend_gear_valve = valve_open
      & /* @Ref3_ControllerSensors:grd4  */ retract_gear_valve = valve_closed
      & /* @Ref3_ControllerSensors:proof  */ proof_sensors = FALSE
    THEN 
         gear := {front__ |-> gear_moving,left__ |-> gear_moving,right__ |-> gear_moving}
      ||
         gear_retracted := {front__ |-> [FALSE,FALSE,FALSE],left__ |-> [FALSE,FALSE,FALSE],right__ |-> [FALSE,FALSE,FALSE]}
    END;
  
  env_extend_gear = 
    SELECT 
        /* @Ref3_ControllerSensors:grd2  */ ran(gear) = {gear_moving}
      & /* @Ref3_ControllerSensors:grd3  */ extend_gear_valve = valve_open
      & /* @Ref3_ControllerSensors:grd4  */ retract_gear_valve = valve_closed
      & /* @Ref3_ControllerSensors:proof  */ proof_sensors = FALSE
    THEN 
         gear := {front__ |-> extended,left__ |-> extended,right__ |-> extended}
      ||
         gear_extended := {front__ |-> [TRUE,TRUE,TRUE],left__ |-> [TRUE,TRUE,TRUE],right__ |-> [TRUE,TRUE,TRUE]}
    END;
  
  env_retract_gear = 
    SELECT 
        /* @Ref3_ControllerSensors:grd2  */ ran(gear) = {gear_moving}
      & /* @Ref3_ControllerSensors:grd3  */ retract_gear_valve = valve_open
      & /* @Ref3_ControllerSensors:grd4  */ extend_gear_valve = valve_closed
      & /* @Ref3_ControllerSensors:proof  */ proof_sensors = FALSE
    THEN 
         gear := {front__ |-> retracted,left__ |-> retracted,right__ |-> retracted}
      ||
         gear_retracted := {front__ |-> [TRUE,TRUE,TRUE],left__ |-> [TRUE,TRUE,TRUE],right__ |-> [TRUE,TRUE,TRUE]}
    END;
  
  env_start_retracting = 
    SELECT 
        /* @Ref3_ControllerSensors:grd2  */ ran(gear) = {extended}
      & /* @Ref3_ControllerSensors:grd81  */ ran(door) = {open}
      & /* @Ref3_ControllerSensors:grd3  */ retract_gear_valve = valve_open
      & /* @Ref3_ControllerSensors:grd4  */ extend_gear_valve = valve_closed
      & /* @Ref3_ControllerSensors:proof  */ proof_sensors = FALSE
    THEN 
         gear := {front__ |-> gear_moving,left__ |-> gear_moving,right__ |-> gear_moving}
      ||
         gear_extended := {front__ |-> [FALSE,FALSE,FALSE],left__ |-> [FALSE,FALSE,FALSE],right__ |-> [FALSE,FALSE,FALSE]}
    END;
  
  env_start_open_door = 
    SELECT 
        /* @Ref3_ControllerSensors:grd2  */ ran(door) = {closed}
      & /* @Ref3_ControllerSensors:grd3  */ open_door_valve = valve_open
      & /* @Ref3_ControllerSensors:grd4  */ close_door_valve = valve_closed
    THEN 
         door := {front__ |-> door_moving,left__ |-> door_moving,right__ |-> door_moving}
      ||
         door_closed := {front__ |-> [FALSE,FALSE,FALSE],left__ |-> [FALSE,FALSE,FALSE],right__ |-> [FALSE,FALSE,FALSE]}
    END;
  
  env_open_door = 
    SELECT 
        /* @Ref3_ControllerSensors:grd2  */ ran(door) = {door_moving}
      & /* @Ref3_ControllerSensors:grd3  */ open_door_valve = valve_open
      & /* @Ref3_ControllerSensors:grd4  */ close_door_valve = valve_closed
      & /* @Ref3_ControllerSensors:proof  */ proof_sensors = FALSE
    THEN 
         door := {front__ |-> open,left__ |-> open,right__ |-> open}
      ||
         door_open := {front__ |-> [TRUE,TRUE,TRUE],left__ |-> [TRUE,TRUE,TRUE],right__ |-> [TRUE,TRUE,TRUE]}
    END;
  
  env_close_door = 
    SELECT 
        /* @Ref3_ControllerSensors:grd2  */ ran(door) = {door_moving}
      & /* @Ref3_ControllerSensors:grd3  */ close_door_valve = valve_open
      & /* @Ref3_ControllerSensors:grd4  */ open_door_valve = valve_closed
      & /* @Ref3_ControllerSensors:proof  */ proof_sensors = FALSE
    THEN 
         door := {front__ |-> closed,left__ |-> closed,right__ |-> closed}
      ||
         door_closed := {front__ |-> [TRUE,TRUE,TRUE],left__ |-> [TRUE,TRUE,TRUE],right__ |-> [TRUE,TRUE,TRUE]}
    END;
  
  env_start_close_door = 
    SELECT 
        /* @Ref3_ControllerSensors:grd1  */ ran(door) = {open}
      & /* @Ref3_ControllerSensors:grd81  */ {gear_moving} /<: ran(gear)
      & /* @Ref3_ControllerSensors:grd3  */ close_door_valve = valve_open
      & /* @Ref3_ControllerSensors:grd4  */ open_door_valve = valve_closed
      & /* @Ref3_ControllerSensors:proof  */ proof_sensors = FALSE
    THEN 
         door := {front__ |-> door_moving,left__ |-> door_moving,right__ |-> door_moving}
      ||
         door_open := {front__ |-> [FALSE,FALSE,FALSE],left__ |-> [FALSE,FALSE,FALSE],right__ |-> [FALSE,FALSE,FALSE]}
    END;
  
  env_open_valve_open_door = 
    SELECT 
        /* @Ref3_ControllerSensors:grd1  */ open_door_valve = valve_closed
      & /* @Ref3_ControllerSensors:grd3  */ open_EV = TRUE
      & /* @Ref3_ControllerSensors:proof  */ proof_sensors = FALSE
    THEN 
      open_door_valve := valve_open
    END;
  
  env_close_valve_open_door = 
    SELECT 
        /* @Ref3_ControllerSensors:grd1  */ open_door_valve = valve_open
      & /* @Ref3_ControllerSensors:grd5  */ extend_gear_valve = valve_closed
      & /* @Ref3_ControllerSensors:grd6  */ retract_gear_valve = valve_closed
      & /* @Ref3_ControllerSensors:grd3  */ open_EV = FALSE
      & /* @Ref3_ControllerSensors:grd81  */ extend_EV = FALSE
      & /* @Ref3_ControllerSensors:grd82  */ retract_EV = FALSE
      & /* @Ref3_ControllerSensors:proof  */ proof_sensors = FALSE
    THEN 
      open_door_valve := valve_closed
    END;
  
  env_open_valve_close_door = 
    SELECT 
        /* @Ref3_ControllerSensors:grd1  */ close_door_valve = valve_closed
      & /* @Ref3_ControllerSensors:grd12  */ retract_gear_valve = valve_closed
      & /* @Ref3_ControllerSensors:grd13  */ extend_gear_valve = valve_closed
      & /* @Ref3_ControllerSensors:grd3  */ close_EV = TRUE
      & /* @Ref3_ControllerSensors:proof  */ proof_sensors = FALSE
    THEN 
      close_door_valve := valve_open
    END;
  
  env_close_valve_close_door = 
    SELECT 
        /* @Ref3_ControllerSensors:grd1  */ close_door_valve = valve_open
      & /* @Ref3_ControllerSensors:grd2  */ close_EV = FALSE
      & /* @Ref3_ControllerSensors:proof  */ proof_sensors = FALSE
    THEN 
      close_door_valve := valve_closed
    END;
  
  env_open_valve_retract_gear = 
    SELECT 
        /* @Ref3_ControllerSensors:grd1  */ retract_gear_valve = valve_closed
      & /* @Ref3_ControllerSensors:grd5  */ open_door_valve = valve_open
      & /* @Ref3_ControllerSensors:grd3  */ retract_EV = TRUE
      & /* @Ref3_ControllerSensors:proof  */ proof_sensors = FALSE
    THEN 
      retract_gear_valve := valve_open
    END;
  
  env_close_valve_retract_gear = 
    SELECT 
        /* @Ref3_ControllerSensors:grd1  */ retract_gear_valve = valve_open
      & /* @Ref3_ControllerSensors:grd3  */ retract_EV = FALSE
      & /* @Ref3_ControllerSensors:proof  */ proof_sensors = FALSE
    THEN 
      retract_gear_valve := valve_closed
    END;
  
  env_open_valve_extend_gear = 
    SELECT 
        /* @Ref3_ControllerSensors:grd1  */ extend_gear_valve = valve_closed
      & /* @Ref3_ControllerSensors:grd5  */ open_door_valve = valve_open
      & /* @Ref3_ControllerSensors:grd3  */ extend_EV = TRUE
      & /* @Ref3_ControllerSensors:proof  */ proof_sensors = FALSE
    THEN 
      extend_gear_valve := valve_open
    END;
  
  env_close_valve_extend_gear = 
    SELECT 
        /* @Ref3_ControllerSensors:grd1  */ extend_gear_valve = valve_open
      & /* @Ref3_ControllerSensors:grd3  */ extend_EV = FALSE
      & /* @Ref3_ControllerSensors:proof  */ proof_sensors = FALSE
    THEN 
      extend_gear_valve := valve_closed
    END;
  
  con_set_anomaly_output = 
    SELECT 
        /* @Ref3_ControllerSensors:proof  */ proof_sensors = FALSE
    THEN 
      anomaly := TRUE
    END;
  
  con_stimulate_open_door_valve = 
    SELECT 
        /* @Ref3_ControllerSensors:grd1  */ open_EV = FALSE
      & /* @Ref3_ControllerSensors:grd2  */ close_EV = FALSE
      & /* @Ref3_ControllerSensors:proof  */ proof_sensors = FALSE
      & (/* @Ref3_ControllerSensors:gear_not_moving  */ (ran(valid_sensors_gear_extended(front__) <| gear_extended(front__)) = {TRUE} & (ran(valid_sensors_gear_extended(left__) <| gear_extended(left__)) = {TRUE} & ran(valid_sensors_gear_extended(right__) <| gear_extended(right__)) = {TRUE})) or (ran(valid_sensors_gear_retracted(front__) <| gear_retracted(front__)) = {TRUE} & (ran(valid_sensors_gear_retracted(left__) <| gear_retracted(left__)) = {TRUE} & ran(valid_sensors_gear_retracted(right__) <| gear_retracted(right__)) = {TRUE})))
    THEN 
         open_EV := TRUE
      ||
         last_door_action := {open_door_stimulus}
    END;
  
  con_stop_stimulate_open_door_valve = 
    SELECT 
        /* @Ref3_ControllerSensors:grd1  */ open_EV = TRUE
      & /* @Ref3_ControllerSensors:grd81  */ extend_EV = FALSE
      & /* @Ref3_ControllerSensors:grd82  */ retract_EV = FALSE
      & /* @Ref3_ControllerSensors:proof  */ proof_sensors = FALSE
    THEN 
      open_EV := FALSE
    END;
  
  con_stimulate_close_door_valve = 
    SELECT 
        /* @Ref3_ControllerSensors:grd2  */ close_EV = FALSE
      & /* @Ref3_ControllerSensors:grd1  */ open_EV = FALSE
      & /* @Ref3_ControllerSensors:grd11  */ extend_EV = FALSE
      & /* @Ref3_ControllerSensors:grd12  */ retract_EV = FALSE
      & /* @Ref3_ControllerSensors:proof  */ proof_sensors = FALSE
      & (/* @Ref3_ControllerSensors:grd  */ (ran(valid_sensors_door_closed(front__) <| door_closed(front__)) = {FALSE} & (ran(valid_sensors_door_closed(left__) <| door_closed(left__)) = {FALSE} & ran(valid_sensors_door_closed(right__) <| door_closed(right__)) = {FALSE})) or last_door_action = {open_door_stimulus})
      & (/* @Ref3_ControllerSensors:gear_not_moving  */ (ran(valid_sensors_gear_extended(front__) <| gear_extended(front__)) = {TRUE} & (ran(valid_sensors_gear_extended(left__) <| gear_extended(left__)) = {TRUE} & ran(valid_sensors_gear_extended(right__) <| gear_extended(right__)) = {TRUE})) or (ran(valid_sensors_gear_retracted(front__) <| gear_retracted(front__)) = {TRUE} & (ran(valid_sensors_gear_retracted(left__) <| gear_retracted(left__)) = {TRUE} & ran(valid_sensors_gear_retracted(right__) <| gear_retracted(right__)) = {TRUE})))
    THEN 
         close_EV := TRUE
      ||
         last_door_action := {close_door_stimulus}
    END;
  
  con_stop_stimulate_close_door_valve = 
    SELECT 
        /* @Ref3_ControllerSensors:grd1  */ close_EV = TRUE
      & /* @Ref3_ControllerSensors:proof  */ proof_sensors = FALSE
    THEN 
      close_EV := FALSE
    END;
  
  con_stimulate_retract_gear_valve = 
    SELECT 
        /* @Ref3_ControllerSensors:grd1  */ retract_EV = FALSE
      & /* @Ref3_ControllerSensors:grd2  */ extend_EV = FALSE
      & /* @Ref3_ControllerSensors:grd3  */ open_EV = TRUE
      & /* @Ref3_ControllerSensors:proof  */ proof_sensors = FALSE
      & /* @Ref3_ControllerSensors:doorfront  */ ran(valid_sensors_door_open(front__) <| door_open(front__)) = {TRUE}
      & /* @Ref3_ControllerSensors:doorleft  */ ran(valid_sensors_door_open(left__) <| door_open(left__)) = {TRUE}
      & /* @Ref3_ControllerSensors:doorright  */ ran(valid_sensors_door_open(right__) <| door_open(right__)) = {TRUE}
      & (/* @Ref3_ControllerSensors:grd4  */ (ran(valid_sensors_gear_retracted(front__) <| gear_retracted(front__)) = {FALSE} & (ran(valid_sensors_gear_retracted(left__) <| gear_retracted(left__)) = {FALSE} & ran(valid_sensors_gear_retracted(right__) <| gear_retracted(right__)) = {FALSE})) or (ran(valid_sensors_gear_retracted(front__) <| gear_retracted(front__)) = {TRUE} & (ran(valid_sensors_gear_retracted(left__) <| gear_retracted(left__)) = {TRUE} & (ran(valid_sensors_gear_retracted(right__) <| gear_retracted(right__)) = {TRUE} & last_gear_action = {extend_gear_stimulus}))))
    THEN 
         retract_EV := TRUE
      ||
         last_gear_action := {retract_gear_stimulus}
    END;
  
  con_stop_stimulate_retract_gear_valve = 
    SELECT 
        /* @Ref3_ControllerSensors:grd1  */ retract_EV = TRUE
      & /* @Ref3_ControllerSensors:proof  */ proof_sensors = FALSE
    THEN 
      retract_EV := FALSE
    END;
  
  con_stimulate_extend_gear_valve = 
    SELECT 
        /* @Ref3_ControllerSensors:grd1  */ extend_EV = FALSE
      & /* @Ref3_ControllerSensors:grd2  */ retract_EV = FALSE
      & /* @Ref3_ControllerSensors:grd3  */ open_EV = TRUE
      & /* @Ref3_ControllerSensors:proof  */ proof_sensors = FALSE
      & /* @Ref3_ControllerSensors:doorfront  */ ran(valid_sensors_door_open(front__) <| door_open(front__)) = {TRUE}
      & /* @Ref3_ControllerSensors:doorleft  */ ran(valid_sensors_door_open(left__) <| door_open(left__)) = {TRUE}
      & /* @Ref3_ControllerSensors:doorright  */ ran(valid_sensors_door_open(right__) <| door_open(right__)) = {TRUE}
      & (/* @Ref3_ControllerSensors:grd  */ (ran(valid_sensors_gear_extended(front__) <| gear_extended(front__)) = {FALSE} & (ran(valid_sensors_gear_extended(left__) <| gear_extended(left__)) = {FALSE} & ran(valid_sensors_gear_extended(right__) <| gear_extended(right__)) = {FALSE})) or (ran(valid_sensors_gear_extended(front__) <| gear_extended(front__)) = {TRUE} & (ran(valid_sensors_gear_extended(left__) <| gear_extended(left__)) = {TRUE} & (ran(valid_sensors_gear_extended(right__) <| gear_extended(right__)) = {TRUE} & last_gear_action = {retract_gear_stimulus}))))
    THEN 
         extend_EV := TRUE
      ||
         last_gear_action := {extend_gear_stimulus}
    END;
  
  con_stop_stimulate_extend_gear_valve = 
    SELECT 
        /* @Ref3_ControllerSensors:grd2  */ extend_EV = TRUE
      & /* @Ref3_ControllerSensors:proof  */ proof_sensors = FALSE
    THEN 
      extend_EV := FALSE
    END;
  
  sensor_invalid_gear_extended = 
    ANY notval,pos,val
    WHERE 
        notval : BOOL
      & pos : POSITION
      & val : BOOL
      & (notval = TRUE) <=> (val = FALSE)
      & /* @Ref3_ControllerSensors:validyet  */ card(valid_sensors_gear_extended(pos)) = 3
      & /* @Ref3_ControllerSensors:nowinvalid  */ card(ran(valid_sensors_gear_extended(pos) <| gear_extended(pos))) > 1
      & /* @Ref3_ControllerSensors:validvalue  */ card(gear_extended(pos) |> {val}) = 2
    THEN
         valid_sensors_gear_extended := valid_sensors_gear_extended <+ {pos |-> valid_sensors_gear_extended(pos) - dom(gear_extended(pos) |> {notval})}
      ||
         proof_sensors := FALSE
    END;
  
  sensor_invalid_gear_retracted = 
    ANY notval,pos,val
    WHERE 
        notval : BOOL
      & pos : POSITION
      & val : BOOL
      & (notval = TRUE) <=> (val = FALSE)
      & /* @Ref3_ControllerSensors:validyet  */ card(valid_sensors_gear_retracted(pos)) = 3
      & /* @Ref3_ControllerSensors:nowinvalid  */ card(ran(valid_sensors_gear_retracted(pos) <| gear_retracted(pos))) > 1
      & /* @Ref3_ControllerSensors:validvalue  */ card(gear_retracted(pos) |> {val}) = 2
    THEN
         valid_sensors_gear_retracted := valid_sensors_gear_retracted <+ {pos |-> valid_sensors_gear_retracted(pos) - dom(gear_retracted(pos) |> {notval})}
      ||
         proof_sensors := FALSE
    END;
  
  sensor_invalid_door_open = 
    ANY notval,pos,val
    WHERE 
        notval : BOOL
      & pos : POSITION
      & val : BOOL
      & (notval = TRUE) <=> (val = FALSE)
      & /* @Ref3_ControllerSensors:validyet  */ card(valid_sensors_door_open(pos)) = 3
      & /* @Ref3_ControllerSensors:nowinvalid  */ card(ran(valid_sensors_door_open(pos) <| door_open(pos))) > 1
      & /* @Ref3_ControllerSensors:validvalue  */ card(door_open(pos) |> {val}) = 2
    THEN
         valid_sensors_door_open := valid_sensors_door_open <+ {pos |-> valid_sensors_door_open(pos) - dom(door_open(pos) |> {notval})}
      ||
         proof_sensors := FALSE
    END;
  
  sensor_invalid_door_closed = 
    ANY notval,pos,val
    WHERE 
        notval : BOOL
      & pos : POSITION
      & val : BOOL
      & (notval = TRUE) <=> (val = FALSE)
      & /* @Ref3_ControllerSensors:validyet  */ card(valid_sensors_door_closed(pos)) = 3
      & /* @Ref3_ControllerSensors:nowinvalid  */ card(ran(valid_sensors_door_closed(pos) <| door_closed(pos))) > 1
      & /* @Ref3_ControllerSensors:validvalue  */ card(door_closed(pos) |> {val}) = 2
    THEN
         valid_sensors_door_closed := valid_sensors_door_closed <+ {pos |-> valid_sensors_door_closed(pos) - dom(door_closed(pos) |> {notval})}
      ||
         proof_sensors := FALSE
    END;
  
  sensor_invalid_Anomaly = 
    ANY pos
    WHERE 
        pos : POSITION
      & (/* @Ref3_ControllerSensors:invalid  */ (card(valid_sensors_gear_extended(pos)) = 2 & card(ran(valid_sensors_gear_extended(pos) <| gear_extended(pos))) > 1) or ((card(valid_sensors_gear_retracted(pos)) = 2 & card(ran(valid_sensors_gear_retracted(pos) <| gear_retracted(pos))) > 1) or ((card(valid_sensors_door_open(pos)) = 2 & card(ran(valid_sensors_door_open(pos) <| door_open(pos))) > 1) or (card(valid_sensors_door_closed(pos)) = 2 & card(ran(valid_sensors_door_closed(pos) <| door_closed(pos))) > 1))))
    THEN
         anomaly := TRUE
      ||
         proof_sensors := FALSE
    END
END
