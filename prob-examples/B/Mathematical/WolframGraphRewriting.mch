MACHINE WolframGraphRewriting
// https://writings.stephenwolfram.com/2020/04/finally-we-may-have-a-path-to-the-fundamental-theory-of-physics-and-its-beautiful/

DEFINITIONS
 NODES == 1..1500;
 SET_PREF_DOT_ENGINE == "sfdp";
 CUSTOM_GRAPH_NODES == ((dom(g)/\ran(g))*{"green"}) \/
                       ((ran(g)\dom(g))*{"blue"})   \/
                       ((dom(g)\ran(g))*{"gray"});
 CUSTOM_GRAPH_EDGES == g
VARIABLES g
INVARIANT
 g : NODES <-> NODES
INITIALISATION
  g := {(1 |-> 2), (2 |-> 3), (3 |-> 4), (2 |-> 4)}
OPERATIONS
  Rewrite(x,y,z,w) = PRE  x|->y : g & x|->z : g & y/=z &
                          w = min(NODES\(dom(g)\/ran(g))) THEN
     g :=  (g \ {x|->y}) \/ {x|->w, z|->w, y|->w}
  END
END

