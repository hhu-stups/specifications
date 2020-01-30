MACHINE Inverval3
/* Same as Interval1 but with NAT instead of NATURAL
*/
DEFINITIONS
 SET_PREF_MAXINT == 121 /* 2147483647 */
CONSTANTS x,y,z
PROPERTIES
 x:NAT & y:NAT & z:NAT &
 x = y * z &
 x >100 & x<117 & z>7 & y+z > 21 &
 y > z 
/* Z #> 0, Y #>0, X #= Y*Z, X #> 100, X #<120, Y #> Z */
ASSERTIONS
 !(xx,y,zz).(xx:NAT & y:NAT & zz:NAT &
 xx < y & y < z & xx>19055 & zz <19060 & xx+3=zz => (xx=19056 & zz=19059) )
OPERATIONS
  rx,ry,rz <-- GET = BEGIN rx,ry,rz := x,y,z END
END

