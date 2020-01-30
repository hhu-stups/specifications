MACHINE GraphIso
/* A machine where we use ProB to check if two graphs are isomorphic */
/* Translation of a TLA model; for convenience the TLA model was for a graph
   where every node has exactly one successor */
/* Note: number of permutations: 9! = 362,880 */
 /* ProB 1.3.2: Takes 0.06 seconds with ProB to detect first isomorphism; about 0.1 seconds to find all 8 isomorphisms */
/* ProB 1.3.3: 0.01 seconds for first */
DEFINITIONS Nodes == 1..n; 
  SET_PREF_MAX_INITIALISATIONS == 10
CONSTANTS n, graph1, graph2, p
PROPERTIES
 n=9 &
 graph1: Nodes <-> Nodes &
 graph2: Nodes <-> Nodes &
 
  /*      /\ g1 = [[i\in 1..n|->i] EXCEPT ![1]=3,![2]=3,![3]=6,![4]=6,![5]=6,![8]=9,![9]=8] */
  graph1 = {1|->3,2|->3, 3|->6,4|->6,5|->6, 8|->9,9|->8,  6|->6, 7|->7}       
        &
 /*       /\ g2 = [[i\in 1..n|->i] EXCEPT ![2]=5,![3]=5,![4]=5,![6]=4,![7]=4,![1]=9,![9]=1] */
  graph2 = {2|->5,3|->5,4|->5, 6|->4,7|->4, 1|->9,9|->1,  5 |-> 5, 8|->8}
        &
 /* 
         /\ p' \in [1..n -> 1..n]
         /\ \A i \in 1..n : (\E j \in 1..n : p'[j]=i)
         /\ \A i \in 1..n : (p'[g1[i]] = g2[p'[i]]) */
  p: 1..n >->> 1..n &
  !i.(i:1..n => p(graph1(i)) = graph2(p(i)))
OPERATIONS
  r <-- Perm(i) = PRE i:Nodes THEN r:=p(i) END
END