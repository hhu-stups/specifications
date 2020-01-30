MACHINE MxQueensSimple
/* Just trying to place many queens using ordered coordinates */
DEFINITIONS
      BWOFFSET(k) == (xcoord(k)+ycoord(k)) mod 2;
      ANIMATION_FUNCTION_DEFAULT == ( {r,c,i|r:1..n & c:1..n & i=(r+c) mod 2 }  );
      ANIMATION_FUNCTION == dom({r,c,i,q|q:1..nqueens & r=xcoord(q) & c=ycoord(q) & i= 2+BWOFFSET(q)});
      ANIMATION_IMG0 == "ChessPieces/Chess_emptyl45.gif";
      ANIMATION_IMG1 == "ChessPieces/Chess_emptyd45.gif";
      ANIMATION_IMG2 == "ChessPieces/Chess_qll45.gif";
      ANIMATION_IMG3 == "ChessPieces/Chess_qld45.gif";
  SET_PREF_TIME_OUT == 30000;
  SET_PREF_MAX_INITIALISATIONS == 1;
  SET_PREF_SMT_SUPPORTED_INTERPRETER == FALSE;
  SET_PREF_KODKOD == FALSE;
  // SET_PREF_RANDOMISE_ENUMERATION_ORDER == TRUE;
  "LibraryIO.def"
CONSTANTS n, nqueens, xcoord, ycoord
PROPERTIES
 n=8 & // observe_fun(xcoord) &
 xcoord : 1..nqueens --> 1..(n-1) & //hard code info that black king on row/col 8
 ycoord : 1..nqueens --> 1..(n-1) & // "
 
 // symmetry breaking of queens and force all queens on different position
 !q.(q:2..nqueens => xcoord(q) >= xcoord(q-1) &
                     (xcoord(q) = xcoord(q-1) => ycoord(q)>ycoord(q-1))) &
 
 nqueens : 1..64
 & nqueens = 30  // 4.5 secs for 30 but usually 0.02 with randomise enumeration order
END

