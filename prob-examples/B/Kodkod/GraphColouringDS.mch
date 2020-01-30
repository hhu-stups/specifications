MACHINE GraphColouringDS
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
 "Graph_small_40_200_0_ds.def";
 /* "Graph_small_60_400_9_ds.def"; */
 CUSTOM_GRAPH_NODES == { node,col | node : Vtx & col = colour(node)};
 CUSTOM_GRAPH_EDGES == { n1,n2 | n1|->n2:Edge}
SETS
 Vertexes = {e1,e2,e3,e4,e5,e6,e7,e8,e9,e10,e11,e12,e13,e14,e15,e16,e17,e18,e19,
        e20,e21,e22,e23,e24,e25,e26,e27,e28,e29,e30,e31,e32,e33,e34,e35,e36,
        e37,e38,e39,e40}
CONSTANTS Edges, maxnocol, colour
PROPERTIES
 Edges = {e13|->e3, e26|->e14, e19|->e24, e2|->e13, e1|->e18, e10|->e20, e15|->e8, e9|->e8, e4|->e19, e7|->e3, e23|->e27, e9|->e7, e23|->e2, e29|->e17, e35|->e14, e8|->e1, e27|->e2, e9|->e36, e34|->e26, e7|->e26, e34|->e23, e14|->e20, e39|->e3, e7|->e31, e5|->e21, e23|->e11, e35|->e30, e6|->e11, e9|->e28, e18|->e30, e19|->e33, e25|->e28, e39|->e4, e2|->e19, e9|->e24, e8|->e26, e10|->e6, e22|->e25, e32|->e25, e23|->e40, e30|->e17, e2|->e4, e5|->e24, e27|->e36, e20|->e38, e31|->e38, e35|->e9, e19|->e5, e8|->e16, e18|->e15, e35|->e4, e19|->e21, e15|->e37, e34|->e24, e6|->e8, e8|->e36, e2|->e1, e23|->e13, e13|->e35, e36|->e25, e26|->e20, e32|->e36, e24|->e2, e9|->e17, e38|->e27, e18|->e38, e36|->e20, e34|->e32, e8|->e5, e5|->e1, e28|->e7, e33|->e8, e5|->e22, e31|->e9, e30|->e40, e26|->e33, e32|->e1, e6|->e19, e14|->e5, e8|->e18, e40|->e22, e4|->e5, e5|->e13, e34|->e40, e12|->e15, e25|->e14, e3|->e35, e10|->e23, e18|->e26, e31|->e15, e13|->e38, e13|->e18, e20|->e22, e18|->e9, e11|->e13, e40|->e25, e40|->e5, e28|->e20, e37|->e28, e3|->e26, e38|->e4, e3|->e12, e5|->e6, e30|->e26, e32|->e26, e7|->e17, e31|->e32, e22|->e37, e38|->e26, e3|->e23, e34|->e3, e6|->e35, e34|->e30, e23|->e4, e23|->e15, e10|->e17, e12|->e37, e40|->e37, e28|->e34, e38|->e5, e16|->e29, e5|->e25, e21|->e30, e37|->e39, e32|->e7, e7|->e13, e15|->e20, e39|->e13, e26|->e36, e18|->e12, e4|->e6, e21|->e39, e21|->e7, e29|->e36, e11|->e21, e20|->e11, e22|->e36, e24|->e23, e38|->e24, e4|->e10, e20|->e23, e38|->e36, e16|->e23, e12|->e30, e17|->e6, e29|->e10, e10|->e31, e7|->e37, e40|->e19, e27|->e18, e12|->e16, e6|->e7, e8|->e30, e25|->e27, e38|->e21, e27|->e31, e4|->e31, e5|->e9, e23|->e29, e35|->e8, e11|->e27, e17|->e21, e26|->e37, e3|->e6, e5|->e27, e9|->e6, e26|->e27, e5|->e12, e14|->e30, e35|->e29, e10|->e11, e38|->e8, e36|->e28, e1|->e14, e31|->e37, e13|->e34, e26|->e2, e12|->e7, e34|->e5, e3|->e19, e15|->e16, e20|->e39, e19|->e10, e12|->e23, e6|->e30, e11|->e2, e25|->e34, e24|->e10, e40|->e38, e24|->e13, e35|->e37, e37|->e2, e33|->e2, e31|->e22, e15|->e11, e22|->e29, e9|->e34, e34|->e8, e17|->e12, e1|->e29} & 
 Edges: Vertexes <-> Vertexes &
 maxnocol : 1..6 &  /* Note: in contrast to the IPD example we vary the number of 
   colours allowed; we thus find a solution with 5 colours first */
 colour: Vertexes --> 1..maxnocol &
 !(x,y).(x|->y : Edges => colour(x) /= colour(y)) &
 colour(e1) = 1
OPERATIONS /* just to get the colour of the nodes; not really necessary */
  c <-- Get(yy) = PRE yy:Vertexes THEN c:= colour(yy) END
END

