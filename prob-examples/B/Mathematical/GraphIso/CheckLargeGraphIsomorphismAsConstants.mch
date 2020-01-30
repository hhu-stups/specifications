MACHINE CheckLargeGraphIsomorphismAsConstants
/* A machine where we use ProB to check if two graphs are isomorphic */
/* There is exactly one permutation: mapping node 1 to node 5 */
/* For 
  Mx  ProB   Kodkod  (seconds)
  20  0.140  0.620
  30  0.390  3.520 
  40  0.900 13.010
  50  1.830
  60  3.390

with version 1.6.1-rc (MacBook Air 2.2 GHz i7)
  Mx ProB
  40 0.140      out of memory with defaults, 19 seconds with glucose, 1 solution, symmetry=20
  60 0.510 sec
  70 0.800 sec
*/
DEFINITIONS Mx==40; Nodes == 0..(Mx-1);
 RelevantNodes == (dom(graph1)\/dom(graph2)\/ran(graph1)\/ran(graph2));
CONSTANTS graph1, graph2,p
PROPERTIES
 graph1: Nodes <-> Nodes &
 graph2: Nodes <-> Nodes &
 graph1 = %x.(x:Nodes|(x+1)mod Mx) \/ {1|->1} &
 graph2 = %x.(x:Nodes|(x+1)mod Mx) \/ {5|->5} &
 p: RelevantNodes >->>RelevantNodes &
 !(x,y).(x:RelevantNodes & y:RelevantNodes => (x|->y:graph1 <=> p(x)|->p(y) : graph2))
ASSERTIONS
 p(1)=5
OPERATIONS
 r <-- GetPerm(x) = PRE x:RelevantNodes THEN r:=p(x) END
END