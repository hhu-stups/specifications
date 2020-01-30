
MACHINE Ref1_Valve_proven_eventb
SETS /* enumerated */
  DOOR_STATE={open,closed,door_moving};
  GEAR_STATE={retracted,extended,gear_moving};
  HANDLE_STATE={up,down};
  PLANE_STATE={ground,flight};
  POSITION={front__,left__,right__};
  SWITCH_STATE={switch_open,switch_closed};
  VALVE_STATE={valve_open,valve_closed}
ABSTRACT_VARIABLES
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
  env_close_valve_extend_gear */
INVARIANT
    close_door_valve : VALVE_STATE
  & extend_gear_valve : VALVE_STATE
  & open_door_valve : VALVE_STATE
  & retract_gear_valve : VALVE_STATE
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
    END
OPERATIONS
  env_start_extending = 
    SELECT 
        /* @Ref1_Valve:grd2  */ ran(gear) = {retracted}
      & /* @Ref1_Valve:grd3  */ extend_gear_valve = valve_open
      & /* @Ref1_Valve:grd4  */ retract_gear_valve = valve_closed
    THEN 
      gear := {front__ |-> gear_moving,left__ |-> gear_moving,right__ |-> gear_moving}
    END;
  
  env_extend_gear = 
    SELECT 
        /* @Ref1_Valve:grd2  */ ran(gear) = {gear_moving}
      & /* @Ref1_Valve:grd3  */ extend_gear_valve = valve_open
      & /* @Ref1_Valve:grd4  */ retract_gear_valve = valve_closed
    THEN 
      gear := {front__ |-> extended,left__ |-> extended,right__ |-> extended}
    END;
  
  env_retract_gear = 
    SELECT 
        /* @Ref1_Valve:grd2  */ ran(gear) = {gear_moving}
      & /* @Ref1_Valve:grd3  */ retract_gear_valve = valve_open
      & /* @Ref1_Valve:grd4  */ extend_gear_valve = valve_closed
    THEN 
      gear := {front__ |-> retracted,left__ |-> retracted,right__ |-> retracted}
    END;
  
  env_start_retracting = 
    SELECT 
        /* @Ref1_Valve:grd2  */ ran(gear) = {extended}
      & /* @Ref1_Valve:grd3  */ retract_gear_valve = valve_open
      & /* @Ref1_Valve:grd4  */ extend_gear_valve = valve_closed
    THEN 
      gear := {front__ |-> gear_moving,left__ |-> gear_moving,right__ |-> gear_moving}
    END;
  
  env_start_open_door = 
    SELECT 
        /* @Ref1_Valve:grd2  */ ran(door) = {closed}
      & /* @Ref1_Valve:grd3  */ open_door_valve = valve_open
      & /* @Ref1_Valve:grd4  */ close_door_valve = valve_closed
    THEN 
      door := {front__ |-> door_moving,left__ |-> door_moving,right__ |-> door_moving}
    END;
  
  env_open_door = 
    SELECT 
        /* @Ref1_Valve:grd2  */ ran(door) = {door_moving}
      & /* @Ref1_Valve:grd3  */ open_door_valve = valve_open
      & /* @Ref1_Valve:grd4  */ close_door_valve = valve_closed
    THEN 
      door := {front__ |-> open,left__ |-> open,right__ |-> open}
    END;
  
  env_close_door = 
    SELECT 
        /* @Ref1_Valve:grd2  */ ran(door) = {door_moving}
      & /* @Ref1_Valve:grd3  */ close_door_valve = valve_open
      & /* @Ref1_Valve:grd4  */ open_door_valve = valve_closed
    THEN 
      door := {front__ |-> closed,left__ |-> closed,right__ |-> closed}
    END;
  
  env_start_close_door = 
    SELECT 
        /* @Ref1_Valve:grd1  */ ran(door) = {open}
      & /* @Ref1_Valve:grd3  */ close_door_valve = valve_open
      & /* @Ref1_Valve:grd4  */ open_door_valve = valve_closed
    THEN 
      door := {front__ |-> door_moving,left__ |-> door_moving,right__ |-> door_moving}
    END;
  
  env_open_valve_open_door = 
    SELECT 
        /* @Ref1_Valve:grd1  */ open_door_valve = valve_closed
    THEN 
      open_door_valve := valve_open
    END;
  
  env_close_valve_open_door = 
    SELECT 
        /* @Ref1_Valve:grd1  */ open_door_valve = valve_open
    THEN 
      open_door_valve := valve_closed
    END;
  
  env_open_valve_close_door = 
    SELECT 
        /* @Ref1_Valve:grd1  */ close_door_valve = valve_closed
    THEN 
      close_door_valve := valve_open
    END;
  
  env_close_valve_close_door = 
    SELECT 
        /* @Ref1_Valve:grd1  */ close_door_valve = valve_open
    THEN 
      close_door_valve := valve_closed
    END;
  
  env_open_valve_retract_gear = 
    SELECT 
        /* @Ref1_Valve:grd1  */ retract_gear_valve = valve_closed
    THEN 
      retract_gear_valve := valve_open
    END;
  
  env_close_valve_retract_gear = 
    SELECT 
        /* @Ref1_Valve:grd1  */ retract_gear_valve = valve_open
    THEN 
      retract_gear_valve := valve_closed
    END;
  
  env_open_valve_extend_gear = 
    SELECT 
        /* @Ref1_Valve:grd1  */ extend_gear_valve = valve_closed
    THEN 
      extend_gear_valve := valve_open
    END;
  
  env_close_valve_extend_gear = 
    SELECT 
        /* @Ref1_Valve:grd1  */ extend_gear_valve = valve_open
    THEN 
      extend_gear_valve := valve_closed
    END
END
