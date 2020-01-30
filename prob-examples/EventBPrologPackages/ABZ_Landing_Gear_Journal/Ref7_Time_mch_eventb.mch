
MACHINE Ref7_Time_mch_eventb
SETS /* enumerated */
  DOOR_STATE={open,closed,door_moving};
  GEAR_STATE={retracted,extended,gear_moving};
  HANDLE_STATE={up,down};
  PLANE_STATE={ground,flight};
  POSITION={front__,left__,right__};
  SWITCH_STATE={switch_open,switch_closed};
  VALVE_STATE={valve_open,valve_closed};
  STIMULI={open_door_stimulus,close_door_stimulus,retract_gear_stimulus,extend_gear_stimulus,stop_open_door_stimulus,stop_close_door_stimulus,stop_retract_gear_stimulus,stop_extend_gear_stimulus};
  LIGHT_STATE={on,off}
CONCRETE_CONSTANTS
  bool_to_light
ABSTRACT_VARIABLES
  timeCloseDoorEV,
  timeExtGearEV,
  timeGEV,
  timeGEVstop,
  timeHandle,
  timeOpenDoorEV,
  timeRetGearEV,
  timeSwitch,
  gears_locked_down,
  gears_maneuvering,
  green_light,
  orange_light,
  red_light,
  analogical_switch,
  general_EV,
  general_valve,
  handle_move,
  handle,
  last_handle_state,
  lock_door_opening,
  shock_absorber,
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
  tick,
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
  con_stimulate_open_door_valve,
  con_stop_stimulate_open_door_valve,
  con_stimulate_close_door_valve,
  con_stop_stimulate_close_door_valve,
  con_stimulate_retract_gear_valve,
  con_stop_stimulate_retract_gear_valve,
  con_stimulate_extend_gear_valve,
  con_stop_stimulate_extend_gear_valve,
  env_toggle_handle,
  env_changeShockAbsorber,
  con_stimulate_general_valve,
  con_stop_stimulate_general_valve,
  evn_open_general_valve,
  evn_close_general_valve,
  env_close_switch,
  env_open_switch,
  con_set_anomaly_output,
  con_set_cockpit_outputs,
  env_turn_on_red_light,
  env_turn_on_orange_light,
  env_turn_off_orange_light,
  env_turn_on_green_light,
  env_turn_off_green_light,
  sensor_invalid_gear_extended,
  sensor_invalid_gear_retracted,
  sensor_invalid_door_open,
  sensor_invalid_door_closed,
  sensor_invalid_Anomaly */
PROPERTIES
    bool_to_light : POW(BOOL * LIGHT_STATE)
  & /* @Lights6:axm2  */ bool_to_light = {TRUE |-> on,FALSE |-> off}
INVARIANT
    green_light : LIGHT_STATE
  & orange_light : LIGHT_STATE
  & red_light : LIGHT_STATE
  & analogical_switch : SWITCH_STATE
  & general_EV : BOOL
  & general_valve : VALVE_STATE
  & handle_move : BOOL
  & handle : HANDLE_STATE
  & last_handle_state : POW(HANDLE_STATE)
  & lock_door_opening : BOOL
  & shock_absorber : PLANE_STATE
  & anomaly : BOOL
  & proof_sensors : BOOL
  & close_EV : BOOL
  & extend_EV : BOOL
  & open_EV : BOOL
  & retract_EV : BOOL
  & close_door_valve : VALVE_STATE
  & extend_gear_valve : VALVE_STATE
  & open_door_valve : VALVE_STATE
  & retract_gear_valve : VALVE_STATE
  & /* @Ref7_Time:time1  */ timeHandle : -1 .. 220
  & /* @Ref7_Time:time2  */ timeSwitch : -1 .. 215
  & /* @Ref7_Time:time3  */ timeGEV : -1 .. 20
  & /* @Ref7_Time:time4  */ timeGEVstop : -1 .. 100
  & /* @Ref7_Time:time5  */ timeOpenDoorEV : -1 .. 70
  & /* @Ref7_Time:time6  */ timeCloseDoorEV : -1 .. 70
  & /* @Ref7_Time:time7  */ timeExtGearEV : -1 .. 100
  & /* @Ref7_Time:time8  */ timeRetGearEV : -1 .. 100
  & (/* @Ref7_Time:R12  */ analogical_switch = switch_open & timeHandle : 10 .. 210 => anomaly = TRUE)
  & (/* @Ref7_Time:R13  */ analogical_switch = switch_closed & (timeSwitch = 0 & timeHandle < 10) => anomaly = TRUE)
  & (/* @Ref7_Time:R14  */ timeGEV = 0 & general_valve = valve_closed => anomaly = TRUE)
  & (/* @Ref7_Time:R15  */ timeGEVstop = 0 & general_valve = valve_open => anomaly = TRUE)
  & /* @Ref6_CockpitLights:gears_locked_down  */ gears_locked_down : POSITION --> BOOL
  & /* @Ref6_CockpitLights:gears_maneuvering  */ gears_maneuvering : POSITION --> BOOL
  & (/* @Ref6_CockpitLights:R41  */ anomaly = FALSE => not(open_EV = TRUE & close_EV = TRUE))
  & (/* @Ref6_CockpitLights:R42  */ anomaly = FALSE => not(retract_EV = TRUE & extend_EV = TRUE))
  & (/* @Ref6_CockpitLights:R51  */ anomaly = FALSE => (open_EV = TRUE or (close_EV = TRUE or (extend_EV = TRUE or retract_EV = TRUE)) => general_EV = TRUE))
  & (/* @Ref6_CockpitLights:safe  */ anomaly = FALSE => (extend_EV = TRUE or retract_EV = TRUE => open_EV = TRUE))
  & (/* @Ref5_Switch:r51  */ open_EV = TRUE or (close_EV = TRUE or (retract_EV = TRUE or extend_EV = TRUE)) => general_EV = TRUE)
  & card(last_handle_state) < 2
  & (/* @Ref4_ControllerHandle:r31simple  */ extend_EV = TRUE or retract_EV = TRUE => open_EV = TRUE)
  & (/* @Ref4_ControllerHandle:TEST1  */ anomaly = FALSE & (door(front__) = door_moving or (door(left__) = door_moving or door(right__) = door_moving)) => not(gear(front__) = gear_moving) & (not(gear(left__) = gear_moving) & not(gear(right__) = gear_moving)))
  & (/* @Ref4_ControllerHandle:TEST2  */ anomaly = FALSE & (gear(front__) = gear_moving or (gear(left__) = gear_moving or gear(right__) = gear_moving)) => not(door(front__) = door_moving) & (not(door(left__) = door_moving) & not(door(right__) = door_moving)))
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
      ||
         handle := down
      ||
         last_handle_state := {}
      ||
         shock_absorber := flight
      ||
         lock_door_opening := FALSE
      ||
         general_EV := FALSE
      ||
         handle_move := FALSE
      ||
         general_valve := valve_closed
      ||
         analogical_switch := switch_open
      ||
         gears_locked_down := {front__ |-> FALSE,left__ |-> FALSE,right__ |-> FALSE}
      ||
         gears_maneuvering := {front__ |-> FALSE,left__ |-> FALSE,right__ |-> FALSE}
      ||
         green_light := off
      ||
         orange_light := off
      ||
         red_light := off
      ||
         timeHandle := -1
      ||
         timeSwitch := -1
      ||
         timeGEV := -1
      ||
         timeGEVstop := -1
      ||
         timeOpenDoorEV := -1
      ||
         timeCloseDoorEV := -1
      ||
         timeExtGearEV := -1
      ||
         timeRetGearEV := -1
    END
