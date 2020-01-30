MACHINE GraphMining_RunningExample_Unsat
/* an unsat version: see that setup_ordered_list_skeleton symmetry breaking works
   also with constraint card(ChosenVertices) > 4 */
SETS
  Labels = {a,b,c,d};
  Vertices = {v1,v2,v3,v4,v5,v6,v7,v8,v9,v10}
CONSTANTS
  Label,
  Template, TU,
  Positive, PU,
  Negative, NU,

  ChosenVertices,
  isop /* isomorphism between Positive and Result */
DEFINITIONS
  homomorph_with(iso,ToGraph) == (
    iso : ChosenVertices >-> dom(ToGraph) &
    !x.(x:ChosenVertices => Label(x) = Label(iso(x))) &
    !(x,y).( x|->y : TU => (x:ChosenVertices & y:ChosenVertices => iso(x)|->iso(y) : ToGraph))
  );
 CUSTOM_GRAPH_NODES == { node,col | node : Vertices & col = Label(node)};
 CUSTOM_GRAPH_EDGES == { n1,n2 | n1|->n2:TU & n1:ChosenVertices & n2:ChosenVertices}
PROPERTIES
   /* for simplicity we assume a global labeling function */
  Label : Vertices --> Labels &
  Label = {v1|->a,v2|->b, v3|->c, v4|->d, v5|->b, v6|->c, v7|->b, v8|-> a, v9|->c, v10|->b}
  &
  Template = {v1|->v2, v1|->v6, v1|-> v10, 
              v2|->v3, v6|->v7, v7|->v8, 
              v8|->v9, v9|->v10}
  &
  Positive = {v1|->v2, v1|->v5, v2|->v3, v3|->v4}
  &
  Negative = {v1|->v2, v1|->v3, v2|->v3}
  &
  /* generate undirected versions */
  TU = Template \/ Template~ &
  PU = Positive \/ Positive~ &
  NU = Negative \/ Negative~
  &
  ChosenVertices <: dom(TU)
  &
  
  homomorph_with(isop,PU)
  
  & not( #(ison).(homomorph_with(ison,NU) ) )
  &
  
  
  card(ChosenVertices) > 4 & /* impose that we want non-trivial solutions; with 5 we get inconsistency */
  /* additionally request that we have some connectivity of the selected subgraph */
  !v.(v:ChosenVertices => #w.(w:ChosenVertices & v|->w : TU))
OPERATIONS
  Pattern(v,lv,w,lw) = SELECT v:ChosenVertices & w:ChosenVertices & v|->w:Template &
                              lv=Label(v) & lw=Label(w) THEN
    skip
  END
END