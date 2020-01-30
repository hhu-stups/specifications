
MACHINE SimpleCorrectUsage_internal
ABSTRACT_VARIABLES
  /*@ unit "10**1 * m**1" */ xx,
  /*@ unit "10**1 * m**1" */ yy,
  /*@ unit "10**2 * m**2" */ zz,
  /*@ inferred_unit "10*m" */ test
INVARIANT
    xx : NAT
  & yy : NAT
  & zz : NAT
  & test : NAT
INITIALISATION
    BEGIN
      xx,yy,zz,test := 1,2,3,4
    END
OPERATIONS
  multiply =
    BEGIN
      zz := xx * yy
    END;

  add =
    BEGIN
      xx := yy + 1
    END;

  sub =
    BEGIN
      xx := yy - 1
    END;

  type =
    BEGIN
      test := yy
    END
END
