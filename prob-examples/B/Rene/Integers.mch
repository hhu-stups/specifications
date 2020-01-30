MACHINE Integers
VARIABLES x,y,z
INVARIANT
 x:NATURAL & y:NATURAL & z : POW(NAT)
INITIALISATION x,y,z:=0,0,{1,2,3,4} \/ {5,6,7}
OPERATIONS
  n <-- getX = BEGIN n := x END;
  n <-- addX = BEGIN x := x + 1 || n := x + 1 END;
  n <-- addY = BEGIN y := y + 1 || n := y + 1 END;
  n <-- plus  = BEGIN x:= x+y || n := x+y END;
  n <-- minus = BEGIN x:= x-y || n := x-y END;
  n <-- mult  = BEGIN x:= x*y || n := x*y END;
  n <-- div   = BEGIN x:= x/y || n := x/y END;
  n <-- moreZ(a) = PRE a : POW(NAT) THEN z := a || n := a END;
  n <-- addZ(f)  = PRE f : POW(NAT) THEN z := z \/ f || n := card(z) + 1 END;
  n <-- setXcardZ= BEGIN x := card(z) || n := card(z) END
END

