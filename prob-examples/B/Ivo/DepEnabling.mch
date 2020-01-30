MACHINE DepEnabling
VARIABLES x,y,z,w
INVARIANT
 x:INTEGER & y:INTEGER & z:INTEGER & w:INTEGER
INITIALISATION x,y,z,w := 0,0,0,0
OPERATIONS
  Op1 = PRE x=0 THEN x := x+1 END;
  Op2 = PRE y=0 THEN y := x+y+1 END;
  Op3 = PRE y=2 & z < 1 THEN w := 1 || z:= z + 1 END;
  Ind = PRE z=0 THEN z:= z+1 END;
  S = PRE w=0 THEN skip END
END
