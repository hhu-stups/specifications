MACHINE CheckGraphIsomorphism2
/* A machine where we use ProB to check if two graphs are isomorphic */
/* Note: number of permutations: 10! = 3,628,800 */
SETS
  Nodes = {a,b,c,d,e, x,y,z,v,u}
VARIABLES graph1, graph2
INVARIANT
 graph1: Nodes <-> Nodes &
 graph2: Nodes <-> Nodes
DEFINITIONS
 G1 == {a|->b,a|->c,a|->d ,  b|->c, b|->d, c|->e, d|->e};
 G2 == {x|->v, x|->u, x|->z, y|->v, y|->u, z|->v, z|->u};
 RelevantNodes == (dom(graph1)\/dom(graph2)\/ran(graph1)\/ran(graph2))
INITIALISATION
 graph1 := G1\/G1~ || graph2 := G2 \/ G2~
OPERATIONS
 IsIsomorphic(p) = PRE p: RelevantNodes >->>RelevantNodes &
    !(x,y).(x:RelevantNodes & y:RelevantNodes => (x|->y:graph1 <=> p(x)|->p(y) : graph2)) THEN
   skip
 END;
 r <-- CheckIsIsomorphic = IF  #p.(p: RelevantNodes >->>RelevantNodes &
    !(x,y).(x:RelevantNodes & y:RelevantNodes => (x|->y:graph1 <=> p(x)|->p(y) : graph2))) THEN
   r := TRUE ELSE r:= FALSE
 END;
 Set2_G1 = BEGIN graph2 := G1 \/ G1~ END
END