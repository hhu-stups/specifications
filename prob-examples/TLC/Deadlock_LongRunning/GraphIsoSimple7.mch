MACHINE GraphIso
/* A machine where we use ProB to check if two graphs are isomorphic */
/* ProB finds the only isomorphism directly (10 ms); TLC is quite slow here (not finished after +/- 2 hours) */
DEFINITIONS Nodes == 1..n
CONSTANTS n, graph1, graph2, p
PROPERTIES
 n=7 &
 graph1: Nodes <-> Nodes &
 graph2: Nodes <-> Nodes &

  graph1 = {1|->2, 2|->3, 3|->4, 4|->5, 5|->5, 5|->6, 6|->7, 7|->7}       
        &
  graph2 = {2|->4, 4|->1, 1|->3, 3|->5, 5|->5, 5|->7, 7|->6, 6|->6}
        &
  p: 1..n >->> 1..n &
  !i.(i:1..n => p[graph1[{i}]] = graph2[p[{i}]])
VARIABLES idx INVARIANT idx <: 1..n
INITIALISATION idx := 1..n
OPERATIONS
  r <-- Perm(i) = PRE i:Nodes & i: idx THEN r:=p(i) || idx := idx -{i} END
END