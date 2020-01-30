MACHINE DomRanTest
SETS
 ID={aa,bb}
VARIABLES f
INVARIANT
 f:ID +-> ID
INITIALISATION f:={}
OPERATIONS
  SetFcst(x) = PRE x:ID THEN f := %y.(y:ID|x) END;
  SetFx(x,y) = PRE x:ID THEN f(x) := y END;
  r,r2 <-- DOM = BEGIN r:= dom(f) || r2 := ran(f) END
END

