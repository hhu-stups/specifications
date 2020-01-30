MACHINE Bipartite_Graphs
DEFINITIONS SET_PREF_CHR == FALSE; SET_PREF_MAX_INITIALISATIONS == 100
CONSTANTS n, g, a,b
PROPERTIES
 n = 50 &
 g = {x,y|x:1..(n-1) & y=x+1} \/ {n|->1} &
  a \/ b = 1..n & a /\ b = {} &
 !(x,y).(x|->y : g => (x:a <=> y:b)) /* &
 !(x,y).(x|->y : g => (x:b <=> y:a)) does not really help but many redundant solutions generated */
ASSERTIONS 
 n : b or n : a
END

/* for n=100 with {n|->1} Kodkod takes 9.6 secs for first sol, second straight after
 ProB takes 0.370 secs for first sol, but then takes long

for n=10 with {n|->2} Kodkod finds inconsistency straightaway; ProB takes long

TODO: investigate whether with CHR propagation of not-member we obtain better results (similar to BOOL encoding)
*/