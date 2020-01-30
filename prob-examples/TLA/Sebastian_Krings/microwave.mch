MACHINE MicroWave
DEFINITIONS
 Init == magnetron_running = FALSE
	 & door_open = FALSE
	 & button_locked = FALSE
	 & error = FALSE
	 & time = 0;

 Action_Start == error = FALSE
	 & magnetron_running = FALSE
	 & door_open = FALSE
	 & time /= 0
	 & magnetron_running_n = TRUE
	 & button_locked_n = TRUE
	 & door_open_n = door_open & time_n = time & error_n = error;

 Action_Stop == magnetron_running = TRUE
	 & magnetron_running_n = FALSE
	 & button_locked_n = FALSE
	 & time_n = 0
	 & door_open_n = door_open & error_n = error;

 TypeInvariant == magnetron_running : BOOL
	 & door_open : BOOL
	 & button_locked : BOOL
	 & error : BOOL
	 & time : 0 .. 180;

VARIABLES magnetron_running, door_open, button_locked, time, error
INVARIANT
 magnetron_running : BOOL
 & door_open : BOOL
 & button_locked : BOOL
 & time : INTEGER
 & error : BOOL
 & TypeInvariant
INITIALISATION
 magnetron_running, door_open, button_locked, time, error:(Init)
OPERATIONS
 Action_Open_Door_Op = ANY door_open_n
	WHERE button_locked = FALSE
	 & magnetron_running = FALSE
	 & door_open = FALSE
	 & door_open_n = TRUE
	 & TRUE = TRUE
	THEN door_open := door_open_n END;

 Action_Close_Door_Op = ANY door_open_n
	WHERE door_open = TRUE
	 & door_open_n = FALSE
	 & TRUE = TRUE
	THEN door_open := door_open_n END;

 Action_Change_Time_Op = ANY time_n
	WHERE magnetron_running = FALSE
	 & (time = 180
	 & time_n = 120
	 or (time = 120
	 & time_n = 90)
	 or (time = 90
	 & time_n = 60)
	 or (time = 60
	 & time_n = 30)
	 or (time = 30
	 & time_n = 15)
	 or (time = 15
	 & time_n = 180)
	 or (time = 0
	 & time_n = 180))
	 & TRUE = TRUE
	THEN time := time_n END;

 Action_Button_S_Op = ANY magnetron_running_n, door_open_n, button_locked_n, time_n, error_n
	WHERE (magnetron_running = FALSE 
	  => Action_Start) 
	 & (not(magnetron_running = FALSE) 
	  => Action_Stop)
	THEN magnetron_running, door_open, button_locked, time, error := magnetron_running_n, door_open_n, button_locked_n, time_n, error_n END;

 Action_Error_Op = ANY magnetron_running_n, error_n
	WHERE error_n = TRUE
	 & magnetron_running_n = FALSE
	 & TRUE = TRUE
	THEN magnetron_running, error := magnetron_running_n, error_n END;

 Action_Tick_Op = ANY magnetron_running_n, door_open_n, button_locked_n, time_n, error_n
	WHERE magnetron_running = TRUE
	 & ((time /= 1 
	  => time_n = time - 1
	  & door_open_n = door_open & magnetron_running_n = magnetron_running & button_locked_n = button_locked & error_n = error) 
	 & (not(time /= 1) 
	  => time_n = 0
	  & magnetron_running_n = FALSE
	  & button_locked_n = FALSE
	  & door_open_n = door_open & error_n = error))
	THEN magnetron_running, door_open, button_locked, time, error := magnetron_running_n, door_open_n, button_locked_n, time_n, error_n END
END
/* Created Mon Dec 19 11:32:22 CET 2011 by TLA2B */