OPERATIONS
  tick = 
    BEGIN
         timeHandle := max({timeHandle - 1,-1})
      ||
         timeSwitch := max({timeSwitch - 1,-1})
      ||
         timeGEV := max({timeGEV - 1,-1})
      ||
         timeGEVstop := max({timeGEVstop - 1,-1})
      ||
         timeOpenDoorEV := max({timeOpenDoorEV - 1,-1})
      ||
         timeCloseDoorEV := max({timeCloseDoorEV - 1,-1})
      ||
         timeExtGearEV := max({timeExtGearEV - 1,-1})
      ||
         timeRetGearEV := max({timeRetGearEV - 1,-1})
    END;
  
  env_start_extending = 
    SELECT 
        /* @Ref7_Time:grd2  */ ran(gear) = {retracted}
      & /* @Ref7_Time:grd81  */ ran(door) = {open}
      & /* @Ref7_Time:grd3  */ extend_gear_valve = valve_open
      & /* @Ref7_Time:grd4  */ retract_gear_valve = valve_closed
      & /* @Ref7_Time:proof  */ proof_sensors = FALSE
      & /* @Ref7_Time:general_valve  */ general_valve = valve_open
    THEN 
         gear := {front__ |-> gear_moving,left__ |-> gear_moving,right__ |-> gear_moving}
      ||
         gear_retracted := {front__ |-> [FALSE,FALSE,FALSE],left__ |-> [FALSE,FALSE,FALSE],right__ |-> [FALSE,FALSE,FALSE]}
    END;
  
  env_extend_gear = 
    SELECT 
        /* @Ref7_Time:grd2  */ ran(gear) = {gear_moving}
      & /* @Ref7_Time:grd3  */ extend_gear_valve = valve_open
      & /* @Ref7_Time:grd4  */ retract_gear_valve = valve_closed
      & /* @Ref7_Time:proof  */ proof_sensors = FALSE
      & /* @Ref7_Time:general_valve  */ general_valve = valve_open
    THEN 
         gear := {front__ |-> extended,left__ |-> extended,right__ |-> extended}
      ||
         gear_extended := {front__ |-> [TRUE,TRUE,TRUE],left__ |-> [TRUE,TRUE,TRUE],right__ |-> [TRUE,TRUE,TRUE]}
    END;
  
  env_retract_gear = 
    SELECT 
        /* @Ref7_Time:grd2  */ ran(gear) = {gear_moving}
      & /* @Ref7_Time:grd3  */ retract_gear_valve = valve_open
      & /* @Ref7_Time:grd4  */ extend_gear_valve = valve_closed
      & /* @Ref7_Time:proof  */ proof_sensors = FALSE
      & /* @Ref7_Time:general_valve  */ general_valve = valve_open
    THEN 
         gear := {front__ |-> retracted,left__ |-> retracted,right__ |-> retracted}
      ||
         gear_retracted := {front__ |-> [TRUE,TRUE,TRUE],left__ |-> [TRUE,TRUE,TRUE],right__ |-> [TRUE,TRUE,TRUE]}
      ||
         shock_absorber := flight
    END;
  
  env_start_retracting = 
    SELECT 
        /* @Ref7_Time:grd2  */ ran(gear) = {extended}
      & /* @Ref7_Time:grd81  */ ran(door) = {open}
      & /* @Ref7_Time:grd3  */ retract_gear_valve = valve_open
      & /* @Ref7_Time:grd4  */ extend_gear_valve = valve_closed
      & /* @Ref7_Time:proof  */ proof_sensors = FALSE
      & /* @Ref7_Time:general_valve  */ general_valve = valve_open
    THEN 
         gear := {front__ |-> gear_moving,left__ |-> gear_moving,right__ |-> gear_moving}
      ||
         gear_extended := {front__ |-> [FALSE,FALSE,FALSE],left__ |-> [FALSE,FALSE,FALSE],right__ |-> [FALSE,FALSE,FALSE]}
    END;
  
  env_start_open_door = 
    SELECT 
        /* @Ref7_Time:grd2  */ ran(door) = {closed}
      & /* @Ref7_Time:grd3  */ open_door_valve = valve_open
      & /* @Ref7_Time:grd4  */ close_door_valve = valve_closed
      & /* @Ref7_Time:general_valve  */ general_valve = valve_open
    THEN 
         door := {front__ |-> door_moving,left__ |-> door_moving,right__ |-> door_moving}
      ||
         door_closed := {front__ |-> [FALSE,FALSE,FALSE],left__ |-> [FALSE,FALSE,FALSE],right__ |-> [FALSE,FALSE,FALSE]}
    END;
  
  env_open_door = 
    SELECT 
        /* @Ref7_Time:grd2  */ ran(door) = {door_moving}
      & /* @Ref7_Time:grd3  */ open_door_valve = valve_open
      & /* @Ref7_Time:grd4  */ close_door_valve = valve_closed
      & /* @Ref7_Time:proof  */ proof_sensors = FALSE
      & /* @Ref7_Time:general_valve  */ general_valve = valve_open
    THEN 
         door := {front__ |-> open,left__ |-> open,right__ |-> open}
      ||
         door_open := {front__ |-> [TRUE,TRUE,TRUE],left__ |-> [TRUE,TRUE,TRUE],right__ |-> [TRUE,TRUE,TRUE]}
    END;
  
  env_close_door = 
    SELECT 
        /* @Ref7_Time:grd2  */ ran(door) = {door_moving}
      & /* @Ref7_Time:grd3  */ close_door_valve = valve_open
      & /* @Ref7_Time:grd4  */ open_door_valve = valve_closed
      & /* @Ref7_Time:proof  */ proof_sensors = FALSE
      & /* @Ref7_Time:general_valve  */ general_valve = valve_open
    THEN 
         door := {front__ |-> closed,left__ |-> closed,right__ |-> closed}
      ||
         door_closed := {front__ |-> [TRUE,TRUE,TRUE],left__ |-> [TRUE,TRUE,TRUE],right__ |-> [TRUE,TRUE,TRUE]}
    END;
  
  env_start_close_door = 
    SELECT 
        /* @Ref7_Time:grd1  */ ran(door) = {open}
      & /* @Ref7_Time:grd81  */ {gear_moving} /<: ran(gear)
      & /* @Ref7_Time:grd3  */ close_door_valve = valve_open
      & /* @Ref7_Time:grd4  */ open_door_valve = valve_closed
      & /* @Ref7_Time:proof  */ proof_sensors = FALSE
      & /* @Ref7_Time:general_valve  */ general_valve = valve_open
    THEN 
         door := {front__ |-> door_moving,left__ |-> door_moving,right__ |-> door_moving}
      ||
         door_open := {front__ |-> [FALSE,FALSE,FALSE],left__ |-> [FALSE,FALSE,FALSE],right__ |-> [FALSE,FALSE,FALSE]}
    END;
  
  env_open_valve_open_door = 
    SELECT 
        /* @Ref7_Time:grd1  */ open_door_valve = valve_closed
      & /* @Ref7_Time:grd3  */ open_EV = TRUE
      & /* @Ref7_Time:proof  */ proof_sensors = FALSE
    THEN 
      open_door_valve := valve_open
    END;
  
  env_close_valve_open_door = 
    SELECT 
        /* @Ref7_Time:grd1  */ open_door_valve = valve_open
      & /* @Ref7_Time:grd5  */ extend_gear_valve = valve_closed
      & /* @Ref7_Time:grd6  */ retract_gear_valve = valve_closed
      & /* @Ref7_Time:grd3  */ open_EV = FALSE
      & /* @Ref7_Time:grd81  */ extend_EV = FALSE
      & /* @Ref7_Time:grd82  */ retract_EV = FALSE
      & /* @Ref7_Time:proof  */ proof_sensors = FALSE
    THEN 
      open_door_valve := valve_closed
    END;
  
  env_open_valve_close_door = 
    SELECT 
        /* @Ref7_Time:grd1  */ close_door_valve = valve_closed
      & /* @Ref7_Time:grd12  */ retract_gear_valve = valve_closed
      & /* @Ref7_Time:grd13  */ extend_gear_valve = valve_closed
      & /* @Ref7_Time:grd3  */ close_EV = TRUE
      & /* @Ref7_Time:proof  */ proof_sensors = FALSE
    THEN 
      close_door_valve := valve_open
    END;
  
  env_close_valve_close_door = 
    SELECT 
        /* @Ref7_Time:grd1  */ close_door_valve = valve_open
      & /* @Ref7_Time:grd2  */ close_EV = FALSE
      & /* @Ref7_Time:proof  */ proof_sensors = FALSE
    THEN 
      close_door_valve := valve_closed
    END;
  
  env_open_valve_retract_gear = 
    SELECT 
        /* @Ref7_Time:grd1  */ retract_gear_valve = valve_closed
      & /* @Ref7_Time:grd5  */ open_door_valve = valve_open
      & /* @Ref7_Time:grd3  */ retract_EV = TRUE
      & /* @Ref7_Time:proof  */ proof_sensors = FALSE
    THEN 
      retract_gear_valve := valve_open
    END;
  
  env_close_valve_retract_gear = 
    SELECT 
        /* @Ref7_Time:grd1  */ retract_gear_valve = valve_open
      & /* @Ref7_Time:grd3  */ retract_EV = FALSE
      & /* @Ref7_Time:proof  */ proof_sensors = FALSE
    THEN 
      retract_gear_valve := valve_closed
    END;
  
  env_open_valve_extend_gear = 
    SELECT 
        /* @Ref7_Time:grd1  */ extend_gear_valve = valve_closed
      & /* @Ref7_Time:grd5  */ open_door_valve = valve_open
      & /* @Ref7_Time:grd3  */ extend_EV = TRUE
      & /* @Ref7_Time:proof  */ proof_sensors = FALSE
    THEN 
      extend_gear_valve := valve_open
    END;
  
  env_close_valve_extend_gear = 
    SELECT 
        /* @Ref7_Time:grd1  */ extend_gear_valve = valve_open
      & /* @Ref7_Time:grd3  */ extend_EV = FALSE
      & /* @Ref7_Time:proof  */ proof_sensors = FALSE
    THEN 
      extend_gear_valve := valve_closed
    END;
  
  con_stimulate_open_door_valve = 
    SELECT 
        /* @Ref7_Time:grd1  */ open_EV = FALSE
      & /* @Ref7_Time:grd2  */ close_EV = FALSE
      & /* @Ref7_Time:proof  */ proof_sensors = FALSE
      & (/* @Ref7_Time:gear_not_moving  */ (ran(valid_sensors_gear_extended(front__) <| gear_extended(front__)) = {TRUE} & (ran(valid_sensors_gear_extended(left__) <| gear_extended(left__)) = {TRUE} & ran(valid_sensors_gear_extended(right__) <| gear_extended(right__)) = {TRUE})) or (ran(valid_sensors_gear_retracted(front__) <| gear_retracted(front__)) = {TRUE} & (ran(valid_sensors_gear_retracted(left__) <| gear_retracted(left__)) = {TRUE} & ran(valid_sensors_gear_retracted(right__) <| gear_retracted(right__)) = {TRUE})))
      & (/* @Ref7_Time:handle  */ (ran(gear) = {extended} & handle = up) or (ran(gear) = {retracted} & handle = down))
      & /* @Ref7_Time:dooropeningnotlocked  */ lock_door_opening = FALSE
      & /* @Ref7_Time:general_ev  */ general_EV = TRUE
    THEN 
         open_EV := TRUE
      ||
         last_door_action := {open_door_stimulus}
      ||
         last_handle_state := {handle}
      ||
         timeOpenDoorEV := 70
      ||
         timeCloseDoorEV := -1
    END;
  
  con_stop_stimulate_open_door_valve = 
    SELECT 
        /* @Ref7_Time:grd1  */ open_EV = TRUE
      & /* @Ref7_Time:grd81  */ extend_EV = FALSE
      & /* @Ref7_Time:grd82  */ retract_EV = FALSE
      & /* @Ref7_Time:proof  */ proof_sensors = FALSE
      & (/* @Ref7_Time:handle  */ (ran(gear) = {extended} & handle = down) or ((ran(gear) = {retracted} & handle = up) or (ran(valid_sensors_gear_extended(front__) <| gear_extended(front__)) = {TRUE} & (ran(valid_sensors_gear_extended(left__) <| gear_extended(left__)) = {TRUE} & (ran(valid_sensors_gear_extended(right__) <| gear_extended(right__)) = {TRUE} & (handle = up & (ran(valid_sensors_door_open(front__) <| door_open(front__)) = {TRUE} & (ran(valid_sensors_door_open(left__) <| door_open(left__)) = {TRUE} & (ran(valid_sensors_door_open(right__) <| door_open(right__)) = {TRUE} & shock_absorber = ground)))))))))
      & retract_EV = FALSE
      & extend_EV = FALSE
      & /* @Ref7_Time:general_ev  */ general_EV = TRUE
    THEN 
         open_EV := FALSE
      ||
         last_handle_state := {}
      ||
         lock_door_opening := TRUE
    END;
  
  con_stimulate_close_door_valve = 
    SELECT 
        /* @Ref7_Time:grd2  */ close_EV = FALSE
      & /* @Ref7_Time:grd1  */ open_EV = FALSE
      & /* @Ref7_Time:grd11  */ extend_EV = FALSE
      & /* @Ref7_Time:grd12  */ retract_EV = FALSE
      & /* @Ref7_Time:proof  */ proof_sensors = FALSE
      & (/* @Ref7_Time:grd  */ (ran(valid_sensors_door_closed(front__) <| door_closed(front__)) = {FALSE} & (ran(valid_sensors_door_closed(left__) <| door_closed(left__)) = {FALSE} & ran(valid_sensors_door_closed(right__) <| door_closed(right__)) = {FALSE})) or last_door_action = {open_door_stimulus})
      & (/* @Ref7_Time:gear_not_moving  */ (ran(valid_sensors_gear_extended(front__) <| gear_extended(front__)) = {TRUE} & (ran(valid_sensors_gear_extended(left__) <| gear_extended(left__)) = {TRUE} & ran(valid_sensors_gear_extended(right__) <| gear_extended(right__)) = {TRUE})) or (ran(valid_sensors_gear_retracted(front__) <| gear_retracted(front__)) = {TRUE} & (ran(valid_sensors_gear_retracted(left__) <| gear_retracted(left__)) = {TRUE} & ran(valid_sensors_gear_retracted(right__) <| gear_retracted(right__)) = {TRUE})))
      & (/* @Ref7_Time:gear_not_waitingformoving  */ (ran(valid_sensors_gear_extended(front__) <| gear_extended(front__)) = {TRUE} & (ran(valid_sensors_gear_extended(left__) <| gear_extended(left__)) = {TRUE} & (ran(valid_sensors_gear_extended(right__) <| gear_extended(right__)) = {TRUE} & handle = down))) or ((ran(valid_sensors_gear_retracted(front__) <| gear_retracted(front__)) = {TRUE} & (ran(valid_sensors_gear_retracted(left__) <| gear_retracted(left__)) = {TRUE} & (ran(valid_sensors_gear_retracted(right__) <| gear_retracted(right__)) = {TRUE} & handle = up))) or (ran(valid_sensors_gear_extended(front__) <| gear_extended(front__)) = {TRUE} & (ran(valid_sensors_gear_extended(left__) <| gear_extended(left__)) = {TRUE} & (ran(valid_sensors_gear_extended(right__) <| gear_extended(right__)) = {TRUE} & (handle = up & shock_absorber = ground))))))
      & /* @Ref7_Time:general_ev  */ general_EV = TRUE
    THEN 
         close_EV := TRUE
      ||
         last_door_action := {close_door_stimulus}
      ||
         last_handle_state := {handle}
      ||
         lock_door_opening := TRUE
      ||
         timeOpenDoorEV := -1
      ||
         timeCloseDoorEV := 70
    END;
  
  con_stop_stimulate_close_door_valve = 
    SELECT 
        /* @Ref7_Time:grd1  */ close_EV = TRUE
      & /* @Ref7_Time:proof  */ proof_sensors = FALSE
      & (/* @Ref7_Time:grd5  */ (ran(valid_sensors_door_closed(front__) <| door_closed(front__)) = {TRUE} & (ran(valid_sensors_door_closed(left__) <| door_closed(left__)) = {TRUE} & ran(valid_sensors_door_closed(right__) <| door_closed(right__)) = {TRUE})) or (ran(valid_sensors_door_closed(front__) <| door_closed(front__)) = {FALSE} & (ran(valid_sensors_door_closed(left__) <| door_closed(left__)) = {FALSE} & (ran(valid_sensors_door_closed(right__) <| door_closed(right__)) = {FALSE} & last_handle_state /= {handle}))))
      & /* @Ref7_Time:general_ev  */ general_EV = TRUE
    THEN 
         close_EV := FALSE
      ||
         last_handle_state := {}
    END;
  
  con_stimulate_retract_gear_valve = 
    SELECT 
        /* @Ref7_Time:grd1  */ retract_EV = FALSE
      & /* @Ref7_Time:grd2  */ extend_EV = FALSE
      & /* @Ref7_Time:grd3  */ open_EV = TRUE
      & /* @Ref7_Time:proof  */ proof_sensors = FALSE
      & /* @Ref7_Time:doorfront  */ ran(valid_sensors_door_open(front__) <| door_open(front__)) = {TRUE}
      & /* @Ref7_Time:doorleft  */ ran(valid_sensors_door_open(left__) <| door_open(left__)) = {TRUE}
      & /* @Ref7_Time:doorright  */ ran(valid_sensors_door_open(right__) <| door_open(right__)) = {TRUE}
      & (/* @Ref7_Time:grd4  */ (ran(valid_sensors_gear_retracted(front__) <| gear_retracted(front__)) = {FALSE} & (ran(valid_sensors_gear_retracted(left__) <| gear_retracted(left__)) = {FALSE} & ran(valid_sensors_gear_retracted(right__) <| gear_retracted(right__)) = {FALSE})) or (ran(valid_sensors_gear_retracted(front__) <| gear_retracted(front__)) = {TRUE} & (ran(valid_sensors_gear_retracted(left__) <| gear_retracted(left__)) = {TRUE} & (ran(valid_sensors_gear_retracted(right__) <| gear_retracted(right__)) = {TRUE} & last_gear_action = {extend_gear_stimulus}))))
      & /* @Ref7_Time:grd7  */ handle = up
      & (/* @Ref7_Time:grd8  */ (ran(valid_sensors_gear_extended(front__) <| gear_extended(front__)) = {TRUE} & (ran(valid_sensors_gear_extended(left__) <| gear_extended(left__)) = {TRUE} & ran(valid_sensors_gear_extended(right__) <| gear_extended(right__)) = {TRUE})) or last_handle_state /= {handle})
      & /* @Ref7_Time:groundguard  */ shock_absorber = flight
      & /* @Ref7_Time:general_ev  */ general_EV = TRUE
    THEN 
         retract_EV := TRUE
      ||
         last_gear_action := {retract_gear_stimulus}
      ||
         timeRetGearEV := 100
      ||
         timeExtGearEV := -1
    END;
  
  con_stop_stimulate_retract_gear_valve = 
    SELECT 
        /* @Ref7_Time:grd1  */ retract_EV = TRUE
      & /* @Ref7_Time:proof  */ proof_sensors = FALSE
      & (/* @Ref7_Time:grd  */ (ran(valid_sensors_gear_retracted(front__) <| gear_retracted(front__)) = {TRUE} & (ran(valid_sensors_gear_retracted(left__) <| gear_retracted(left__)) = {TRUE} & ran(valid_sensors_gear_retracted(right__) <| gear_retracted(right__)) = {TRUE})) or handle = down)
      & /* @Ref7_Time:general_ev  */ general_EV = TRUE
    THEN 
      retract_EV := FALSE
    END;
  
  con_stimulate_extend_gear_valve = 
    SELECT 
        /* @Ref7_Time:grd1  */ extend_EV = FALSE
      & /* @Ref7_Time:grd2  */ retract_EV = FALSE
      & /* @Ref7_Time:grd3  */ open_EV = TRUE
      & /* @Ref7_Time:proof  */ proof_sensors = FALSE
      & /* @Ref7_Time:doorfront  */ ran(valid_sensors_door_open(front__) <| door_open(front__)) = {TRUE}
      & /* @Ref7_Time:doorleft  */ ran(valid_sensors_door_open(left__) <| door_open(left__)) = {TRUE}
      & /* @Ref7_Time:doorright  */ ran(valid_sensors_door_open(right__) <| door_open(right__)) = {TRUE}
      & (/* @Ref7_Time:grd  */ (ran(valid_sensors_gear_extended(front__) <| gear_extended(front__)) = {FALSE} & (ran(valid_sensors_gear_extended(left__) <| gear_extended(left__)) = {FALSE} & ran(valid_sensors_gear_extended(right__) <| gear_extended(right__)) = {FALSE})) or (ran(valid_sensors_gear_extended(front__) <| gear_extended(front__)) = {TRUE} & (ran(valid_sensors_gear_extended(left__) <| gear_extended(left__)) = {TRUE} & (ran(valid_sensors_gear_extended(right__) <| gear_extended(right__)) = {TRUE} & last_gear_action = {retract_gear_stimulus}))))
      & /* @Ref7_Time:grd7  */ handle = down
      & (/* @Ref7_Time:grd8  */ (ran(valid_sensors_gear_retracted(front__) <| gear_retracted(front__)) = {TRUE} & (ran(valid_sensors_gear_retracted(left__) <| gear_retracted(left__)) = {TRUE} & ran(valid_sensors_gear_retracted(right__) <| gear_retracted(right__)) = {TRUE})) or last_handle_state /= {handle})
      & /* @Ref7_Time:general_ev  */ general_EV = TRUE
    THEN 
         extend_EV := TRUE
      ||
         last_gear_action := {extend_gear_stimulus}
      ||
         timeRetGearEV := -1
      ||
         timeExtGearEV := 100
    END;
  
  con_stop_stimulate_extend_gear_valve = 
    SELECT 
        /* @Ref7_Time:grd2  */ extend_EV = TRUE
      & /* @Ref7_Time:proof  */ proof_sensors = FALSE
      & (/* @Ref7_Time:grd  */ (ran(valid_sensors_gear_extended(front__) <| gear_extended(front__)) = {TRUE} & (ran(valid_sensors_gear_extended(left__) <| gear_extended(left__)) = {TRUE} & ran(valid_sensors_gear_extended(right__) <| gear_extended(right__)) = {TRUE})) or handle = up)
      & /* @Ref7_Time:general_ev  */ general_EV = TRUE
    THEN 
      extend_EV := FALSE
    END;
  
  env_toggle_handle = 
    BEGIN
         handle :: HANDLE_STATE - {handle}
      ||
         lock_door_opening := FALSE
      ||
         handle_move := TRUE
      ||
         timeHandle := 220
    END;
  
  env_changeShockAbsorber = 
    SELECT 
        /* @Ref7_Time:grd1  */ ran(valid_sensors_gear_retracted(front__) <| gear_retracted(front__)) = {FALSE}
      & /* @Ref7_Time:grd2  */ ran(valid_sensors_gear_retracted(left__) <| gear_retracted(left__)) = {FALSE}
      & /* @Ref7_Time:grd3  */ ran(valid_sensors_gear_retracted(right__) <| gear_retracted(right__)) = {FALSE}
    THEN 
      shock_absorber :: PLANE_STATE - {shock_absorber}
    END;
  
  con_stimulate_general_valve = 
    SELECT 
        /* @Ref7_Time:grd1  */ general_EV = FALSE
      & /* @Ref7_Time:grd2  */ handle_move = TRUE
    THEN 
         general_EV := TRUE
      ||
         timeGEV := 20
      ||
         timeGEVstop := -1
    END;
  
  con_stop_stimulate_general_valve = 
    SELECT 
        /* @Ref7_Time:grd1  */ general_EV = TRUE
      & (/* @Ref7_Time:grd2  */ (handle = up & (ran(valid_sensors_gear_retracted(front__) <| gear_retracted(front__)) = {TRUE} & (ran(valid_sensors_gear_retracted(left__) <| gear_retracted(left__)) = {TRUE} & (ran(valid_sensors_gear_retracted(right__) <| gear_retracted(right__)) = {TRUE} & (ran(valid_sensors_door_closed(front__) <| door_closed(front__)) = {TRUE} & (ran(valid_sensors_door_closed(left__) <| door_closed(left__)) = {TRUE} & (ran(valid_sensors_door_closed(right__) <| door_closed(right__)) = {TRUE} & (close_EV = FALSE & open_EV = FALSE)))))))) or ((handle = down & (ran(valid_sensors_gear_extended(front__) <| gear_extended(front__)) = {TRUE} & (ran(valid_sensors_gear_extended(left__) <| gear_extended(left__)) = {TRUE} & (ran(valid_sensors_gear_extended(right__) <| gear_extended(right__)) = {TRUE} & (ran(valid_sensors_door_closed(front__) <| door_closed(front__)) = {TRUE} & (ran(valid_sensors_door_closed(left__) <| door_closed(left__)) = {TRUE} & (ran(valid_sensors_door_closed(right__) <| door_closed(right__)) = {TRUE} & (close_EV = FALSE & (open_EV = FALSE & (last_handle_state = {} & (lock_door_opening = FALSE & last_door_action = {close_door_stimulus}))))))))))) or (handle = up & (ran(valid_sensors_gear_extended(front__) <| gear_extended(front__)) = {TRUE} & (ran(valid_sensors_gear_extended(left__) <| gear_extended(left__)) = {TRUE} & (ran(valid_sensors_gear_extended(right__) <| gear_extended(right__)) = {TRUE} & (ran(valid_sensors_door_closed(front__) <| door_closed(front__)) = {TRUE} & (ran(valid_sensors_door_closed(left__) <| door_closed(left__)) = {TRUE} & (ran(valid_sensors_door_closed(right__) <| door_closed(right__)) = {TRUE} & (close_EV = FALSE & (open_EV = FALSE & lock_door_opening = TRUE)))))))))))
    THEN 
         general_EV := FALSE
      ||
         handle_move := FALSE
      ||
         timeGEV := -1
      ||
         timeGEVstop := 100
    END;
  
  evn_open_general_valve = 
    SELECT 
        /* @Ref7_Time:grd1  */ general_EV = TRUE
      & /* @Ref7_Time:grd2  */ general_valve = valve_closed
      & /* @Ref7_Time:grd3  */ analogical_switch = switch_closed
    THEN 
      general_valve := valve_open
    END;
  
  evn_close_general_valve = 
    SELECT 
        (/* @Ref7_Time:grd1  */ general_EV = FALSE or analogical_switch = switch_open)
      & /* @Ref7_Time:grd2  */ general_valve = valve_open
    THEN 
      general_valve := valve_closed
    END;
  
  env_close_switch = 
    SELECT 
        /* @Ref7_Time:grd1  */ analogical_switch = switch_open
      & /* @Ref7_Time:grd2  */ handle_move = TRUE
    THEN 
         analogical_switch := switch_closed
      ||
         timeSwitch := 215
    END;
  
  env_open_switch = 
    SELECT 
        /* @Ref7_Time:grd1  */ analogical_switch = switch_closed
    THEN 
      analogical_switch := switch_open
    END;
  
  con_set_anomaly_output = 
    SELECT 
        /* @Ref7_Time:proof  */ proof_sensors = FALSE
      & (/* @Ref7_Time:grdAnomaly
  */ (analogical_switch = switch_open & timeHandle : 10 .. 210) or ((analogical_switch = switch_closed & (timeSwitch = 0 & timeHandle < 10)) or ((timeGEV = 0 & general_valve = valve_closed) or (timeGEVstop = 0 & general_valve = valve_open))))
    THEN 
      anomaly := TRUE
    END;
  
  con_set_cockpit_outputs = 
    ANY newstate_anomaly,newstate_invalidsensor,newstate_lockeddown_front,newstate_lockeddown_left,newstate_lockeddown_right
    WHERE 
        newstate_anomaly : BOOL
      & newstate_lockeddown_front : BOOL
      & newstate_lockeddown_left : BOOL
      & newstate_lockeddown_right : BOOL
      & (/* @Ref7_Time:grd1  */ gears_locked_down(front__) /: ran(valid_sensors_gear_extended(front__) <| gear_extended(front__)) or (gears_locked_down(left__) /: ran(valid_sensors_gear_extended(left__) <| gear_extended(left__)) or (gears_locked_down(right__) /: ran(valid_sensors_gear_extended(right__) <| gear_extended(right__)) or (gears_maneuvering(front__) /= bool(ran(valid_sensors_gear_retracted(front__) <| gear_retracted(front__)) = {FALSE} & ran(valid_sensors_gear_extended(front__) <| gear_extended(front__)) = {FALSE}) or (gears_maneuvering(left__) /= bool(ran(valid_sensors_gear_retracted(left__) <| gear_retracted(left__)) = {FALSE} & ran(valid_sensors_gear_extended(left__) <| gear_extended(left__)) = {FALSE}) or gears_maneuvering(right__) /= bool(ran(valid_sensors_gear_retracted(right__) <| gear_retracted(right__)) = {FALSE} & ran(valid_sensors_gear_extended(right__) <| gear_extended(right__)) = {FALSE}))))))
      & /* @Ref7_Time:grdinvalidsensor  */ newstate_invalidsensor : POSITION --> POW(1 .. 3)
      & (/* @Ref7_Time:grdValidExtendedSensors  */ card(ran((valid_sensors_gear_extended(front__) <| gear_extended(front__)) \/ ((valid_sensors_gear_extended(left__) <| gear_extended(left__)) \/ (valid_sensors_gear_extended(right__) <| gear_extended(right__))))) = 1 => newstate_lockeddown_front : ran(valid_sensors_gear_extended(front__) <| gear_extended(front__)) & (newstate_lockeddown_left : ran(valid_sensors_gear_extended(left__) <| gear_extended(left__)) & (newstate_lockeddown_right : ran(valid_sensors_gear_extended(right__) <| gear_extended(right__)) & (newstate_anomaly = anomaly & newstate_invalidsensor = {}))))
      & (/* @Ref7_Time:grdOneFrontSensorInvalid1  */ card(valid_sensors_gear_extended(front__)) = 3 & (card(ran(valid_sensors_gear_extended(front__) <| gear_extended(front__))) > 1 & card(gear_extended(front__) |> {TRUE}) = 2) & card(ran((valid_sensors_gear_extended(front__) - dom(gear_extended(front__) |> {TRUE}) <| gear_extended(front__)) \/ ((valid_sensors_gear_extended(left__) <| gear_extended(left__)) \/ (valid_sensors_gear_extended(right__) <| gear_extended(right__))))) = 1 => newstate_anomaly = anomaly & (newstate_lockeddown_front = TRUE & (newstate_lockeddown_left : ran(valid_sensors_gear_extended(left__) <| gear_extended(left__)) & (newstate_lockeddown_right : ran(valid_sensors_gear_extended(right__) <| gear_extended(right__)) & newstate_invalidsensor = {front__ |-> dom(gear_extended(front__) |> {FALSE})}))))
      & (/* @Ref7_Time:grdOneFrontSensorInvalid2  */ card(valid_sensors_gear_extended(front__)) = 3 & (card(ran(valid_sensors_gear_extended(front__) <| gear_extended(front__))) > 1 & card(gear_extended(front__) |> {FALSE}) = 2) & card(ran((valid_sensors_gear_extended(front__) - dom(gear_extended(front__) |> {FALSE}) <| gear_extended(front__)) \/ ((valid_sensors_gear_extended(left__) <| gear_extended(left__)) \/ (valid_sensors_gear_extended(right__) <| gear_extended(right__))))) = 1 => newstate_anomaly = anomaly & (newstate_lockeddown_front = FALSE & (newstate_lockeddown_left : ran(valid_sensors_gear_extended(left__) <| gear_extended(left__)) & (newstate_lockeddown_right : ran(valid_sensors_gear_extended(right__) <| gear_extended(right__)) & newstate_invalidsensor = {front__ |-> dom(gear_extended(front__) |> {TRUE})}))))
      & (/* @Ref7_Time:grdOneLeftSensorInvalid1  */ card(valid_sensors_gear_extended(left__)) = 3 & (card(ran(valid_sensors_gear_extended(left__) <| gear_extended(left__))) > 1 & card(gear_extended(left__) |> {TRUE}) = 2) & card(ran((valid_sensors_gear_extended(left__) - dom(gear_extended(left__) |> {TRUE}) <| gear_extended(left__)) \/ ((valid_sensors_gear_extended(front__) <| gear_extended(front__)) \/ (valid_sensors_gear_extended(right__) <| gear_extended(right__))))) = 1 => newstate_anomaly = anomaly & (newstate_lockeddown_left = TRUE & (newstate_lockeddown_front : ran(valid_sensors_gear_extended(front__) <| gear_extended(front__)) & (newstate_lockeddown_right : ran(valid_sensors_gear_extended(right__) <| gear_extended(right__)) & newstate_invalidsensor = {left__ |-> dom(gear_extended(left__) |> {FALSE})}))))
      & (/* @Ref7_Time:grdOneLeftSensorInvalid2  */ card(valid_sensors_gear_extended(left__)) = 3 & (card(ran(valid_sensors_gear_extended(left__) <| gear_extended(left__))) > 1 & card(gear_extended(left__) |> {FALSE}) = 2) & card(ran((valid_sensors_gear_extended(left__) - dom(gear_extended(left__) |> {FALSE}) <| gear_extended(left__)) \/ ((valid_sensors_gear_extended(front__) <| gear_extended(front__)) \/ (valid_sensors_gear_extended(right__) <| gear_extended(right__))))) = 1 => newstate_anomaly = anomaly & (newstate_lockeddown_left = FALSE & (newstate_lockeddown_front : ran(valid_sensors_gear_extended(front__) <| gear_extended(front__)) & (newstate_lockeddown_right : ran(valid_sensors_gear_extended(right__) <| gear_extended(right__)) & newstate_invalidsensor = {left__ |-> dom(gear_extended(left__) |> {TRUE})}))))
      & (/* @Ref7_Time:grdOneRightSensorInvalid1  */ card(valid_sensors_gear_extended(right__)) = 3 & (card(ran(valid_sensors_gear_extended(right__) <| gear_extended(right__))) > 1 & card(gear_extended(right__) |> {TRUE}) = 2) & card(ran((valid_sensors_gear_extended(right__) - dom(gear_extended(right__) |> {TRUE}) <| gear_extended(right__)) \/ ((valid_sensors_gear_extended(front__) <| gear_extended(front__)) \/ (valid_sensors_gear_extended(left__) <| gear_extended(left__))))) = 1 => newstate_anomaly = anomaly & (newstate_lockeddown_right = TRUE & (newstate_lockeddown_front : ran(valid_sensors_gear_extended(front__) <| gear_extended(front__)) & (newstate_lockeddown_left : ran(valid_sensors_gear_extended(left__) <| gear_extended(left__)) & newstate_invalidsensor = {right__ |-> dom(gear_extended(right__) |> {FALSE})}))))
      & (/* @Ref7_Time:grdOneRightSensorInvalid2  */ card(valid_sensors_gear_extended(right__)) = 3 & (card(ran(valid_sensors_gear_extended(right__) <| gear_extended(right__))) > 1 & card(gear_extended(right__) |> {FALSE}) = 2) & card(ran((valid_sensors_gear_extended(right__) - dom(gear_extended(right__) |> {FALSE}) <| gear_extended(right__)) \/ ((valid_sensors_gear_extended(front__) <| gear_extended(front__)) \/ (valid_sensors_gear_extended(left__) <| gear_extended(left__))))) = 1 => newstate_anomaly = anomaly & (newstate_lockeddown_right = FALSE & (newstate_lockeddown_front : ran(valid_sensors_gear_extended(front__) <| gear_extended(front__)) & (newstate_lockeddown_left : ran(valid_sensors_gear_extended(left__) <| gear_extended(left__)) & newstate_invalidsensor = {right__ |-> dom(gear_extended(right__) |> {TRUE})}))))
      & (/* @Ref7_Time:grdCompleteInvalidSensor  */ card(valid_sensors_gear_extended(front__) \/ (valid_sensors_gear_extended(left__) \/ valid_sensors_gear_extended(right__))) = 2 & card(ran((valid_sensors_gear_extended(front__) <| gear_extended(front__)) \/ ((valid_sensors_gear_extended(left__) <| gear_extended(left__)) \/ (valid_sensors_gear_extended(right__) <| gear_extended(right__))))) > 1 => newstate_anomaly = TRUE & (newstate_lockeddown_front : ran(valid_sensors_gear_extended(front__) <| gear_extended(front__)) & (newstate_lockeddown_left : ran(valid_sensors_gear_extended(left__) <| gear_extended(left__)) & (newstate_lockeddown_right : ran(valid_sensors_gear_extended(right__) <| gear_extended(right__)) & newstate_invalidsensor = {}))))
    THEN
         gears_locked_down := {front__ |-> newstate_lockeddown_front,left__ |-> newstate_lockeddown_left,right__ |-> newstate_lockeddown_right}
      ||
         gears_maneuvering := {left__ |-> bool(ran(valid_sensors_gear_extended(left__) <| gear_extended(left__)) \/ ran(valid_sensors_gear_retracted(left__) <| gear_retracted(left__)) = {FALSE})} \/ {right__ |-> bool(ran(valid_sensors_gear_extended(right__) <| gear_extended(right__)) \/ ran(valid_sensors_gear_retracted(right__) <| gear_retracted(right__)) = {FALSE})} \/ {front__ |-> bool(ran(valid_sensors_gear_extended(front__) <| gear_extended(front__)) \/ ran(valid_sensors_gear_retracted(front__) <| gear_retracted(front__)) = {FALSE})}
    END;
  
  env_turn_on_red_light = 
    SELECT 
        /* @Ref7_Time:grd  */ red_light = off
      & /* @Ref7_Time:grd2  */ anomaly = TRUE
    THEN 
      red_light := on
    END;
  
  env_turn_on_orange_light = 
    SELECT 
        /* @Ref7_Time:grd  */ orange_light = off
      & /* @Ref7_Time:grdNotManeuveringFront  */ gears_maneuvering(front__) = TRUE
      & /* @Ref7_Time:grdNotManeuveringLeft  */ gears_maneuvering(left__) = TRUE
      & /* @Ref7_Time:grdNotManeuveringRight  */ gears_maneuvering(right__) = TRUE
    THEN 
      orange_light := on
    END;
  
  env_turn_off_orange_light = 
    SELECT 
        /* @Ref7_Time:grd  */ orange_light = on
      & /* @Ref7_Time:grdNotManeuveringFront  */ gears_maneuvering(front__) = FALSE
      & /* @Ref7_Time:grdNotManeuveringLeft  */ gears_maneuvering(left__) = FALSE
      & /* @Ref7_Time:grdNotManeuveringRight  */ gears_maneuvering(right__) = FALSE
    THEN 
      orange_light := off
    END;
  
  env_turn_on_green_light = 
    SELECT 
        /* @Ref7_Time:grd  */ green_light = off
      & /* @Ref7_Time:grdLockedDownFront  */ gears_locked_down(front__) = TRUE
      & /* @Ref7_Time:grdLockedDownLeft  */ gears_locked_down(left__) = TRUE
      & /* @Ref7_Time:grdLockedDownRight  */ gears_locked_down(right__) = TRUE
    THEN 
      green_light := on
    END;
  
  env_turn_off_green_light = 
    SELECT 
        /* @Ref7_Time:grd  */ green_light = on
      & /* @Ref7_Time:grdNotLockedDownFront  */ gears_locked_down(front__) = FALSE
      & /* @Ref7_Time:grdNotLockedDownLeft  */ gears_locked_down(left__) = FALSE
      & /* @Ref7_Time:grdNotLockedDownRight  */ gears_locked_down(right__) = FALSE
    THEN 
      green_light := off
    END;
  
  sensor_invalid_gear_extended = 
    ANY notval,pos,val
    WHERE 
        notval : BOOL
      & pos : POSITION
      & val : BOOL
      & (notval = TRUE) <=> (val = FALSE)
      & /* @Ref7_Time:validyet  */ card(valid_sensors_gear_extended(pos)) = 3
      & /* @Ref7_Time:nowinvalid  */ card(ran(valid_sensors_gear_extended(pos) <| gear_extended(pos))) > 1
      & /* @Ref7_Time:validvalue  */ card(gear_extended(pos) |> {val}) = 2
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
      & /* @Ref7_Time:validyet  */ card(valid_sensors_gear_retracted(pos)) = 3
      & /* @Ref7_Time:nowinvalid  */ card(ran(valid_sensors_gear_retracted(pos) <| gear_retracted(pos))) > 1
      & /* @Ref7_Time:validvalue  */ card(gear_retracted(pos) |> {val}) = 2
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
      & /* @Ref7_Time:validyet  */ card(valid_sensors_door_open(pos)) = 3
      & /* @Ref7_Time:nowinvalid  */ card(ran(valid_sensors_door_open(pos) <| door_open(pos))) > 1
      & /* @Ref7_Time:validvalue  */ card(door_open(pos) |> {val}) = 2
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
      & /* @Ref7_Time:validyet  */ card(valid_sensors_door_closed(pos)) = 3
      & /* @Ref7_Time:nowinvalid  */ card(ran(valid_sensors_door_closed(pos) <| door_closed(pos))) > 1
      & /* @Ref7_Time:validvalue  */ card(door_closed(pos) |> {val}) = 2
    THEN
         valid_sensors_door_closed := valid_sensors_door_closed <+ {pos |-> valid_sensors_door_closed(pos) - dom(door_closed(pos) |> {notval})}
      ||
         proof_sensors := FALSE
    END;
  
  sensor_invalid_Anomaly = 
    ANY pos
    WHERE 
        pos : POSITION
      & (/* @Ref7_Time:invalid  */ (card(valid_sensors_gear_extended(pos)) = 2 & card(ran(valid_sensors_gear_extended(pos) <| gear_extended(pos))) > 1) or ((card(valid_sensors_gear_retracted(pos)) = 2 & card(ran(valid_sensors_gear_retracted(pos) <| gear_retracted(pos))) > 1) or ((card(valid_sensors_door_open(pos)) = 2 & card(ran(valid_sensors_door_open(pos) <| door_open(pos))) > 1) or (card(valid_sensors_door_closed(pos)) = 2 & card(ran(valid_sensors_door_closed(pos) <| door_closed(pos))) > 1))))
    THEN
         anomaly := TRUE
      ||
         proof_sensors := FALSE
    END
END
