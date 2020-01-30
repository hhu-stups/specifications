MACHINE SimpleArith
DEFINITIONS
 SET_PREF_MAXINT == 200
CONSTANTS x,y
PROPERTIES
 x:NAT & y:NAT &

 (x=100 or x<10) & 
 (y=100 or y<10) &
 (x=2 or x=3) &
 (x<3 or x>20) &
 (x<5 or y=3) &
 (x>5 or y=2)
OPERATIONS
  rx,ry <-- Get = BEGIN rx,ry := x,y END
END