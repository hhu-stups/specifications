MACHINE 	elevator
INCLUDES 	door
CONSTANTS 	nb
PROPERTIES 	nb >= 2 
		& nb = 3 
		& card(DOOR) = 3
VARIABLES	level
INVARIANT	level : DOOR
INITIALISATION	level := min(DOOR)
OPERATIONS	move = 	PRE !(xx).(xx:DOOR) => xx = closed
			THEN level :: DOOR
			END
END

