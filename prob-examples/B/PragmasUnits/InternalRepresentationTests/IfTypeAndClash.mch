MACHINE IfTypeAndClash

CONSTANTS
    /*@ unit "10 * m**1" */ one,
    /*@ unit "10**-1 * m**1" */ another_one

PROPERTIES
    one = 1 & another_one = 1

VARIABLES
  xx,
  yy,
  zz

INVARIANT
  xx : NAT & yy : NAT & zz : NAT

INITIALISATION
  xx,yy,zz := 1,0,1

OPERATIONS
  iftypexone = IF xx > 0 THEN
            xx := xx - one
          ELSIF xx < 0 THEN
            xx := xx + 1
          ELSE
            skip
         END;

  iftypezboth = IF zz > 0 THEN
            zz := zz - one
          ELSIF zz < 0 THEN
            zz := zz + one
          ELSE
            skip
         END;

  ifclashy = IF yy > 0 THEN
            yy := yy - one
          ELSE
            yy := yy + another_one
         END
END
