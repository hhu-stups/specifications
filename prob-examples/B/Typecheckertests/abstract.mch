MACHINE abstract(P,p)
CONSTRAINTS p:NATURAL
VARIABLES x,cnt
INVARIANT x:POW(P) & cnt:NATURAL
INITIALISATION
  x := {} || cnt := 0
OPERATIONS
  add(e) = PRE p>7 & e:P & card(x) < p THEN x := x\/{e} END;
  s <-- getSize = BEGIN s := card(x) END;
  inc = BEGIN cnt := cnt+1 END
END
