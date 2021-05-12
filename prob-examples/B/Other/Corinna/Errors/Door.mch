MACHINE Door

SETS DOORS; DOOR_STATE = {opened, closed}

VARIABLES state

INVARIANT state : DOORS --> DOOR_STATE

INITIALISATION state := DOORS * {closed}

OPERATIONS
	opening(dd) =
		PRE dd : DOORS & state(dd) = closed
		THEN state(dd) := opened
		END;

	closing(dd) =
		PRE dd : DOORS & state(dd) = opened
		THEN state(dd) := closed
		END

END

