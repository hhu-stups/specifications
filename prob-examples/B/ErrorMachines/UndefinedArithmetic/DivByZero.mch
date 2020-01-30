MACHINE DivByZero
CONSTANTS x,y,z
PROPERTIES
 x:INT & y:INT & z:INT &
 x>0 & y=2 mod x &
 z=3 / (x-1)  /* <-- here x-1 can be 0 */
END

