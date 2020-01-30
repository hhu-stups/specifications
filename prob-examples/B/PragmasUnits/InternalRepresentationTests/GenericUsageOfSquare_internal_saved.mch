
MACHINE GenericUsageOfSquare_internal
ABSTRACT_VARIABLES
  /*@ unit "m" */ xx,
  /*@ unit "m" */ yy,
  /*@ inferred_unit "m**2" */ vv,
  /*@ inferred_unit "m**2" */ ww
INVARIANT
    yy : INTEGER
  & xx : NATURAL
  & vv : NATURAL
  & ww : NATURAL
INITIALISATION
    BEGIN
         xx := 2
      ||
         yy := -2
      ||
         vv := 0
      ||
         ww := 0
    END
OPERATIONS
  Sq =
    BEGIN
         vv := xx * xx
      ||
         ww <-- SquaringFunction__Square_Call(yy)
    END;

  res <-- SquaringFunction__Square_Call(ss) =
    PRE
        ss : INTEGER
    THEN
      res := ss * ss
    END
END
