MACHINE CheckLargeGraphIsomorphismAsConstants_v2
/* A machine where we use ProB to check if two graphs are isomorphic */
/* There is exactly one permutation: mapping node 1 to node 5 */
/* This uses an alternate encoding compared to CheckLargeGraphIsomorphismAsConstants*/
/* For 
  Mx  ProB   Kodkod  (seconds)
  40  0.050  2.470
  60  0.100
  80  0.160
 100  0.240  22.34   (Alloy on graphiso_v2_100.als : about 6 seconds; ProB 0.35 sec walltime)
 200  0.840

*/
DEFINITIONS Mx==100; Nodes == 0..(Mx-1);
 RelevantNodes == (dom(graph1)\/dom(graph2)\/ran(graph1)\/ran(graph2))
CONSTANTS graph1, graph2,p
PROPERTIES
 graph1: Nodes <-> Nodes &
 graph2: Nodes <-> Nodes &
 graph1 = %x.(x:Nodes|(x+1)mod Mx) \/ {1|->1} &
 graph2 = %x.(x:Nodes|(x+1)mod Mx) \/ {5|->5} &
 p: RelevantNodes >->>RelevantNodes & /*
 !(x,y).(x:RelevantNodes & y:RelevantNodes => (x|->y:graph1 <=> p(x)|->p(y) : graph2)) (encoding in CheckLargeGraphIsomorphismAsConstants) */
 !(x).(x:RelevantNodes => p[graph1[{x}]] = graph2[{p(x)}] ) /* this is faster ! 50 ms rather than 500 ms for Mx = 40 (and 2470 ms for Kodkod) */
ASSERTIONS
 p(1)=5
OPERATIONS
 r <-- GetPerm(x) = PRE x:RelevantNodes THEN r:=p(x) END
END