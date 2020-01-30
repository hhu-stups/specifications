MACHINE MaxQueensNoCheck_v4
/* A puzzle trying to place many queens on the board without attacking the black king */
// this version uses a boolean matrix for the queens
// here ProB finds a Solution in 0.01 seconds for nqueens=42, and straighaway that 43 is impossible
DEFINITIONS
      BWOFFSET(x,y) == (x+y) mod 2;
      ANIMATION_FUNCTION_DEFAULT == ( {r,c,i|r:1..n & c:1..n & i=(r+c) mod 2 }  );
      ANIMATION_FUNCTION == {r,c,i|(r,c)|->TRUE:hasqueen & i= 2+BWOFFSET(r,c)} \/
        { (xcoord_white_king,ycoord_white_king,4), (xcoord_black_king,ycoord_black_king,5)};
      ANIMATION_IMG0 == "ChessPieces/Chess_emptyl45.gif";
      ANIMATION_IMG1 == "ChessPieces/Chess_emptyd45.gif";
      ANIMATION_IMG2 == "ChessPieces/Chess_qll45.gif";
      ANIMATION_IMG3 == "ChessPieces/Chess_qld45.gif";
      ANIMATION_IMG4 == "ChessPieces/Chess_kll45.gif";
      ANIMATION_IMG5 == "ChessPieces/Chess_kdl45.gif";
  SET_PREF_TIME_OUT == 1000;
  SET_PREF_MAX_INITIALISATIONS == 1;
  SET_PREF_TK_CUSTOM_STATE_VIEW_PADDING == 1;
  xcoord_white_king == 1;
  ycoord_white_king == 1;
  xcoord_black_king == n;
  ycoord_black_king == n;
  SET_PREF_SMT_SUPPORTED_INTERPRETER == FALSE;
  SET_PREF_KODKOD == FALSE
CONSTANTS n, nqueens, hasqueen
PROPERTIES
 n=8 &
 hasqueen : (1..n)*(1..n) --> BOOL & // Kodkod does not support this as a function
 !i.(i:1..n => hasqueen((i,8))=FALSE & hasqueen((8,i))=FALSE) &
 hasqueen((1,1)) = FALSE &
 
 !(i,j).(i:1..n & j:1..n
    =>
    ( hasqueen((i,j))=TRUE
       =>
    (// xcoord(q) /= xcoord_black_king & ycoord(q) /= ycoord_black_king & //hard coded above
      xcoord_black_king-i /= ycoord_black_king-j &
      xcoord_black_king-i /= j-ycoord_black_king
      )))
// & nqueens = card({i| i:dom(hasqueen) & hasqueen(i)=TRUE})
 & nqueens = card({i,j| i:1..n & j:1..n & hasqueen((i,j))=TRUE})  // this solves nqueens much much faster than above !! 10 ms for nqueens>6 vs 5 seconds
 & nqueens > 41
END

