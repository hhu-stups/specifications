MODEL
   ArcLabelGraph
SETS
  N; /* Nodes of the graph */
  C  /* possible arc colours */
DEFINITIONS
  GRAPH == (C --> (N<->N))
VARIABLES g1,g2
INVARIANT
  g1:GRAPH &
  g2:GRAPH
INITIALISATION
  g1 := %c1.(c1:C|{}) ||
  g2 := %c2.(c2:C|{})
OPERATIONS
  add_edge1(n1,n2,c) = PRE n1:N & n2:N & c:C THEN
     g1(c) := g1(c) \/ {n1 |-> n2}
  END;
  add_edge2(n1,n2,c) = PRE n1:N & n2:N & c:C THEN
     g2(c) := g2(c) \/ {n1 |-> n2}
  END;
  res <-- isomorphic = 
   IF #p.(p: N>->>N & !c.(c:C => (p;g1(c);p) = g2(c))) THEN
    res := TRUE
   ELSE
    res := FALSE
   END
END