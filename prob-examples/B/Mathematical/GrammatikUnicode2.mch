MACHINE GrammatikUnicode2
SETS ΣN = {a,b,c, S, B,C}
CONSTANTS
  Σ /*@desc "Terminale" */, 
  N /*@desc "Nicht-Terminale" */,
  P /*@desc "Regeln/Produktionen der Grammatik */
ABSTRACT_CONSTANTS abl
PROPERTIES
   Σ = {a,b,c} ∧
   Σ ∩ N = {} ∧
   Σ ∪ N = ΣN ∧
   S ∈ N ∧
   P ⊆ seq1(ΣN) × seq(ΣN) ∧

   // Die Beispiel Grammatik G2 von den Folien
   P = { [S] ↦ [a,B,C],
         [S] ↦ [a,S,B,C],
         [C,B] ↦ [B,C],
         [a,B] ↦ [a,b],
         [b,B] ↦ [b,b],
         [b,C] ↦ [b,c],
         [c,C] ↦ [c,c]
       }

   ∧
   // abl = {u,v | ∃(x,z,p,q).( p↦q ∈ P ∧ u = x^p^z ∧ v = x^q^z )}
   abl = {u,v | ∃(p,q).( p↦q ∈ P ∧ v∈REPLACE(p,q,u) )}
       // Verwendung einer eingebauten, effizienteren Funktion REPLACE
DEFINITIONS
 SET_PREF_PP_SEQUENCES == TRUE; "SORT.def";
 SET_PREF_DOT_DECOMPOSE_NODES == FALSE;
 SF7 == UNION(i).(i:0..5|iterate(abl,i)[ {[S]} ]);
 // CUSTOM_GxRAPH_NODES == (SF7 /\ seq(Σ))* {"octagon"} * {"coral1"}
 //                   \/ (SF7 \ seq(Σ))* {"rect"} * {"gray"};
 // requires new ProB:
 CUSTOM_GRAPH_NODES1 == rec(shape:"oval",  color:"green1",nodes:{ [S] });
 CUSTOM_GRAPH_NODES2 == rec(shape:"rect",  style:"rounded", color:"gray",  nodes:((SF7 \ {[S]}) \ seq(Σ)));
 CUSTOM_GRAPH_NODES3 == rec(shape:"octagon",color:"coral1",nodes:(SF7 /\ seq(Σ)));


 CUSTOM_GRAPH_EDGES == rec(color:"blue",style:"dotted",edges:{a,b| a|->b : (SF7 <| abl |> SF7) })
END