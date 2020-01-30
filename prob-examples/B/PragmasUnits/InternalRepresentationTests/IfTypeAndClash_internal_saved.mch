
MACHINE IfTypeAndClash_internal
CONCRETE_CONSTANTS
  /*@ unit "10 * m**1" */ one,
  /*@ unit "10**-1 * m**1" */ another_one
ABSTRACT_VARIABLES
  /*@ inferred_unit "10*m" */ xx,
  /*@ inferred_unit "unknown" */ yy,
  /*@ inferred_unit "unknown" */ zz
PROPERTIES
    one : INTEGER
  & another_one : INTEGER
  & one = 1
  & another_one = 1
INVARIANT
    xx : NAT
  & yy : NAT
  & zz : NAT
INITIALISATION
    BEGIN
      xx,yy,zz := 1,0,1
    END
OPERATIONS
  iftypexone =
    IF xx > 0 THEN
      xx := xx - one
    ELSIF xx < 0 THEN
      xx := xx + 1
    END;

  iftypezboth =
    IF zz > 0 THEN
      zz := zz - one
    ELSIF zz < 0 THEN
      zz := zz + one
    END;

  ifclashy =
    IF yy > 0 THEN
      yy := yy - one
    ELSE
      yy := yy + another_one
    END
END
