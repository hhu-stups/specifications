MACHINE MinimalDFA
SETS
   Z = {z0,z1,z2,z3,z4}
ABSTRACT_CONSTANTS δs
CONSTANTS Σ, F, δ
PROPERTIES
 F ⊆ Z ∧ δ ∈ (Z×Σ) → Z ∧

 /* Definition der erweiterten Überführungsfunktion */
 δs ∈ (Z×seq(Σ)) → Z ∧
 δs = λ(z,s).(z∈Z ∧ s∈seq(Σ) |
           IF s=[] THEN z
           ELSE         δs(δ(z,first(s)),tail(s)) END)
 ∧
 /* Der Automat von Folie 10: */
 Σ = {0,1} ∧
 F = {z2} ∧
 δ = {     (z0,0)↦z1, (z0,1)↦z2,
           (z1,0)↦z3, (z1,1)↦z3,
           (z2,0)↦z4, (z2,1)↦z4,
           (z3,0)↦z3, (z3,1)↦z3,
           (z4,0)↦z4, (z4,1)↦z4 }
VARIABLES
  markiert, fusioniert
INVARIANT markiert : Z <-> Z &
          fusioniert : Z <-> Z
INITIALISATION markiert := {za,zb| za∈F ⇔ zb∉F} || fusioniert := {}
OPERATIONS
  Markiere(za,zb,a) = SELECT (za,zb) ∉ markiert ∧
                            a∈Σ ∧
                           (δ(za,a),δ(zb,a)) ∈ markiert THEN
        markiert := markiert \/ {(za,zb),(zb,za)}
    END;
  Fertig = SELECT fusioniert={} ∧
                  !(za,zb,a).((za,zb) ∉ markiert ∧  a∈Σ
                             =>
                           (δ(za,a),δ(zb,a)) ∉ markiert) THEN
            fusioniert := {za,zb|(za,zb) ∉ markiert ∧ za ≠ zb} ||
            markiert := {}
          END
DEFINITIONS
  SET_PREF_DOT_HORIZONTAL_LAYOUT==TRUE;
  SET_PREF_DOT_LIMIT_PAGE_SIZE==FALSE;
  CUSTOM_GRAPH_NODES1 == rec(shape:"doublecircle",nodes:F);
  CUSTOM_GRAPH_NODES2 == rec(shape:"circle",nodes:Z\F);
  CUSTOM_GRAPH_NODES3 == rec(shape:"none",color:"white",style:"none",nodes:{""});
  CUSTOM_GRAPH_EDGES1 == rec(color:"red",label:"0",edges:{a,b|(a,0)|->b∈δ});
  CUSTOM_GRAPH_EDGES2 == rec(color:"green",label:"1",edges:{a,b|(a,1)|->b∈δ});
  CUSTOM_GRAPH_EDGES3 == rec(color:"black",label:"",edges:{"" |-> z0});
  CUSTOM_GRAPH_EDGES4 == rec(color:"gray",label:"×",style:"dotted",edges:markiert);
  CUSTOM_GRAPH_EDGES5 == rec(color:"purple",label:"↔",style:"bold",edges:fusioniert)
END
