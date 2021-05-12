MACHINE NFA_to_DFA_Unicode
/* Simulates the NFA to DFA conversion by a B operation which transforms sets of
   states into sets of states; the state space of the B machine corresponds to the DFA
   (Go encodes the transitions and if Accept is enabled we have a final state) */
DEFINITIONS
  CUSTOM_GRAPH_NODES == (S×{"lightgray"}) <+ (F×{"yellow"}) <+ cur×{"red"} <+ (F ∩ cur)×{"chartreuse3"};
  CUSTOM_GRAPH_EDGES == {z,n,z₂| (z,n) ∈ dom(δ) ∧ z₂ ∈ δ(z,n)};
   Σs == {0,1,2};
   ΣΣs₀ == Σs \/ Σs;
SETS
   Z = {z₀,z₁,z₂,z₃} /*@desc "die Zustände des Automaten" */
ABSTRACT_CONSTANTS
 δs /*@desc "die erweiterte Überführungsfunktion ( ℙ(Z)×seq(Σ)) → ℙ(Z)" */,
 L /*@desc "die vom Automaten generierte Sprache" */
CONSTANTS
  Σ /*@desc "das Alphabet" */,
  S /*@desc "die Startzustände S ⊆ Z" */,
  F /*@desc "die Endzustände F ⊆ Z" */,
  δ /*@desc "die Überführungsfunktion (Z×Σ) → ℙ(Z)" */
PROPERTIES
 Σ = {0,1} ∧
 S ⊆ Z ∧
 F ⊆ Z ∧
 δ ∈ (Z×Σ) → ℙ(Z) ∧

 /* rekursive Definition der erweiterten Übergangsfunktion */
 δs ∈ (ℙ(Z)×seq(Σ)) → ℙ(Z) ∧
 δs = λ(Z′,s).(Z′⊆Z ∧ s∈seq(Σ) |
           IF s=[] THEN Z′
           ELSE  ⋃(z).(z∈Z′|δs(δ(z,first(s)),tail(s))) END)
 ∧

 /* die vom Automaten generierte Sprache */
 L = {ω|ω∈seq(Σ) ∧ δs(S,ω) ∩ F ≠ ∅}

 ∧

 /* Nun der Automat von Folie 24 (Info 4) ∈ */
 S = {z₀} ∧ F={z₂} ∧
 δ = {     (z₀,0)↦{z₀}, (z₀,1)↦{z₀,z₁},
           (z₁,0)↦{z₂}, (z₁,1)↦{z₂},
           (z₂,0)↦{z₃}, (z₂,1)↦{z₃},
           (z₃,0)↦{z₃}, (z₃,1)↦{z₃} }
ASSERTIONS
  δs({z₀},[0,1,1,1]) = {z₀,z₁,z₂,z₃};
  δs({z₃},[]) = {z₃};
  δs({z₀},[1]) = {z₀,z₁};
  [1,1,1] ∈ L
VARIABLES cur
INVARIANT cur ⊆ Z
INITIALISATION cur := S
OPERATIONS
  Go(input) = PRE input∈Σ THEN cur:= δs(cur,[input]) END;
  Accept = PRE cur ∩ F ≠ ∅ THEN skip END
END