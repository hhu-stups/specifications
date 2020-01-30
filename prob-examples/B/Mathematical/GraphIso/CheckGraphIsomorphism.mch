MACHINE CheckGraphIsomorphism
/* A machine where we use ProB to check if two graphs are isomorphic */
/* Note: number of permutations: 10! = 3,628,800 */
SETS
  Nodes = {n1,n2,n3,n4,n5,n6,n7,n8,n9,n10}
VARIABLES graph1, graph2
INVARIANT
 graph1: Nodes <-> Nodes &
 graph2: Nodes <-> Nodes
INITIALISATION
 graph1 := {} || graph2 := {}
OPERATIONS
 IsIsomorphic(p) = PRE p: Nodes >->> Nodes &
    !(x,y).(x:Nodes & y:Nodes => (x|->y:graph1 <=> p(x)|->p(y) : graph2)) THEN
   skip
 END;
 r <-- CheckIsIsomorphic = IF  #p.(p: Nodes >->>Nodes &
    !(x,y).(x:Nodes & y:Nodes => (x|->y:graph1 <=> p(x)|->p(y) : graph2))) THEN
   r := TRUE ELSE r:= FALSE
 END;
 SetG1_1 = BEGIN graph1 := {n1 |-> n2, n2|-> n3, n3 |->n4, n3|->n5, n3|->n6, n6|->n7, n8|->n8, n10 |->n1} END;
 SetG2_1 = BEGIN graph2 := {n1 |-> n2, n2|-> n3, n3 |->n4, n3|->n5, n3|->n6, n6|->n7, n8|->n8, n10 |->n1} END;
 SetG2_2 = BEGIN graph2 := {n6 |-> n4, n4|-> n3, n3 |->n2, n3|->n5, n3|->n1, n1|->n8, n9|->n9, n10 |->n6} END;
 SetG2_3 = BEGIN graph2 := {n6 |-> n4, n4|-> n3, n3 |->n2, n3|->n5, n3|->n1, n6|->n6, n1|->n8, n10 |->n6, n7|->n7} END;
 SetG2_4 = BEGIN graph2 := {n6 |-> n4, n4|-> n3, n3 |->n2, n3|->n5, n3|->n1, n7|->n7, n10 |->n6} END;
 SetG2_5 = BEGIN graph2 := {n6 |-> n4, n4|-> n3, n3 |->n2, n3|->n5, n3|->n1, n1|->n8, n7|->n8, n10 |->n6} END
END