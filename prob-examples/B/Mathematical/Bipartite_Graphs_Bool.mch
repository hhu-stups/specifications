MACHINE Bipartite_Graphs_Bool
 /* encoding partition as a colour/bool rather than as two sets; much better for ProB  at the moment (July 19th 2014) */
CONSTANTS n, g, col
PROPERTIES
 n = 100 &
 g = {x,y|x:1..(n-1) & y=x+1} \/ {n|->2} & /* use n|->1 for sat, n|->2 for unsat */
 col : 1..n --> BOOL &
 !(x,y).(x|->y : g => (col(x)=TRUE <=> col(y)=FALSE)) 
END

/* for n=100 with {n|->1} ProB & Kodkod takes 0.02 secs for first sol, 0.00 secs for second one

 with {n->2} Kodkod takes a few secodns (5-10) to detect inconsistency; ProB instantenous
*/