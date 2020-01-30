MACHINE ArithDisjunctionComplicated1
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
 (x>5 or y=2)&

 (x<20 or x>20) &
 (x<30 or x>30) &
 (x<40 or x>40) &
 (x<50 or x>50) &
 (x<60 or x>60) &
 (x<70 or x>70) &
 (x<80 or x>80) &
 (x<90 or x>90) &
 (x<100 or x>100) &
 (x<110 or x>110) &
 (x<120 or x>120) &
 (y<20 or y>20) &
 (y<30 or y>30) &
 (y<40 or y>40) &
 (y<50 or y>50) &
 (y<60 or y>60) &
 (y<70 or y>70) &
 (y<80 or y>80) &
 (y<90 or y>90) &
 (y<100 or y>100) &
 (y<110 or y>110) &
 (y<120 or y>120) 
OPERATIONS
  rx,ry <-- Get = BEGIN rx,ry := x,y END
END

