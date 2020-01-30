MACHINE Interval3_small
/* Same as Interval1 but with NAT instead of NATURAL
*/
DEFINITIONS
 SET_PREF_MAXINT == 15 /* 2147483647 */
CONSTANTS x,y,z
PROPERTIES
 x:NAT & y:NAT & z:NAT &
 x = y * z &
 x >10 & x<13 & 
 y > z 
OPERATIONS
  rx,ry,rz <-- GET = BEGIN rx,ry,rz := x,y,z END
END