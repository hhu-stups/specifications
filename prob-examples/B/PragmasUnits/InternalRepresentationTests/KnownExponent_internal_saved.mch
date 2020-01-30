
MACHINE KnownExponent_internal
ABSTRACT_VARIABLES
  /*@ unit "m" */ x,
  /*@ unit "10**2 * m**2" */ x2,
  /*@ inferred_unit "m**2" */ y,
  /*@ inferred_unit "10**4*m**4" */ y2
INVARIANT
    x : NATURAL
  & y : NATURAL
  & x2 : NATURAL
  & y2 : NATURAL
INITIALISATION
    BEGIN
      x,x2,y,y2 := 1,1,1,1
    END
OPERATIONS
  n <-- exponent =
    BEGIN
      n,y := x ** 2,x ** 2
    END;

  n <-- exponent2 =
    BEGIN
      n,y2 := x2 ** 2,x2 ** 2
    END
END
