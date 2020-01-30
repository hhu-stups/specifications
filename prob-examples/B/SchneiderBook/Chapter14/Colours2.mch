MACHINE           Colours2

SETS              COLOUR = {red, green, blue}

VARIABLES         cols

INVARIANT         cols <: COLOUR

INITIALISATION    ANY ss WHERE ss <: COLOUR & blue /: ss THEN cols := ss END

OPERATIONS

  add(cc) =
  PRE cc : COLOUR THEN cols := cols \/ {cc} END;

cc <-- inquery = 
  PRE cols /= {} THEN cc :: cols END;

cc <-- outquery = 
  PRE cols /= COLOUR THEN cc :: COLOUR - cols END;

  change = cols :: POW(COLOUR) - {cols};

  invert =
  PRE cols /= COLOUR THEN cols := COLOUR - cols END

END
