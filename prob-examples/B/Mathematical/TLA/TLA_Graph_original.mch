MACHINE TLA_Graph_original
SETS
 NODES = {a,b,c}
DEFINITIONS
  degree(n) == card(edges[{n}])
CONSTANTS edges
PROPERTIES
 edges: NODES <->NODES
 &
 edges~ = edges &  /* we have an undirected graph */

 dom(edges) = NODES /* all Nodes must be used */
& id(NODES) /\ edges = {} 
 & not(#(x,y).(x:NODES & y:NODES & x/=y & degree(x) = degree(y)))

ASSERTIONS
 #(x,y).(x:NODES & y:NODES & x/=y & degree(x) = degree(y))
OPERATIONS
  r <-- Degree(n) = PRE n: NODES THEN r := degree(n) END
END





/* 
& not(
 #(x,y).(x:NODES & y:NODES & x/=y & degree(x) = degree(y))
 ) */



 /* id(NODES) /\ edges = {} &  */ /* we disallow self-edges */