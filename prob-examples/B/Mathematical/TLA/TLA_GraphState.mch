MACHINE TLA_GraphState
/* A Version of TLA_Graph which uses operations to construct the graph;
   The advantage: symmetry can be used.
   With Symmetry Markers counter examples can be found for scope 6 (much faster than
    without symmetry !?) and
     (approximate) correctness proven (when commenting in ** x/=y in AddEdge).
   With Permutation Flooding correctness for scope 6; counter example takes longer */
SETS
 NODES
DEFINITIONS
  degree(n) == card(edges[{n}]);
  scope_NODES == 1..5
VARIABLES edges
INVARIANT
 edges: NODES <->NODES
 &

 #(x,y).(x:NODES & y:NODES & x/=y & degree(x) = degree(y))
 
ASSERTIONS
 edges~ = edges /* we have an undirected graph */
 
 /*  id(NODES) /\ edges = {} &  */ /* we disallow self-edges */
INITIALISATION
  edges := {}
OPERATIONS
  AddEdge(x,y) = PRE x:NODES & y:NODES & x|->y /: edges  
    /*  & x/=y */  /* ** if we comment this out: we find a counter example */
   THEN
    edges := edges \/ {x|->y, y|->x}
  END
END

