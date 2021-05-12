MACHINE DominatingSet
/* version of dominating set problem for small-leaf example */
SETS
 Vertices = {v0,v1,v2,v3,v4,v5,v6,v7,v8,v9,
             v10,v11,v12,v13,v14}
CONSTANTS g, gd,
  DomSet /*@desc "a dominating set: all nodes have at least one neighbour in DomSet" */,
  NDS    /*@desc "The complement of DomSet" */,
  cd     /*@desc "The cardinality of DomSet" */
PROPERTIES
  g∈ Vertices ↔ Vertices ∧
  g = gd ∪ gd⁻¹ ∧
  gd = {v0↦v1,
        v1↦v2, v1↦v3, v1↦v4,
        v2↦v5, v2↦v6, v2↦v3,
        v3↦v6, v3↦v7, v3↦v8,
        v4↦v3, v4↦v8, v4↦v9,
        v5↦v10, v5↦v6,
        v6↦v10, v6↦v11, v6↦v7,
        v7↦v11, v7↦v12, v7↦v13,
        v8↦v7,  v8↦v13, v8↦v14,
        v9↦v8, v9 ↦ v14,
        v10↦v11,
        v11↦v12,
        v13↦v12,
        v14↦v13
       }
 ∧
  DomSet ∪ NDS = Vertices ∧
  DomSet ∩ NDS = ∅
 ∧
  ∀x.(x∈Vertices ⇒
        (x∈NDS ⇒ ∃y.(y∈g[{x}] ∧ y∈DomSet) )
      )
  ∧ IsConnected(DomSet)
  ∧ cd = card(DomSet) ∧ MINIMIZE_EXPR(cd) // card(DomSet) = 4

DEFINITIONS
  CUSTOM_GRAPH_NODES == DomSet * {"green"} ∪ NDS * {"slateblue"};
  CUSTOM_GRAPH_EDGES == gd;

  IsDomSet(ds) == 
     /* can be used for :min IsDomSet(ds) or :min λds.(IsDomSet(ds)|card(ds)) */
     ∀x.(x∈Vertices ⇒
        (x∈Vertices \ ds ⇒ ∃y.(y∈g[{x}] ∧ y∈ds) )
      );
  IsConnected1(ds) == ∀x.(x∈ds ⇒ ∃y.(y∈ds ∧ x↦y ∈ g));
  IsConnected(ds) == ∀x.(x∈ds ⇒ {x} ∪ closure1(ds ◁ g ▷ ds)[{x}]=ds);
  SET_PREF_SMT == TRUE; SET_PREF_KODKOD == FALSE;
 "LibraryProB.def" // for MAXIMIZE_EXPR
END

