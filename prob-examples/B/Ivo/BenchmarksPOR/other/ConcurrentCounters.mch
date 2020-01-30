MACHINE ConcurrentCounters
VARIABLES x,y,z
INVARIANT
 x:INTEGER & x < 65 & y:NATURAL & z:INTEGER
INITIALISATION x:=0 || y:=0 || z:= -1
OPERATIONS
  Inc_xx = PRE y>0 & x<70 THEN x:= x+1 END;
  Inc_yy = PRE y<30 THEN y:= y+1 END;
  Inc_zz = PRE z<50 THEN z := z+1 END;
  Loop = PRE x=70 & y=30 & z=50 THEN skip END
END