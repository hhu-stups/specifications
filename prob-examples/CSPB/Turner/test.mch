MACHINE test
SETS SIMPLE = {apple,pear,banana}
VARIABLES aa,bb
INVARIANT
  aa : SIMPLE &
  bb : SIMPLE
INITIALISATION
  aa :: SIMPLE ||
  bb :: SIMPLE
OPERATIONS
  ww <-- GetA =
   BEGIN
    ww := aa
   END;

  ww <-- GetB =
   BEGIN
    ww := bb
   END;

  SetA(xx) =
  PRE xx : SIMPLE
  THEN aa := xx
  END;

  SetB(xx) =
  PRE xx : SIMPLE
  THEN bb := xx
  END
END