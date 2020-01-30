MACHINE           Colours

SETS              COLOUR = {red, green, blue}

VARIABLES         cols

INVARIANT         cols <: COLOUR

INITIALISATION    cols :: POW(COLOUR - {blue})

OPERATIONS

  add(cc) =
  PRE cc : COLOUR THEN cols := cols \/ {cc} END;

cc <-- query = 
  PRE cols /= {} THEN cc :: cols END;

  change = cols :: POW(COLOUR) - {cols}

END
