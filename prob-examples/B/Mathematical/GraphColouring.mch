MACHINE GraphColouring
/* use ProB to solve graph colouring problem */
/* Note: 3^20 = 3,486,784,401 */
/* Solution found by ProB in 0.02 seconds */
SETS
 NODES={n1,n2,n3,n4,n5,n6,n7,n8,n9,n10,n11,n12,n13,n14,n15,n16,n17,n18,n19,n20}
DEFINITIONS
 EDG == {n1 |-> n2, n1 |-> n4, n1 |-> n7, n1 |-> n9, n1 |-> n10, n1 |-> n11, n1 |-> n12,
         n2 |-> n3, n2 |-> n5, n2 |-> n7, 
         n3 |-> n4, n3 |-> n15, n3 |-> n18,
         n4 |-> n5, n4 |-> n6, n4 |-> n18,
         n6 |-> n7, n6 |-> n8, n6 |-> n19,
         n7 |-> n14, n7 |-> n15,
         n8 |-> n9, n8 |-> n10, n8 |-> n13, n8 |-> n18, n3 |-> n19,
         n9 |-> n10, n9 |-> n11,
         n11 |-> n12, n11 |-> n13, n11 |-> n14,
         n13 |-> n15, n13 |-> n16, n14 |-> n17,
         n15 |-> n16, n15 |-> n17, n15 |-> n20,
         n19 |-> n20 };
  SET_PREF_MAX_OPERATIONS == 21;
 CUSTOM_GRAPH_NODES == { node,col | node : NODES & col = colour(node)};
 CUSTOM_GRAPH_EDGES == { nn1,nn2 | nn1|->nn2:EDG} ;
 CUSTOM_GRAPH_EDGESerr == { n1,n2 | n1|->n2:EDG} /* maybe we should generate warning in those cases (n1,n2 used in NODES !); causes performance problems in ProB !! */
CONSTANTS edge, colour, maxncol
PROPERTIES
 maxncol : 1..3 &
 edge = EDG \/ EDG~ &
 colour: NODES --> 1..maxncol &
 !(x,y).(x|->y : EDG => colour(x) /= colour(y)) &
 colour(n1) = 1 & colour(n2) = 2
OPERATIONS
  c <-- Get(yy) = PRE yy:NODES THEN c:= colour(yy) END
END

