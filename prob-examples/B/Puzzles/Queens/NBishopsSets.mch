MACHINE NBishopsSets
/* A puzzle trying to place as many bishops on the board without attacking each other */
// this version uses a set encoding and can be used by KODKOD
// ProB solves this for nbishops > 13 in 0.49 seconds
// Kodkod claims there is no solution for nbishops > 8
// The maximum number of bishops tath can be placed is 2*n - 2; see http://mathworld.wolfram.com/BishopsProblem.html
DEFINITIONS
      BWOFFSET(x,y) == (x+y) mod 2;
      ANIMATION_FUNCTION_DEFAULT == ( {r,c,i|r:1..n & c:1..n & i=(r+c) mod 2 }  );
      ANIMATION_FUNCTION == {r,c,i|(r,c):hasbishop & i= 2+BWOFFSET(r,c)} ;
      ANIMATION_IMG0 == "ChessPieces/Chess_emptyl45.gif";
      ANIMATION_IMG1 == "ChessPieces/Chess_emptyd45.gif";
      ANIMATION_IMG2 == "ChessPieces/Chess_bll45.gif";
      ANIMATION_IMG3 == "ChessPieces/Chess_bld45.gif";
  SET_PREF_TIME_OUT == 15000;
  SET_PREF_MAX_INITIALISATIONS == 1;
  SET_PREF_TK_CUSTOM_STATE_VIEW_PADDING == 1;
  SET_PREF_KODKOD == FALSE
CONSTANTS n, nbishops, hasbishop
PROPERTIES
 n=8 &
 hasbishop <: (1..n)*(1..n) & 
 
 !(i,j).(i:1..n & j:1..n
    =>
    ( (i,j): hasbishop
       =>
        (!k.(k:(i+1)..n => 
           (k,j+k-i) /: hasbishop &
           (k,j-k+i) /: hasbishop
        ))
    ))
 & nbishops = card(hasbishop) 
 & nbishops >13
END
