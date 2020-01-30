MACHINE TransitiveClosureFunction
/* An attempt at defining the transitive closure recursively;
 this version does not work very efficiently yet
*/
SETS
 Nodes={a,b,c,d,e,f,g,h}
DEFINITIONS
 SET_PREF_SYMBOLIC == TRUE
ABSTRACT_CONSTANTS trclos
CONSTANTS graph
PROPERTIES
 graph = {a|->b, b|->c, b |-> d, d|-> b, f|->g, g|->f} &
 
 /* recursive definition of transitive & reflexive closure */
 trclos = %(i,x).(i=0 & x:Nodes|{x}) \/
          %(i,x).(i>0 & x:Nodes| graph[trclos(i-1,x)])

ASSERTIONS
  trclos(0,e) = {e};
  trclos(1,e) = {};
  trclos(1,a) = {b};
  trclos(2,a) = {c,d};
  !i.(i:1..10 => trclos(i,a) = iterate(graph,i)[{a}])
OPERATIONS
  r <-- InClosure0(n) = PRE n:Nodes THEN r := trclos(0,n) END;
  r <-- InClosure1(n) = PRE n:Nodes THEN r := trclos(1,n) END;
  r <-- InClosure2(n) = PRE n:Nodes THEN r := trclos(2,n) END;
  r <--   InClosure(i,n) = PRE i:3..5 & n:Nodes THEN r := trclos(i,n) END
END

