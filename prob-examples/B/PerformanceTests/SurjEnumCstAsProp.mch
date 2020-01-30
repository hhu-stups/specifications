MACHINE SurjEnumCstAsProp

CONSTANTS c , xx
PROPERTIES c=0 & 
 xx: 1..9 +->> 0..7
  /* 1..9 +->> 0..7 & xx(1)=5 & xx(9) =2 */
OPERATIONS
  y <-- get = y:=xx[{9}];
  y <-- get2 = y:= xx(1)
END