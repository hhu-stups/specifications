MACHINE DFA_Unicode
SETS
   Z = {z0,z1,z2,z3}
ABSTRACT_CONSTANTS δs, L
CONSTANTS Σ, S, F, δ
PROPERTIES
 S ∈ Z ∧ F ⊆ Z ∧ δ ∈ (Z×Σ) → Z ∧

 /* Definition der erweiterten Überführungsfunktion */
 δs ∈ (Z×seq(Σ)) → Z ∧
 δs = λ(z,s).(z∈Z ∧ s∈seq(Σ) |
           IF s=[] THEN z
           ELSE         δs(δ(z,first(s)),tail(s)) END)
 ∧
 /* Die vom Automaten akzeptierte Sprache L */
 L = {ω|ω∈seq(Σ) ∧ δs(S,ω) ∈ F}
 ∧
 /* Der Automat von Folie 10: */
 Σ = {0,1} ∧
 S = z0 ∧ F={z2} ∧
 δ = {     (z0,0)↦z1, (z0,1)↦z3,
           (z1,0)↦z3, (z1,1)↦z2,
           (z2,0)↦z2, (z2,1)↦z2,
           (z3,0)↦z3, (z3,1)↦z3 }
DEFINITIONS
  CUSTOM_GRAPH_NODES1 == rec(shape:"doublecircle",nodes:F);
  CUSTOM_GRAPH_NODES2 == rec(shape:"circle",nodes:Z\F);
  CUSTOM_GRAPH_NODES3 == rec(shape:"none",style:"empty",nodes:{""});
  CUSTOM_GRAPH_EDGES1 == rec(color:"black",label:"0",edges:{a,b|(a,0)|->b:δ});
  CUSTOM_GRAPH_EDGES2 == rec(color:"blue",label:"1",edges:{a,b|(a,1)|->b:δ});
  CUSTOM_GRAPH_EDGES3 == rec(color:"black",label:"",edges:{"" |-> z0})
END
