MACHINE PruningActionsTest1
VARIABLES x,y,z
INVARIANT
 x:INTEGER & y:NAT & y <5 & z:INTEGER
INITIALISATION x:=0 || y:=0 || z:= -1
OPERATIONS
  Inc_x = PRE y>0 & x <1 THEN x:= x+1 END;
  Inc_y = BEGIN y:= y+1 END;
  Inc_z = PRE z <10 THEN z := z+1 END
END
