MACHINE Interval1
/* The following can only be solved efficiently without timeout after first two solutions
   if we propagate interval information for <,... constraints */
/* Similarly, assertions can only be checked if we propagate interval info */
   /* Note in Prolog we get:
   ?- X #< Y , Y2 #< Z , X2 #> 19055 ,  Z2 #<19060, X2=X, Y2=Y, Z2=Z..
   Y in 19057..19058,
   X in 19056..19057,
   Z in 19058..19059 ? 
*/
DEFINITIONS
 SET_PREF_MAXINT == 2147483647
CONSTANTS x,y,z
PROPERTIES
 x:NATURAL & y:NATURAL & z:NATURAL &
 x < y & y < z & x>19055 & z <19060 & x+3=z 
ASSERTIONS
 !(xx,y,zz).(xx:NATURAL & y:NATURAL & zz:NATURAL &
 xx < y & y < z & xx>19055 & zz <19060 & xx+3=zz => (xx=19056 & zz=19059) )
OPERATIONS
  rx,ry,rz <-- GET = BEGIN rx,ry,rz := x,y,z END
END

