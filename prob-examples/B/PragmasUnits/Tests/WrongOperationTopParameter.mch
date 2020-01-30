MACHINE WrongOperationTopParameter
VARIABLES
  /*@ unit "10**1 * m**1" */ xx,
  /*@ unit "10**1 * m**2" */ yy
INVARIANT
  xx:NAT &
  yy:NAT
INITIALISATION xx,yy:=1,2
OPERATIONS
  add_up =
    xx := xx + yy;

  increment(p) =
    xx := xx+p
END
