MODEL
   OneArcLabelGraph
SETS
  N /* Nodes of the graph */
    = {nd1,nd2,nd3} 
   ;
  C  /* possible arc colours */
    = {co1,co2} 
DEFINITIONS
  GRAPH == (C --> (N<->N));
  INIT == (g(co1) = {nd1 |->nd2} & g(co2) = {nd2|-> nd3, nd3|->nd1})
CONSTANTS g
PROPERTIES
  g:GRAPH & INIT
VARIABLES vg
INVARIANT vg:GRAPH
INITIALISATION vg := g
OPERATIONS
  r <-- edge(n1,n2,c) = PRE n1:N & n2:N & c:C THEN
    IF n1 |-> n2 : vg(c) THEN
      r := TRUE
    ELSE
      r := FALSE
    END
  END;
 permute(p) = PRE p:N>->>N THEN
     ANY nvg WHERE
         nvg:GRAPH & !c.(c:C => nvg(c) = (p;vg(c);p~))
     THEN
         vg := nvg
     END
  END
END