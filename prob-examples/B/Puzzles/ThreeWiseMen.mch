MACHINE ThreeWiseManPuzzle
SETS
 COLOURS={black,white}
CONSTANTS 
  W1 /*@desc "Colour of hat of wise man 1" */,
  W2 /*@desc "Colour of hat of wise man 2" */,
  W3 /*@desc "Colour of hat of wise man 3" */
DEFINITIONS
  SET_PREF_MAX_INITIALISATIONS == 9;
  model(w1,w2,w3) == ¬(w1=white ∧ w2=white ∧ w3=white) /*@desc "At least one of the hats must be black */
PROPERTIES
  {W1,W2,W3} ⊆ COLOURS
  ∧

  model(W1,W2,W3)
  ∧

  ∀w1.(w1∈COLOURS ⇒ model(w1,W2,W3))
  /*@desc "based on his observations W2,W3, both colours for W1 must be possible" */

  ∧

  ∀w2.(w2∈COLOURS ⇒ model(W1,w2,W3) ∧ 
                      ∀w1.(w1∈COLOURS ⇒ model(w1,w2,W3))
                       /*@desc "for wizard 1 both values for W1 possible */
      )
  /*@desc "based on his observations W1,W3, both colours for W2 must be possible" */
ASSERTIONS
  W3=black
END


