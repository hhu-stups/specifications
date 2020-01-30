MACHINE IterateTest
SETS
 ID={aa,bb,cc,dd,ee}
CONSTANTS r
PROPERTIES
 r:ID <-> ID & r = {aa |-> bb, bb |-> cc, dd |->bb, dd |-> dd, cc|->ee}
VARIABLES ir
INVARIANT
 ir:ID <-> ID & ir<:closure1(r) \/ id(ID)
INITIALISATION ir:=r
OPERATIONS
  RelComp1 = BEGIN ir := (r ; ir) END;
  /* Iterate0 = BEGIN ir := iterate(ir,0) END; not supported */
  Iterate1 = BEGIN ir := iterate(ir,1) END;
  Iterate2 = BEGIN ir := iterate(ir,2) END;
  Iterate3 = BEGIN ir := iterate(ir,3) END;
  ElOf(x,y) = PRE x:ID & y:ID & x|->y : ir THEN skip END
END

