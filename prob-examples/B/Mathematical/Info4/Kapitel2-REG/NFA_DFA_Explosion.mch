MACHINE NFA_DFA_Explosion
ABSTRACT_CONSTANTS δs
CONSTANTS Σ, Z, S, F, δ, n
PROPERTIES
 F ⊆ Z ∧ S ⊆ Z ∧
 δ ∈ (Z×Σ) → ℙ(Z) ∧

 /* Definition der erweiterten Überführungsfunktion */
 δs ∈ (ℙ(Z)×seq(Σ)) → ℙ(INTEGER) ∧
 δs = λ(Z′,s).(Z′⊆Z ∧ s∈seq(Σ) |
           IF s=[] THEN Z′
           ELSE         ⋃(z).(z∈Z′|δs(δ(z,first(s)),tail(s))) END)

 ∧
 /* Für die Automaten ab Folie 31: */
 Σ = {0,1} ∧
 Z = 0..(n) ∧
 S = {0} ∧
 n ∈ 1..8 ∧
 F = {n} ∧
 δ = {     (0,0)↦{0}, (0,1)↦{0,1},
           (n,0)↦{}, (n,1)↦{}
           } \/
        λ(z,i).(z∈1..(n-1) & i∈Σ | {z+1})
ASSERTIONS
  δs ∈ (ℙ(Z)×seq(Σ)) → ℙ(INTEGER) // as Z is not a type, checking that range <: POW(Z) requires expanding infinite function
VARIABLES Reachable
INVARIANT Reachable <: POW(Z)
INITIALISATION Reachable := POW(Z)
OPERATIONS Compute_Reachable = // Berechne erreichbaren Konfigurationen von S aus
   BEGIN Reachable := closure({x,y| x:POW(Z) & (y=δs(x,[0]) or y= δs(x,[1]))}) [ {S} ] END


DEFINITIONS // Für den Zustandsgraphen des DFAs nach Potenzmengenkonstruktion:
  SET_PREF_DOT_LIMIT_PAGE_SIZE == FALSE; // requires brand-new probcli
  SET_PREF_DOT_HORIZONTAL_LAYOUT == TRUE;
  SET_PREF_DOT_DECOMPOSE_NODES == FALSE;

  CUSTOM_GRAPH_NODES1 == rec(shape:"doublecircle",nodes:{x|x∈Reachable & x/\F /= {}}); // Endzustände
  CUSTOM_GRAPH_NODES2 == rec(shape:"circle",nodes:{x|x∈Reachable & x/\F = {}}); // andere Zustände
  CUSTOM_GRAPH_NODES3 == rec(shape:"none",color:"white",style:"none",nodes:{""});
  CUSTOM_GRAPH_EDGES1 == rec(color:"red",label:"0",edges:{x,y|x∈Reachable & y=δs(x,[0])});
  CUSTOM_GRAPH_EDGES2 == rec(color:"green",label:"1",edges:{x,y|x∈Reachable & y=δs(x,[1])});
  CUSTOM_GRAPH_EDGES3 == rec(color:"black",label:"",edges:{""}*{S}) // Kanten für Startknoten
END

