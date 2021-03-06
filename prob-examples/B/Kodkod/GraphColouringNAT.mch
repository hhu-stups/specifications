MACHINE GraphColouringNAT
/* The graph colouring problem; adapting examples delivered with idp */
/* http://dtai.cs.kuleuven.be/krr/software/ */
/* The idp syntax is :

Given:
type { Colour Vtx }
Edge(Vtx,Vtx)

Find:
Colouring(Vtx) : Colour

Satisfying:
// Neighbours cannot have the same colour.
 ! n1 n2 : Edge(n1,n2) =>  Colouring(n1) ~= Colouring(n2).

Data:
Colour = {1..6 }
*/
DEFINITIONS
 "Graph_small_40_200_0.def";
 /* "Graph_small_60_400_9.def"; */
 CUSTOM_GRAPH_NODES == { node,col | node : Vtx & col = colour(node)};
 CUSTOM_GRAPH_EDGES == { n1,n2 | n1|->n2:Edge}
CONSTANTS Vertexes, Edges, maxnocol, colour
PROPERTIES
 Vertexes = Vtx & /* get data from .def file */
 Edges = Edge &  /* get data from .def file */
 Edges: Vertexes <-> Vertexes &
 maxnocol : 1..6 &  /* Note: in contrast to the IPD example we vary the number of 
   colours allowed; we thus find a solution with 5 colours first */
 colour: Vertexes --> 1..maxnocol &
 !(x,y).(x|->y : Edges => colour(x) /= colour(y)) &
 colour(1) = 1
OPERATIONS /* just to get the colour of the nodes; not really necessary */
  c <-- Get(yy) = PRE yy:Vertexes THEN c:= colour(yy) END
END

