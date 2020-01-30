MACHINE CheckGraphIsomorphism2
/* A machine where we use ProB to check if two graphs are isomorphic */
/* Note: number of permutations: 10! = 3,628,800 */
SETS
  Nodes = {a,b,c,d,e, x,y,z,v,u}
DEFINITIONS
 G1 == {a|->b,a|->c,a|->d ,  b|->c, b|->d, c|->e, d|->e};
 G2 == {x|->v, x|->u, x|->z, y|->v, y|->u, z|->v, z|->u}
CONSTANTS graph1, graph2, relevant
PROPERTIES
 graph1: Nodes <-> Nodes &
 graph2: Nodes <-> Nodes &
 graph1 = G1\/G1~ &
 graph2 = G2 \/ G2~ &
 relevant = (dom(graph1)\/dom(graph2)\/ran(graph1)\/ran(graph2)) & 
 #p.(p: relevant >->>relevant &
    !(x,y).(x:relevant & y:relevant => 
              (x|->y:graph1 <=> p(x)|->p(y) : graph2)))
END