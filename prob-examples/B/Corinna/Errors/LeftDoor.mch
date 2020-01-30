MACHINE LeftDoor

INCLUDES Door

SETS LEVEL_STATE_LD = {lowLD, highLD}; LEFTDOORS

PROPERTIES LEFTDOORS <: DOORS  /* not allowed but ProB should warn ! */

VARIABLES right_levelLD, left_levelLD

INVARIANT right_levelLD : LEFTDOORS --> LEVEL_STATE_LD &
	  left_levelLD : LEFTDOORS --> LEVEL_STATE_LD &
	  left_levelLD : LEFTDOORS --> {lowLD} &
	  !(dd).(dd : LEFTDOORS & left_levelLD(dd) /= right_levelLD(dd) 
		=> state(dd) = closed)

INITIALISATION right_levelLD := LEFTDOORS * {lowLD} ||
	       left_levelLD := LEFTDOORS * {lowLD}

OPERATIONS
	open_doorLD(dd) = 
		PRE dd : LEFTDOORS & right_levelLD(dd) = left_levelLD(dd)
		THEN opening(dd)
		END;

	close_doorLD(dd) = 
		PRE dd : LEFTDOORS
		THEN state(dd) := closed /* closing(dd)*/
		END;

	low_right_levelLD(dd) = 
		PRE dd : LEFTDOORS & state(dd) = closed
		THEN right_levelLD(dd) := lowLD
		END; 

	high_right_levelLD(dd) = 
		PRE dd : LEFTDOORS & state(dd) = closed
		THEN right_levelLD(dd) := highLD
		END	
END