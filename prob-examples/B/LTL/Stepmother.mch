MACHINE Stepmother
DEFINITIONS
 DOM == 0..4;
 GOAL == ran(bottles) /<: 0..bv  /* step mother wins if some bottle overflows */
SETS
 ID={aa,bb}
CONSTANTS bv, jv
PROPERTIES
 bv = 10 &  /* individual bottle volume */
 jv = 5     /* jar volume */
VARIABLES bottles, turn
INVARIANT
  bottles : DOM --> NATURAL & 
  turn : BOOL /* TRUE if it the stepmother's turn */
INITIALISATION turn := TRUE || bottles := DOM * {0}
OPERATIONS
  Stepmother_DistributeJar(b) = PRE turn = TRUE &
  /* Stepmother can distribute contents of jar onto bottles */
     b : DOM --> NATURAL & SIGMA(x).(x:DOM|b(x)) = jv THEN
   bottles := %i.(i:DOM| bottles(i) + b(i)) || turn := FALSE
 END;
 Stepmother_wins = PRE turn = FALSE  & max(ran(bottles)) > bv THEN skip END;
  Cinderalla_Empty(ei,ej) = PRE turn = FALSE & 
    /* Cinderalla can empty two adjacent bottles (bottles arranged in a ring) */
    ei: dom(bottles) & ej=(ei+1) mod 5 & ej:dom(bottles)
   & ( bottles(ei) = max(ran(bottles)) or bottles(ej) = max(ran(bottles))) /* encoding of one algorithm */
   THEN
   bottles :=  bottles <+ {ei|->0, ej|->0} || turn := TRUE
 END
END

