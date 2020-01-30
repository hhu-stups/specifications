MACHINE QueensAllDifferent
/* An alternate encoding of the N-Queens problem, which does not work very well yet */
CONSTANTS n,queens
PROPERTIES
 n = 4 & /* A solution to NQueens which uses all-different constraints */
 queens : 1..n --> 1..n /* for each column the row in which the queen is in */
 &
 %i.(i:1..n|queens(i)) : INTEGER >+> INTEGER /* better encoding of all different */
 /* does not really work well yet: computation of lambda delays too long */

 &
 %i.(i:1..n|queens(i)-i) : INTEGER >+> INTEGER /* better encoding of all different */
 /* does not really work well yet: computation of lambda delays too long */

 &
 %i.(i:1..n|queens(i)+i) : INTEGER >+> INTEGER /* better encoding of all different */
 /* does not really work well yet: computation of lambda delays too long */

DEFINITIONS
      ANIMATION_FUNCTION_DEFAULT == ( {r,c,i|r:1..n & c:1..n & i=(r+c) mod 2 }  );
      ANIMATION_FUNCTION == ( {r,c,i|c:1..n & r=queens(c) & i=2+((r+c) mod 2) }  );
      ANIMATION_IMG0 == "images/sm_empty_box.gif";
      ANIMATION_IMG1 == "images/sm_gray_box.gif";
      ANIMATION_IMG2 == "images/sm_queen_white.gif";
      ANIMATION_IMG3 == "images/sm_queen_black.gif";
      SET_PREF_MAX_INITIALISATIONS == 3;
      SET_PREF_MAX_OPERATIONS == 10;
OPERATIONS
  r<--Get(yy) = PRE yy:1..n THEN r:= queens(yy) END
END


