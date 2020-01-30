MODEL
   store
VARIABLES
   xx, yy
INVARIANT
   xx : INTEGER & yy : INTEGER
INITIALISATION
   xx := 1 || yy := 2
OPERATIONS
   c(zz) =
     PRE zz : INTEGER THEN xx := xx + zz END;

   t(zz) =
     PRE zz : INTEGER THEN yy := yy + zz END;

   zz <-- d = zz := xx + yy
END