MACHINE           Time

SETS              TIME

VARIABLES         time

INVARIANT         time : TIME

INITIALISATION    time :: TIME

OPERATIONS

  input(tt) =
  PRE tt : TIME
  THEN skip
  END;

 tt <-- output = tt := time

END
