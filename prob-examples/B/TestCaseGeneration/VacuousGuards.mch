MACHINE VacuousGuards
VARIABLES x,y,z
INVARIANT
 x:INTEGER & y:INTEGER & z:NATURAL
INITIALISATION x,y,z := 0,0,10
OPERATIONS
  Inc = PRE x<10 & y<10 /* vacuous guard */
       THEN x,y := x+1,y+1 END;
  Dec = PRE z>0 THEN x:= x-1 || y := y-2 || z:=z-1 END
END

