
MACHINE IntegerOperations_internal
ABSTRACT_VARIABLES
  /*@ unit "10 * m" */ x,
  /*@ unit "10 * m" */ y,
  /*@ inferred_unit "error" */ z1,
  /*@ inferred_unit "10*m" */ z2
INVARIANT
    x : NATURAL
  & y : NATURAL
  & z1 : NATURAL
  & z2 : NATURAL
INITIALISATION
    BEGIN
      x,y,z1,z2 := 0,0,3,3
    END
OPERATIONS
  n <-- getX =
    BEGIN
      n := x
    END;

  n <-- addX =
    BEGIN
         x := x + 1
      ||
         n := x + 1
    END;

  n <-- addY =
    BEGIN
         y := y + 1
      ||
         n := y + 1
    END;

  n <-- plus =
    BEGIN
         x := x + y
      ||
         n := x + y
    END;

  n <-- minus =
    BEGIN
         x := x - y
      ||
         n := x - y
    END;

  n <-- uminus =
    BEGIN
         x := - x
      ||
         n := - x
    END;

  n <-- mult =
    BEGIN
         x := x * y
      ||
         n := x * y
    END;

  n <-- div =
    BEGIN
         x := x / y
      ||
         n := x / y
    END;

  n <-- modulo =
    BEGIN
         x := x mod y
      ||
         n := x mod y
    END;

  n <-- pow(a) =
    PRE
        a : INTEGER
    THEN
      n := x ** a
    END;

  n <-- typeByUse1 =
    BEGIN
      n := z1 + x
    END;

  n <-- typeByUse2 =
    BEGIN
      n := z2 + y
    END
END
