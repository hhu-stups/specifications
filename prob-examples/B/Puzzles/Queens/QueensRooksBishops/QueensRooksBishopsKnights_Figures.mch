MACHINE QueensRooksBishopsKnights_Figures
// v2 includes queens and rooks separate injections
// and uses other encoding of diagonals
/*
 Crowded Chessboard Problem from problem 306:
  Dudeney, H. E. Amusements in Mathematics. New York: Dover, pp. 88-89 and 96, 1970.

  Optimal number of bishops: 2*n - 2
 http://mathworld.wolfram.com/BishopsProblem.html
 http://www.gutenberg.org/files/16713/16713-h/16713-h.htm#CHESSBOARD_PROBLEMS
*/

 // Runtimes
// n==5 : 70 ms
// n==6 : 830 ms
// n==7 : 23.2 seconds
// n==8 :
DEFINITIONS
      n==5 ; 
      NBSHP==2*n-2;
      NKNGHT==5;
      diff(ii,kk) == (kk:1..n & ii/=kk);
      diff2(ii,kk) == (kk:1..n & ii<kk);
      SET_PREF_MAX_INITIALISATIONS == 1;
      SET_PREF_TIME_OUT == 450000;
      ANIMATION_FUNCTION_DEFAULT == ( {r,c,i|r:1..n & c:1..n & i=IF (r+c) mod 2 =0 THEN 5 ELSE 15 END }  );
      ANIMATION_FUNCTION1 == ( {r,c,i|r:1..n & c=queens(r) & i=IF (r+c) mod 2 =0 THEN 1 ELSE 11 END }  );
      ANIMATION_FUNCTION2 == ( {r,c,i|r:1..n & c=rooks(r) & i=IF (r+c) mod 2 =0 THEN 2 ELSE 12 END }  );
      ANIMATION_FUNCTION3 == ( {r,c,i|r:1..n & c:1..n & #b.(b:1..NBSHP & bishops_x(b)=r & bishops_y(b)=c) & i=IF (r+c) mod 2 =0 THEN 3 ELSE 13 END }  );
      ANIMATION_IMG1 == "ChessPieces/Chess_qll45.gif";
      ANIMATION_IMG2 == "ChessPieces/Chess_rll45.gif";
      ANIMATION_IMG3 == "ChessPieces/Chess_bll45.gif";
      ANIMATION_IMG4 == "ChessPieces/Chess_nll45.gif";
      ANIMATION_IMG5 == "ChessPieces/Chess_emptyl45.gif";
      ANIMATION_IMG11 == "ChessPieces/Chess_qld45.gif";
      ANIMATION_IMG12 == "ChessPieces/Chess_rld45.gif";
      ANIMATION_IMG13 == "ChessPieces/Chess_bld45.gif";
      ANIMATION_IMG15 == "ChessPieces/Chess_emptyd45.gif";
      
      "LibraryIO.def"
      
SETS
  PIECES = {Queen, Rook, Bishop, Knight,Empty}

CONSTANTS rooks, queens, bishops_x, bishops_y, SameDiagonal, SameDiagonalFor, NotSameDiagonalFor
PROPERTIES
  rooks : 1..n >-> 1..n & 
 
  queens(1) : 1..4 & // symmetry breaking
  queens : 1..n >-> 1..n & 
  
  !(q1,q2).(q1:1..n & q2:2..n & q2>q1
    => queens(q1)+(q2-q1) /= queens(q2) & queens(q1)+(q1-q2) /= queens(q2))
    
  &
  !i.(i:1..n => queens(i) /= rooks(i)) &
  //!i.(i:1..n => !j.(j:1..n & j/=queens(i) => board(i,j) /= Queen)) & // slow down ?

  bishops_x: 1..NBSHP --> 1..n &
  bishops_y: 1..NBSHP --> 1..n &
  !b.(b:2..NBSHP => bishops_x(b) >= bishops_x(b-1) & 
                    (bishops_x(b)=bishops_x(b-1) => bishops_y(b) > bishops_y(b-1)))

  &
  
       SameDiagonal = {i,j,i2,j2|i:1..n & j:1..n & i2:1..n & j2:1..n &  i>i2 & j/=j2 &
                           ((i-i2) = (j-j2) or (i-i2) = (j2-j))}
  &
  
       SameDiagonalFor = %(i,j).(i:1..n & j:1..n | {i2,j2 | (i,j,i2,j2):SameDiagonal})
  &
  
       NotSameDiagonalFor = %(i,j).(i:1..n & j:1..n | {i2,j2 | i2:1..n & j2:1..n & (i,j,i2,j2)/:SameDiagonal})
  &
  !b.(b:1..(NBSHP-1)
     =>  !b2.(b2:2..NBSHP 
              // => (bishops_x(b),bishops_y(b), bishops_x(b2), bishops_y(b2)) /: SameDiagonal)
              => (bishops_x(b2), bishops_y(b2)) /: SameDiagonalFor((bishops_x(b),bishops_y(b)))
              // => (bishops_x(b2), bishops_y(b2)) : NotSameDiagonalFor((bishops_x(b),bishops_y(b)))
             )
     )
    
END

