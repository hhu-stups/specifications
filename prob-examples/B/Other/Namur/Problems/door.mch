MODEL
	door
SETS
	DOOR; POSITION = {open, closed}
VARIABLES
	position
INVARIANT
	position : DOOR --> POSITION 
INITIALISATION
	position := DOOR * {closed}
OPERATIONS
	opendoor(dd) =
		PRE dd : DOOR
		THEN position(dd) := open
		END;
	closedoor(dd) =
		PRE dd : DOOR
		THEN position(dd) := closed
		END
END