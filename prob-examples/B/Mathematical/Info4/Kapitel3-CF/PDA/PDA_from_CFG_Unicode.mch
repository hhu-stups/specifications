MACHINE PDA_for_CFG_Unicode
/* B Modell eines PDA */
SETS
 Z = {z0}; // die Zustände des Automaten, z0 ist der Startzustand
 SYMBOLE={a,b, S, C, lambda} /* BOT = # = Bottom-Symbol im Keller*/
DEFINITIONS
 
 ANIMATION_FUNCTION_DEFAULT == {(1,1,z)};
 ANIMATION_FUNCTION == {2}*α ∪ {3}*(γ);
 ANIMATION_FUNCTION1 == {(1,0,"z: "),(2,0,"α:"),(3,0,"γ:")};
 ANIMATION_STR_JUSTIFY_LEFTx == TRUE;
 SET_PREF_PP_SEQUENCES == TRUE
CONSTANTS Σ, BOT, Γ,
          P, δ
PROPERTIES
 Σ = {a,b} ∧   // das Eingabe-Alphabet
 BOT = S ∧
 Γ = {S,C,a,b}  // das Kelleralphabet
 ∧

/* Die Grammatik Regeln */
 P = { S ↦ [a,S,b], S ↦ [C],
       C ↦ [a,b] } ∧
    
 /* Berechnung von δ aus P */
  δ =  /* lässt sich eine Regel auf das Top-Symbol im Keller anwenden tue 
          dies ohne etwas zu lesen :*/
         { lhs,rhs | ∃(A,q).( A↦q ∈ P ∧ lhs=(z0,lambda,A) ∧ rhs=(z0,q))}
         ∪
          /* ist das Top-Symbol im Keller ein Terminalzeichen a welches
             auf der Eingabe steht, so wird dies aus dem Keller gePOPt */
         { lhs,rhs | ∃a.(a∈Σ ∧ lhs = (z0,a,a) & rhs = (z0,[]))}
 
 
VARIABLES 
  z, α, γ  // Konfiguration in dem sich der PDA befindet
INVARIANT
 z ∈ Z ∧ // der aktuelle Zustand
 α ∈ seq(Σ) ∧ // der noch zu lesende Teil des Eingabeworts
 γ ∈ seq(Γ) // aktuelle Kellerinhalt
INITIALISATION
  z := z0 ||
  γ := [BOT] || // Initialisierung des Stapels
  α := [a,a,b,b] // das Eingabewort
OPERATIONS
 // die Operationen Schritt und LambdaSchritt modellieren
 // Schritte in der Ableitungsrelation
  Schritt(z‘,s) = PRE α ≠ ∅ ∧ γ ≠ ∅ ∧
                z‘↦s ∈ δ[{(z,first(α),first(γ))}] THEN
     z := z‘ || // in den neuen Zustand wechseln
     α := tail(α) || // das erste Symbol auf der Eingabe löschen
     γ := s^tail(γ) // s auf den Stapel packen
  END;
  LambdaSchritt(z‘,s) = PRE γ ≠ ∅ ∧
                      z‘↦s ∈ δ[{(z,lambda,first(γ))}] THEN
     z := z‘ ||  // in den neuen Zustand wechseln
     γ := s^tail(γ) // s auf den Stapel packen
  END;
  Akzeptieren = PRE γ = ∅ ∧ α = ∅ THEN  
              /* Wir akzeptieren wenn Eingabe und Stapel leer sind */
   skip END
END