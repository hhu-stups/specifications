MACHINE PartialFunCheck
VARIABLES f
INVARIANT
 f:INTEGER +-> INTEGER
INITIALISATION f:={}
OPERATIONS
  SetFPower(x) = PRE x:1..5 THEN f := %y.(y:1..10**x|y+1) END;
  SetF1(x) = PRE x:1..3 THEN f := %y.(y:1..x|y+1) END;
  c <-- FCard = BEGIN c:= card(f) END;
  CheckPF = PRE f: INTEGER +-> INTEGER THEN skip END /* 500 ms after SetFPower(5) ; 270 ms with new is_avl_partial_function check */
END

