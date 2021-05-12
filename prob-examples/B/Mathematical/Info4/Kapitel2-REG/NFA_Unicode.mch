MACHINE NFA_Unicode
SETS
   Z = {z0,z1,z2,z3}
ABSTRACT_CONSTANTS L, δs
CONSTANTS Σ, S, F, δ
PROPERTIES
 F ⊆ Z ∧ S ⊆ Z ∧
 δ ∈ (Z×Σ) → ℙ(Z) ∧

 /* Definition der erweiterten Überführungsfunktion */
 δs ∈ (ℙ(Z)×seq(Σ)) → ℙ(Z) ∧
 δs = λ(Z′,s).(Z′⊆Z ∧ s∈seq(Σ) |
           IF s=[] THEN Z′
           ELSE         ⋃(z).(z∈Z′|δs(δ(z,first(s)),tail(s))) END)
 ∧
 /* Die vom Automaten akzeptierte Sprache L */
 L = {ω|ω∈seq(Σ) ∧ δs(S,ω) ∩ F ≠ ∅}
 ∧
 /* Der Automat von Folie 21: */
 Σ = {0,1} ∧
 S = {z0} ∧ F = {z2} ∧
 δ = {     (z0,0)↦{z0}, (z0,1)↦{z0,z1},
           (z1,0)↦{z2}, (z1,1)↦{z2},
           (z2,0)↦{z3}, (z2,1)↦{z3},
           (z3,0)↦{z3}, (z3,1)↦{z3} }
DEFINITIONS // Für den Zustandsgraphen:
  SET_PREF_DOT_LIMIT_PAGE_SIZE == FALSE;
  SET_PREF_DOT_HORIZONTAL_LAYOUT == TRUE;
  /* NFA:
  CUSTOM_GRAPH_NODES1 == rec(shape:"doublecircle",nodes:F); // Endzustände
  CUSTOM_GRAPH_NODES2 == rec(shape:"circle",nodes:Z\F); // andere Zustände
  CUSTOM_GRAPH_NODES3 == rec(shape:"none",color:"white",style:"none",nodes:{""});
  CUSTOM_GRAPH_EDGES1 == rec(color:"red",label:"0",edges:{x,y|y∈δ(x,0)});
  CUSTOM_GRAPH_EDGES2 == rec(color:"blue",label:"1",edges:{x,y|y∈δ(x,1)});
  CUSTOM_GRAPH_EDGES3 == rec(color:"black",label:"",edges:{""}*S) // Kanten für Startknoten
  */

  /* DFA: */
  CUSTOM_GRAPH_NODES1 == rec(shape:"doublecircle",nodes:{x|x∈ℙ(Z) & x/\F /= {}}); // Endzustände
  CUSTOM_GRAPH_NODES2 == rec(shape:"circle",nodes:{x|x∈ℙ(Z) & x/\F = {}}); // andere Zustände
  CUSTOM_GRAPH_NODES3 == rec(shape:"none",color:"white",style:"none",nodes:{""});
  CUSTOM_GRAPH_EDGES1 == rec(color:"red",label:"0",edges:{x,y|x∈ℙ(Z) & y=δs(x,[0])});
  CUSTOM_GRAPH_EDGES2 == rec(color:"blue",label:"1",edges:{x,y|x∈ℙ(Z) & y=δs(x,[1])});
  CUSTOM_GRAPH_EDGES3 == rec(color:"black",label:"",edges:{""}*{S}) // Kanten für Startknoten

END
