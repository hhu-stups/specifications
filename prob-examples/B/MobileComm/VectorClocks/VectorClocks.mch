MACHINE VectorClocks
DEFINITIONS
   merge(c1,c2) == {p,c| p:PROC & c: (PROC-->NATURAL) &
                        c = max({c1(p),c2(p)}) }
SETS
  PROC

VARIABLES
  clocks, ether
INVARIANT
  clocks: PROC --> (PROC --> NATURAL) &
  ether: PROC <-> (PROC --> NATURAL)
INITIALISATION
  clocks := %p.(p:PROC | %p2.(p2:PROC | 0 )) ||
  ether := {}

OPERATIONS
  work(p) = PRE p:PROC THEN
     clocks(p) := clocks(p) <+ { p |-> clocks(p)(p)+1}
  END;
  
  send(p,q) = PRE p:PROC & q:PROC & p /= q THEN
     ether := ether \/ { q |-> clocks(p) } ||
     clocks(p) := clocks(p) <+ { p |-> clocks(p)(p)+1}
  END;
  
  receive(p,c) = PRE p:PROC & p |-> c : ether & c: PROC-->NATURAL THEN
    ether := ether - { p|-> c} ||
    clocks(p) := {q,m| q:PROC & m:NATURAL &
                        m = max({c(q),clocks(p)(q)}) }
  END
END