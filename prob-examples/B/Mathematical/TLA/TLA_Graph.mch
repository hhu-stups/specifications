MACHINE TLA_Graph /* Manual Disproving Example */
SETS
 NODES = {a,b,c}
DEFINITIONS
  degree(n) == card(edges[{n}]);
  SET_PREF_TIME_OUT == 6000
CONSTANTS edges
PROPERTIES
 edges: NODES <->NODES
 &
 edges~ = edges &  /* we have an undirected graph */

 dom(edges) = NODES & /* all Nodes must be used */

 /* id(NODES) /\ edges = {} &  */ /* we disallow self-edges */

 /* And now a negation of the property we want to violate */
 !(x,y).(x:NODES & y:NODES & x/=y => degree(x) /= degree(y))
OPERATIONS
  r <-- Degree(n) = PRE n: NODES THEN r := degree(n) END
END

