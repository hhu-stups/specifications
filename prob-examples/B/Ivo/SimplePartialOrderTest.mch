MACHINE SimplePartialOrderTest
SETS
 ID={aa,bb,none}
VARIABLES p1, p2
INVARIANT
  p1:ID & p2:ID
//  & (p1 = p2 => p1=none) // false
INITIALISATION p1,p2 := none,none
OPERATIONS
  SetP1(yy) = PRE yy:ID\{none} & p1 = none THEN p1:= yy END;
  SetP2(yy) = PRE yy:ID\{none} & p2 = none THEN p2:= yy END
END

