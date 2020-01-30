MACHINE MaxQueensNoCheck
/* A puzzle trying to place many queens on the board without attacking the black king */
/* TO DO: investigate why ProB's CLPFD solver becomes slow when nqueens >25 ?? */
DEFINITIONS
      BWOFFSET(k) == (xcoord(k)+ycoord(k)) mod 2;
      ANIMATION_FUNCTION_DEFAULT == ( {r,c,i|r:1..n & c:1..n & i=(r+c) mod 2 }  );
      ANIMATION_FUNCTION == dom({r,c,i,q|q:1..nqueens & r=xcoord(q) & c=ycoord(q) & i= 2+BWOFFSET(q)}) \/
        { (xcoord_white_king,ycoord_white_king,4), (xcoord_black_king,ycoord_black_king,5)};
      ANIMATION_IMG0 == "ChessPieces/Chess_emptyl45.gif";
      ANIMATION_IMG1 == "ChessPieces/Chess_emptyd45.gif";
      ANIMATION_IMG2 == "ChessPieces/Chess_qll45.gif";
      ANIMATION_IMG3 == "ChessPieces/Chess_qld45.gif";
      ANIMATION_IMG4 == "ChessPieces/Chess_kll45.gif";
      ANIMATION_IMG5 == "ChessPieces/Chess_kdl45.gif";
  SET_PREF_TIME_OUT == 30000;
  SET_PREF_MAX_INITIALISATIONS == 1;
  xcoord_white_king == 1;
  ycoord_white_king == 1;
  xcoord_black_king == 8;
  ycoord_black_king == 8;
  SET_PREF_SMT_SUPPORTED_INTERPRETER == FALSE;
  SET_PREF_KODKOD == TRUE
CONSTANTS n, nqueens, xcoord, ycoord
PROPERTIES
 n=8 &
 xcoord : 1..nqueens --> 1..(n-1) & //hard code info that black king on row/col 8
 ycoord : 1..nqueens --> 1..(n-1) & // "
 
 // symmetry breaking of queens and force all queens on different position
 !q.(q:2..nqueens => xcoord(q) >= xcoord(q-1) &
                     (xcoord(q) = xcoord(q-1) => ycoord(q)>ycoord(q-1))) &
 
 (xcoord(1)=xcoord_white_king => ycoord(1)>ycoord_white_king) &
 !q.(q:1..nqueens => 
     (// xcoord(q) /= xcoord_black_king & ycoord(q) /= ycoord_black_king & //hard coded above
      xcoord_black_king-xcoord(q) /= ycoord_black_king-ycoord(q) &
      xcoord_black_king-xcoord(q) /= ycoord(q)-ycoord_black_king)
      )
 & nqueens : 1..64
 & nqueens = 42
END

