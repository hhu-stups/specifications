MACHINE SimpleCorrectUsage
VARIABLES
  /*@ unit "10**1 * m**1" */ xx,
  /*@ unit "10**1 * m**1" */ yy,
  /*@ unit "10**2 * m**2" */ zz,
  test
INVARIANT
  xx:NAT &
  yy:NAT &
  zz:NAT &
  test:NAT
INITIALISATION xx,yy,zz,test:=1,2,3,4
OPERATIONS
  multiply = zz := xx*yy;
  add      = xx := yy+1;
  sub      = xx := yy-1;
  type     = test := yy
END
