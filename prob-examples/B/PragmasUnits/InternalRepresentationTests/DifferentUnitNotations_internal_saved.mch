
MACHINE DifferentUnitNotations_internal
ABSTRACT_VARIABLES
  /*@ unit "10 * m**1" */ x1,
  /*@ unit "10**1 * m" */ x2,
  /*@ unit "10 * m" */ x3,
  /*@ unit "m*10" */ x4
INVARIANT
    x1 : NAT
  & x2 : NAT
  & x3 : NAT
  & x4 : NAT
INITIALISATION
    BEGIN
      x1,x2,x3,x4 := 0,0,0,0
    END
OPERATIONS
  n <-- cmp1 =
    BEGIN
      n := x1 + x2
    END;

  n <-- cmp2 =
    BEGIN
      n := x1 + x3
    END;

  n <-- cmp3 =
    BEGIN
      n := x1 + x4
    END;

  n <-- cmp4 =
    BEGIN
      n := x2 + x3
    END;

  n <-- cmp5 =
    BEGIN
      n := x2 + x4
    END;

  n <-- cmp6 =
    BEGIN
      n := x3 + x4
    END
END
