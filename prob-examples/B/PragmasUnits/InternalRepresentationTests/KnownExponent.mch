MACHINE KnownExponent
VARIABLES
  /*@ unit "m" */ x,
  /*@ unit "10**2 * m**2" */ x2,
  y, y2
INVARIANT
  x:NATURAL & y:NATURAL & x2:NATURAL & y2:NATURAL
INITIALISATION x,x2,y,y2:=1,1,1,1
OPERATIONS
  n <-- exponent = BEGIN n,y := x**2, x**2 END;
  n <-- exponent2 = BEGIN n,y2 := x2**2, x2**2 END
END
