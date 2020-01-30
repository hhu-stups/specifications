
MACHINE InvolvedConstraintUnitsUnsat_internal
ABSTRACT_VARIABLES
  /*@ unit "m" */ x,
  /*@ inferred_unit "m**-1" */ y,
  /*@ inferred_unit "unknown" */ w,
  /*@ unit "s" */ v
INVARIANT
    x : INTEGER
  & y : INTEGER
  & w : INTEGER
  & v : INTEGER
INITIALISATION
    BEGIN
      x,y,v,w := 1,1,1,1
    END
OPERATIONS
  Op = 
    BEGIN
      v := x * y * v + x * y * y * v
    END
END
