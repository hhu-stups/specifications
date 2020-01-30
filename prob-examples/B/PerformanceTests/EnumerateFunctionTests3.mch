MACHINE EnumerateFunctionTests3
/* Check whether we can deal with sets of functions, total functions, ... etc */
DEFINITIONS
 ID == 1..4;
 aa == 1; bb==2; cc==3; dd==4;
 aaa == (aa|->aa); bbb == (bb|->bb); ccc == (cc|->cc); ddd == (dd|->dd);
 IDR == {aaa,bbb,ccc,ddd}
VARIABLES funs
INVARIANT
 funs <: INTEGER <-> (INTEGER*INTEGER)
INITIALISATION funs := {}
OPERATIONS
  c <-- CardFuns = BEGIN c := card(funs) END;
  m <-- IsInFuns1 = IF {aa|->aaa} : funs THEN m:=TRUE ELSE m:=FALSE END;
  m <-- IDIsInFuns = IF %x.(x:ID|x|->x) : funs THEN m:=TRUE ELSE m:=FALSE END;
  TF1 = BEGIN funs := ID --> {aaa} END;
  TF2 = BEGIN funs := ID --> {aaa,ddd} END;
  PF1 = BEGIN funs := ID +-> {aaa} END;
  PFALL = BEGIN funs := ID +-> IDR END;
  BIJ = BEGIN funs := ID >->> IDR END;
  REL1 = BEGIN funs := {aa} <-> {aaa,bbb} END;
  REL32 = BEGIN funs := {aa,bb,cc} <-> {aaa,bbb} END;
  REL42 = BEGIN funs := ID <-> {aaa,bbb} END; /* took too long; now we avoid repeated solutions */
  REL43 = BEGIN funs := ID <-> {aaa,bbb,ddd} END; /* 4096 elements */
  RELALL = BEGIN funs := ID <-> IDR END; /* takes too long */
  Add1 = BEGIN funs := funs \/ {{aa|->aaa}} END
END

