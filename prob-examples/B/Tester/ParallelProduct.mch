MACHINE ParallelProduct
DEFINITIONS
  SET_PREF_MAX_OPERATIONS == 20;
  SET_PREF_MAXINT == 6
VARIABLES r1,r2,pp
INVARIANT
  r1: NATURAL <-> NATURAL & r2:NATURAL<->NATURAL & pp:NATURAL*NATURAL<->NATURAL*NATURAL
INITIALISATION r1 := {0|->7, 1|->6} || r2 := {10|->11, 12|->12} || pp := {}
OPERATIONS
  ComputePP = BEGIN pp := (r1 || r2) END;
  AddXY(x,y) = PRE x|->y /: r1 & x:NAT & y:NAT THEN r1:= r1 \/ {x|->y} END;
  Reset1 = BEGIN r1 := {} END;
  GetPP(x,y) = PRE x|->y : pp THEN skip END;
  r <-- CardPP = BEGIN r:= card(pp) END
END

