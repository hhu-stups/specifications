MACHINE UnconstrainedQueens
DEFINITIONS
      ANIMATION_FUNCTION_DEFAULT == ( {r,c,i|r:1..dim & c:1..dim & i=(r+c) mod 2 }  );
      ANIMATION_FUNCTION == ( {r,c,i|c:1..dim & r|->c : queens & i=2+((r+c) mod 2) }  );
      ANIMATION_IMG0 == "images/sm_empty_box.gif";
      ANIMATION_IMG1 == "images/sm_gray_box.gif";
      ANIMATION_IMG2 == "images/sm_queen_white.gif";
      ANIMATION_IMG3 == "images/sm_queen_black.gif";
      SET_PREF_MAX_OPERATIONS == 2; SET_PREF_MAXINT == 8
VARIABLES queens,dim
INVARIANT
 dim : NATURAL &
 queens : 1..dim <-> 1..dim 
INITIALISATION queens,dim := {},8
OPERATIONS
  NewConfig(q,n) = PRE n:NATURAL1 & q : 1..n <-> 1..n THEN queens,dim := q,n END
END