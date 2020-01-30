MACHINE EnumerateFunctionTests
/* Check whether we can deal with sets of functions, total functions, ... etc */
SETS
 ID={aa,bb,cc,dd}
VARIABLES funs
INVARIANT
 funs <: ID <-> ID
INITIALISATION funs := {}
OPERATIONS
  c <-- CardFuns = BEGIN c := card(funs) END;
  m <-- IsInFuns1 = IF {aa|->aa} : funs THEN m:=TRUE ELSE m:=FALSE END;
  m <-- IDIsInFuns = IF %x.(x:ID|x) : funs THEN m:=TRUE ELSE m:=FALSE END;
  TF1 = BEGIN funs := ID --> {aa} END;
  TF2 = BEGIN funs := ID --> {aa,dd} END;
  PF1 = BEGIN funs := ID +-> {aa} END;
  PFALL = BEGIN funs := ID +-> ID END;
  BIJ = BEGIN funs := ID >->> ID END;
  REL1 = BEGIN funs := {aa} <-> {aa,bb} END;
  REL32 = BEGIN funs := {aa,bb,cc} <-> {aa,bb} END;
  REL42 = BEGIN funs := ID <-> {aa,bb} END; /* took too long; now we avoid repeated solutions */
  REL43 = BEGIN funs := ID <-> {aa,bb,dd} END; /* 4096 elements */
  RELALL = BEGIN funs := ID <-> ID END; /* takes too long  */
  Add1 = BEGIN funs := funs \/ {{aa|->aa}} END
END

