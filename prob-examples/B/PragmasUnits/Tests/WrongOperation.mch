MACHINE WrongOperation
VARIABLES
  /*@ unit "10 * m" */ xx,
  /*@ unit "10 * m" */ yy,
  /*@ unit "10 * m" */ zz
INVARIANT
  xx:NAT &
  yy:NAT &
  zz:NAT
INITIALISATION xx,yy,zz:=1,2,3
OPERATIONS
  multiply = zz := xx*yy
END
