MACHINE LeaderElectionRing
CONSTANTS n, N
PROPERTIES
 N <: NATURAL & N={1,2,3,4} &
 n : N >->> N &
 ! S.(S<:N & n[S] <: S & S/={} => N <: S)
DEFINITIONS
  SET_PREF_MAXINT == 11;
  CUSTOM_GRAPH_NODES == { node,col | node : N & col = node};
  CUSTOM_GRAPH_EDGES == { n1,n2 | n1:dom(b) & n1|->n2:b}
VARIABLES b
INVARIANT b: N +-> N
INITIALISATION b:=n
OPERATIONS
  Accept(x) = PRE x:dom(b)  & b(x) < x THEN
   b(x) := n(b(x))
  END;
  Reject(x) = PRE x:dom(b) & b(x)>x THEN
   b := {x} <<| b
  END;
  w <-- Elect = ANY x WHERE x:dom(b) & b(x)=x THEN
   ASSERT x=max(N) THEN w := x END
  END
END

