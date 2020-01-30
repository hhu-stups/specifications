MACHINE QueensBoardVersionTF
/*
 n  time for first solution (MacBookAir 2.2 GhZ)
 6  0.94 sec
 7  5.17 sec
*/
CONSTANTS n,board
PROPERTIES
 n = 7 &  
 board : (1..n) * (1..n) --> BOOL /* board contains coordinates of all queens */
 &
 //card(board~[{TRUE}]) = n
 card({ij|ij:(1..n)*(1..n) & board(ij)=TRUE}) = n
 &
 !(p,q).((p,q):dom(board) =>
           (board(p,q)=TRUE
              => !i.((i /= 0 & i:-n..n) =>
                              boardfalse(p+i,q) &
                              boardfalse(p,q+i) &
                              boardfalse(p+i,q+i) &
                              boardfalse(p+i,q-i))
            )
        )
DEFINITIONS
      boardfalse(i,j) == ((i,j):dom(board) => board(i,j)=FALSE);
      ANIMATION_FUNCTION_DEFAULT == ( {r,c,i|r:1..n & c:1..n & i=(r+c) mod 2 }  );
      ANIMATION_FUNCTION == ( {r,c,i|c:1..n & board(r,c)=TRUE & i=2+((r+c) mod 2) }  );
      ANIMATION_IMG0 == "images/sm_empty_box.gif";
      ANIMATION_IMG1 == "images/sm_gray_box.gif";
      ANIMATION_IMG2 == "images/sm_queen_white.gif";
      ANIMATION_IMG3 == "images/sm_queen_black.gif";
      SET_PREF_MAX_INITIALISATIONS == 2;
END


