MACHINE WrongComparisonInInvariant
VARIABLES
  /*@ unit "10**1 * m**1" */ xx,
  /*@ unit "10**1 * m**2" */ yy
INVARIANT
  xx:NAT &
  yy:NAT &
  xx > yy
INITIALISATION xx,yy:=1,0
OPERATIONS
  addToXX = PRE xx < 3 THEN xx:=xx+1 END;
  subFromXX = PRE xx > 1 THEN xx:=xx-1 END
END
