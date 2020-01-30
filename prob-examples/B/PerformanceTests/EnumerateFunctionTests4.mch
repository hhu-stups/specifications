MACHINE EnumerateFunctionTests4
/* Check whether we can deal with sets of functions, total functions, ... etc */
DEFINITIONS
 ID == 1..4;
 aa == 1; bb==2; cc==3; dd==4;
 aaa == rec(f1:aa,f2:aa); bbb == rec(f1:bb,f2:bb); ccc == rec(f1:cc,f2:cc); ddd == rec(f1:dd,f2:dd);
 IDR == {aaa,bbb,ccc,ddd}
VARIABLES funs
INVARIANT
 funs <: INTEGER <-> struct(f1:ID,f2:ID)
INITIALISATION funs := {}
OPERATIONS
  c <-- CardFuns = BEGIN c := card(funs) END;
  m <-- IsInFuns1 = IF {aa|->aaa} : funs THEN m:=TRUE ELSE m:=FALSE END;
  m <-- IDIsInFuns = IF %x.(x:ID|rec(f1:x,f2:x)) : funs THEN m:=TRUE ELSE m:=FALSE END;
  TF1 = BEGIN funs := ID --> {aaa} END;
  TF2 = BEGIN funs := ID --> {aaa,ddd} END;
  PF1 = BEGIN funs := ID +-> {aaa} END;
  PFALL = BEGIN funs := ID +-> IDR END; /* this is a bit slower with records */
  BIJ = BEGIN funs := ID >->> IDR END;
  REL1 = BEGIN funs := {aa} <-> {aaa,bbb} END;
  REL32 = BEGIN funs := {aa,bb,cc} <-> {aaa,bbb} END;
  REL42 = BEGIN funs := ID <-> {aaa,bbb} END; /* took too long; now we avoid repeated solutions */
  REL43 = BEGIN funs := ID <-> {aaa,bbb,ddd} END; /* 4096 elements; takes quite a long time ! */
  RELALL = BEGIN funs := ID <-> IDR END; /* takes too long; avoid repeated solutions */
  Add1 = BEGIN funs := funs \/ {{aa|->aaa}} END
END

