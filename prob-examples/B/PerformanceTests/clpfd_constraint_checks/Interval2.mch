MACHINE Interval2
/* Same as Interval1 but with NAT instead of NATURAL
*/
DEFINITIONS
 SET_PREF_MAXINT == 2147483647
CONSTANTS x,y,z
PROPERTIES
 x:NAT & y:NAT & z:NAT &
 x < y & y < z & x>19055 & z <19060 & x+3=z 
ASSERTIONS
 !(xx,y,zz).(xx:NAT & y:NAT & zz:NAT &
 xx < y & y < z & xx>19055 & zz <19060 & xx+3=zz => (xx=19056 & zz=19059) )
OPERATIONS
  rx,ry,rz <-- GET = BEGIN rx,ry,rz := x,y,z END
END

