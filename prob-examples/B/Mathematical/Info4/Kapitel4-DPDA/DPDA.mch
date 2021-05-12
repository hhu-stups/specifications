MACHINE DPDA
/* B Modell eines PDA */
SETS
 Z = {z0,z1,ze}; // die Zustände des Automaten, z0 ist der Startzustand
 SYMBOLE={a,b, A, BOT, lambda} /* BOT = # = Bottom-Symbol im Keller*/
DEFINITIONS
 Σ == {a,b};   // das Eingabe-Alphabet
 Γ == {A,BOT}; // das Kelleralphabet

 ANIMATION_FUNCTION_DEFAULT == {(1,1,z)};
 ANIMATION_FUNCTION == {2}*α ∪ {3}*(γ);
 ANIMATION_FUNCTION1 == {(1,0,"z: "),(2,0,"α:"),(3,0,"γ:")};
 ANIMATION_STR_JUSTIFY_LEFTx == TRUE;
 SET_PREF_PP_SEQUENCES == TRUE;

 TEST == {a,A,z| a∈Σ ∧ A∈Γ ∧ z∈Z}
CONSTANTS δ,F
PROPERTIES
 /* Der PDA für {a^m b^m| m>=1} ; Beispiel von Info 4 (Folie 95ff) */
 δ = {     (z0,a,BOT)      ↦  (z0,[A,BOT]),
           (z0,a,A)        ↦  (z0,[A,A]),
           (z0,b,A)        ↦  (z1,[]),
           (z1,lambda,BOT) ↦  (ze,[]),
           (z1,b,A)        ↦  (z1,[]) } ∧
 F = {ze} // die Endzustände
 // Anmerkung: δ ist hier als Relation anstatt als Funktion zu Mengen definiert
 //  Deshalb entspricht δ[{(z,a,g)}] in der B Maschine δ(z,a,g) aus dem Skript
ASSERTIONS
   {a|a:Σ} = Σ;

  !(a,A,z).(a∈Σ ∧ A∈Γ ∧ z∈Z => card(δ[{(z,a,A)}]) + card(δ[{(z,a,A)}]) ≤ 1)
  /*@desc Die Überführungsfunktion ist deterministisch */
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
  Akzeptieren = PRE γ = ∅ ∧ z∈F THEN
        /* Wir akzeptieren wenn Eingabe leer und wir in einem Endzustand sind */
   skip END;
  AkzeptierenMitLeeremKeller = PRE γ = ∅ ∧ α = ∅ THEN
              /* Wir akzeptieren wenn Eingabe und Stapel leer sind */
   skip END
END
