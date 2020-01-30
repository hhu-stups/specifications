MACHINE MaxQueensNoCheck_v5
/* A puzzle trying to place many queens on the board without attacking the black king */
// this version uses a boolean matrix for the queens
// here ProB finds a Solution in 0.01 seconds for nqueens=42, and straighaway that 43 is impossible
DEFINITIONS
  SET_PREF_TIME_OUT == 1000;
  SET_PREF_MAX_INITIALISATIONS == 2;
  SET_PREF_MAX_OPERATIONS == 65;
  xcoord_white_king == 1;
  ycoord_white_king == 1;
  xcoord_black_king == n;
  ycoord_black_king == n;
CONSTANTS n, hasqueen, nqueens
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
 & nqueens = card({i| i:dom(hasqueen) & hasqueen(i)=TRUE}) & nqueens >41
// & nqueens = card({i,j| i:1..n & j:1..n & hasqueen((i,j))=TRUE})  // this solves nqueens much much faster than above !! 10 ms for nqueens>6 vs 5 seconds
OPERATIONS
 r <-- HasQueen(i,j) = PRE (i,j):dom(hasqueen) THEN r := hasqueen((i,j)) END
END

