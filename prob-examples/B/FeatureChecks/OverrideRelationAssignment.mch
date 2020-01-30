MACHINE OverrideRelationAssignment
VARIABLES r
INVARIANT
 r : NATURAL <-> NATURAL
INITIALISATION r:=(1..10)*(1..10)
OPERATIONS
  Set(d) = PRE d:dom(r) & card(r[{d}])>1 THEN
    r(d) := d+1
  END;
  res <-- ApplyFun(d) = PRE d:dom(r) & card(r[{d}])=1 THEN
    res := r(d)
  END
END

