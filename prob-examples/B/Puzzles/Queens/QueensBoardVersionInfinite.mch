MACHINE QueensBoardVersionInfinite
CONSTANTS n,board
PROPERTIES
 n = 4 &  
 board <: (1..n) * (1..n) /* board contains coordinates of all queens */
 &
 card(board) = n
 &
 !(p,q).((p,q):board => !i.(i /= 0 =>
                              (p+i,q) /: board &
                              (p,q+i) /: board &
                              (p+i,q+i) /: board &
                              (p+i,q-i) /: board)
        )
DEFINITIONS
      ANIMATION_FUNCTION_DEFAULT == ( {r,c,i|r:1..n & c:1..n & i=(r+c) mod 2 }  );
      ANIMATION_FUNCTION == ( {r,c,i|c:1..n & (r,c):board & i=2+((r+c) mod 2) }  );
      ANIMATION_IMG0 == "images/sm_empty_box.gif";
      ANIMATION_IMG1 == "images/sm_gray_box.gif";
      ANIMATION_IMG2 == "images/sm_queen_white.gif";
      ANIMATION_IMG3 == "images/sm_queen_black.gif";
      SET_PREF_MAX_INITIALISATIONS == 10;
      SET_PREF_MAX_OPERATIONS == 10;
END


