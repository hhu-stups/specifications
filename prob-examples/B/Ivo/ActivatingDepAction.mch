MACHINE ActivatingDepAction
VARIABLES x,y,z
INVARIANT
 x:INT & y:INT & z:INT & z /= 10
INITIALISATION x:=0 || y:=0 || z:= 0
OPERATIONS
  Inc_x = PRE x = 0 & y=0 THEN x:= x+1 END;
  Inc_z1 = PRE z=0 THEN z := z+1 END;
  Inc_z2 = PRE z =1 THEN z := z+1 END;
  Inc_z3 = PRE (x=1 & y=0 & z=2) THEN z := z-1 END;
  Inc_y = PRE z=2 & x=0 THEN z := 10 END
END
