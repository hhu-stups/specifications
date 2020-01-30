MACHINE GraphColouring_K5
/* use ProB to solve graph colouring problem */
SETS
 NODES={n1,n2,n3,n4,n5,n6}
DEFINITIONS
 N5 == {n1,n2,n3,n4,n5};
 EDG == {n,m|n:N5 & m:N5 & n/=m} \/ {n6|->n1};
  SET_PREF_MAX_OPERATIONS == 21;
 CUSTOM_GRAPH_NODES == { node,col | node : NODES & col = colour(node)};
 CUSTOM_GRAPH_EDGES == { nn1,nn2 | nn1|->nn2:EDG} ;
 CUSTOM_GRAPH_EDGESerr == { n1,n2 | n1|->n2:EDG} /* maybe we should generate warning in those cases (n1,n2 used in NODES !); causes performance problems in ProB !! */
CONSTANTS edge, colour, maxncol
PROPERTIES
 maxncol : 1..5 &
 edge = EDG \/ EDG~ &
 colour: NODES --> 1..maxncol &
 !(x,y).(x|->y : EDG => colour(x) /= colour(y)) &
 colour(n1) = 1 
OPERATIONS
  c <-- Get(yy) = PRE yy:NODES THEN c:= colour(yy) END
END

