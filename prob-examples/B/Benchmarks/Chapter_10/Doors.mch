MACHINE           Doors

SETS              DOOR = {door1,door2,door3}; POSITION = {open, closed}

VARIABLES         position

INVARIANT         position : DOOR --> POSITION

INITIALISATION    position := DOOR * {closed}

OPERATIONS

  opening(dd) = 
  PRE dd : DOOR THEN position(dd) := open END;

  closedoor(dd) = 
  PRE dd : DOOR THEN position(dd) := closed END

END
