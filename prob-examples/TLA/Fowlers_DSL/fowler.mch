MACHINE fowler
DEFINITIONS
 Init == state = "idle"
	 & light = "off"
	 & draw = "closed"
	 & door = "unlocked"
	 & panel = "locked";

VARIABLES state, light, draw, panel, door
INVARIANT
 state : STRING
 & light : STRING
 & draw : STRING
 & panel : STRING
 & door : STRING
INITIALISATION
 state, light, draw, panel, door:(Init)
OPERATIONS
 CloseDoor_Op = ANY state_n, door_n
	WHERE door = "unlocked"
	 & door_n = "locked"
	 & state_n = "active"
	 & TRUE = TRUE
	THEN state, door := state_n, door_n END;

 LightOn_Op = ANY state_n, light_n, panel_n, door_n
	WHERE light = "off"
	 & light_n = "on"
	 & ((draw = "opened" 
	  => state_n = "unlockedPanel" & panel_n = "unlocked" & door_n = "locked") 
	 & (not(draw = "opened") 
	  => state_n = "waitingForDraw"
	  & panel_n = panel & door_n = door))
	  & TRUE = TRUE
	THEN state, light, panel, door := state_n, light_n, panel_n, door_n END;

 OpenDraw_Op = ANY state_n, draw_n, panel_n, door_n
	WHERE draw = "closed"
	 & draw_n = "opened"
	 & ((light = "on" 
	  => state_n = "unlockedPanel" & panel_n = "unlocked" & door_n = "locked") 
	 & (not(light = "on") 
	  => state_n = "waitingForLight"
	  & panel_n = panel & door_n = door))
	  & TRUE = TRUE
	THEN state, draw, panel, door := state_n, draw_n, panel_n, door_n END;

 ClosePanel_Op = ANY state_n, light_n, draw_n, panel_n, door_n
	WHERE panel = "unlocked"
	 & panel_n = "locked"
	 & light_n = "off"
	 & draw_n = "closed"
	 & door_n = "unlocked"
	 & state_n = "idle"
	THEN state, light, draw, panel, door := state_n, light_n, draw_n, panel_n, door_n END
END
/* Created Thu Dec 15 11:35:08 CET 2011 by TLA2B */