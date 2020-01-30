MACHINE IntegerOperations
VARIABLES
  /*@ unit "10 * m" */ x,
  /*@ unit "10 * m" */ y,
  z1,
  z2
INVARIANT
  x:NATURAL & y:NATURAL & z1:NATURAL & z2:NATURAL
INITIALISATION x,y,z1,z2:=0,0,3,3
OPERATIONS
  n <-- getX      = BEGIN n := x END;
  n <-- addX      = BEGIN x := x + 1 || n := x + 1 END;
  n <-- addY      = BEGIN y := y + 1 || n := y + 1 END;
  n <-- plus      = BEGIN x:= x+y || n := x+y END;
  n <-- minus     = BEGIN x:= x-y || n := x-y END;
  n <-- uminus    = BEGIN x:= -x  || n := -x END;
  n <-- mult      = BEGIN x:= x*y || n := x*y END;
  n <-- div       = BEGIN x:= x/y || n := x/y END;
  n <-- modulo    = BEGIN x:= x mod y || n:=x mod y END;
  n <-- pow(a)    = BEGIN n:=x**a END;
  n <-- typeByUse1= BEGIN n:= z1+x END;
  n <-- typeByUse2= BEGIN n:= z2+y END
END
