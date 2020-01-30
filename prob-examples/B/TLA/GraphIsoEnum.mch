MACHINE GraphIsoEnum
/* A machine where we use ProB to check if two graphs are isomorphic */
/* Translation of a TLA model; for convenience the TLA model was for a graph
   where every node has exactly one successor */
/* Note: number of permutations: 9! = 362,880 */
 /* ProB 1.3.2: Takes 0.06 seconds with ProB to detect first isomorphism; about 0.1 seconds to find all 8 isomorphisms */
 /* ProB 1.3.3: <0.01 seconds for first solution, <0.05 for all 8 */
/* A version of GraphIso using enumerated set rather than integers; no performance difference */
DEFINITIONS SET_PREF_MAX_INITIALISATIONS == 10
SETS Nodes = {N1,N2,N3,N4,N5,N6,N7,N8,N9}
CONSTANTS graph1, graph2, p
PROPERTIES
 graph1: Nodes <-> Nodes &
 graph2: Nodes <-> Nodes &

  /*      /\ g1 = [[i\in 1..n|->i] EXCEPT ![1]=3,![2]=3,![3]=6,![4]=6,![5]=6,![8]=9,![9]=8] */
  graph1 = {N1|->N3,N2|->N3, N3|->N6,N4|->N6,N5|->N6, N8|->N9,N9|->N8,  N6|->N6, N7|->N7}
        &
 /*       /\ g2 = [[i\in 1..n|->i] EXCEPT ![2]=5,![3]=5,![4]=5,![6]=4,![7]=4,![1]=9,![9]=1] */
  graph2 = {N2|->N5,N3|->N5,N4|->N5, N6|->N4,N7|->N4, N1|->N9,N9|->N1,  N5 |->N5, N8|->N8}
        &
 /*
         /\ p' \in [1..n -> 1..n]
         /\ \A i \in 1..n : (\E j \in 1..n : p'[j]=i)
         /\ \A i \in 1..n : (p'[g1[i]] = g2[p'[i]]) */
  p: Nodes >->> Nodes &
  !i.(i:Nodes => p(graph1(i)) = graph2(p(i)))
OPERATIONS
  r <-- Perm(i) = PRE i:Nodes THEN r:=p(i) END
END
