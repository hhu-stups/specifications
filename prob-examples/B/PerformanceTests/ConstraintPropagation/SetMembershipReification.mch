MACHINE SetMembershipReification
SETS
 ID={aa,bb,cc,dd,ee,ff,gg}
CONSTANTS s,x,y,z,v
PROPERTIES
  x:0..9999 & y: 0..9999 & z:0..9999 & v: 0..99999 &
  (s:{aa,bb,cc} or x=999) &
  s:{dd,ff,gg} &
  (y:{1,2,3} \/ {20,21,23} or z=999) &
  y: {1024,1025,1026} &
  (s:{cc,ee} or v>9997) &
  (s:{cc,ee} or v<19999) &
  (s:{cc,ee} or v>9998) &
  (s:{cc,ee} or v<10000)& 
  (s:{dd,gg} or v=33)
/* & s=gg */
OPERATIONS
  r <-- Get = BEGIN r:= x+y+z END
END

