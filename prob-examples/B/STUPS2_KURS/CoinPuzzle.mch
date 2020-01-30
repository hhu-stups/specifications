MACHINE CoinPuzzle
SETS
 ALLCOINS
DEFINITIONS
 scope_COINS == 1..6
CONSTANTS
 COINS
PROPERTIES COINS <: ALLCOINS
VARIABLES up, pile, finished
INVARIANT
 up <: COINS & /* coins that are up */
 pile <: COINS & /* coins in the first pile */
 finished : BOOL &
 (finished = TRUE => (card(up /\ pile) = card(up /\ (COINS - pile))))
INITIALISATION up :: POW(COINS) || pile := {} || finished := FALSE
OPERATIONS
  /* Flip(c) = PRE c:COINS THEN 
     IF c:up THEN up := up - {c} ELSE up := up \/ {c} END
  END;
  Success = PRE card(up /\ pile) = card(up /\ (COINS - pile)) THEN skip END;
  Take = ANY p WHERE p<: COINS & card(p) = card(up) THEN pile := p END;
  FlipPile = BEGIN up := (up - pile) \/ (pile - up) END;
*/
  TakeAndFlipPile = ANY p WHERE p<: COINS & card(p) = card(up) THEN
         pile := p || up := (up - p) \/ (p - up) || finished := TRUE
  END
END

