MACHINE QueensRooksBishopsKnights_Elegant
/*
 Crowded Chessboard Problem from problem 306:
  Dudeney, H. E. Amusements in Mathematics. New York: Dover, pp. 88-89 and 96, 1970.

  Optimal number of bishops: 2*n - 2
 http://mathworld.wolfram.com/BishopsProblem.html
 http://www.gutenberg.org/files/16713/16713-h/16713-h.htm#CHESSBOARD_PROBLEMS
*/

DEFINITIONS
      SET_PREF_MAX_INITIALISATIONS == 1;
      SET_PREF_TIME_OUT == 4500;
      ANIMATION_FUNCTION_DEFAULT == ( {r,c,i|r:1..n & c:1..n & i=board(r,c) }  );
      ANIMATION_IMG1 == "ChessPieces/Chess_qll45.gif";
      ANIMATION_IMG2 == "ChessPieces/Chess_rll45.gif";
      ANIMATION_IMG3 == "ChessPieces/Chess_bll45.gif";
      ANIMATION_IMG4 == "ChessPieces/Chess_nll45.gif";
      ANIMATION_IMG5 == "ChessPieces/Chess_emptyl45.gif";
      ANIMATION_IMG11 == "ChessPieces/Chess_qld45.gif";
      ANIMATION_IMG12 == "ChessPieces/Chess_rld45.gif";
      ANIMATION_IMG13 == "ChessPieces/Chess_bld45.gif";
      ANIMATION_IMG15 == "ChessPieces/Chess_emptyd45.gif";
      
      "LibraryIO.def";      
      "LibrarySTRINGS.def";
      
      arrpos(i,j) == (i-1)*n+j; // converting two dimensional coordinates to one dimensional
      pdiff == {piece,i,j,i2,j2,s| piece:PIECES & (i,j) : dom(board) & (i2,j2):attack(piece)(i,j) &
                  s = FORMAT_TO_STRING("(board(~w)=~w => board(~w)/=~w) ",
                          [INT_TO_STRING(arrpos(i,j)),TO_STRING(piece),
                           INT_TO_STRING(arrpos(i2,j2)),TO_STRING(piece)])};
      prdiff == {x|x:ran(pdiff) & printf("~w &~n",x)}
SETS
  PIECES = {Queen, Rook, Bishop, Knight,Empty}
ABSTRACT_CONSTANTS
   dist
CONSTANTS
   n, same_row_or_col, same_diagonal, knight_move, board, nr_of_pieces, attack
PROPERTIES
  n=4
  &
  /* computing distance between two indices: */
  dist = %(i,j).(i:INTEGER & j:INTEGER| IF i>=j THEN i-j ELSE j-i END)
  &
  
  /* auxiliary functions to compute attacking positions : */
  same_row_or_col = %(i,j).(i:1..n & j:1..n | {i2,j2|i2:1..n & j2:1..n & (i,j) /= (i2,j2) & (i=i2 or j=j2)})
  &
  same_diagonal = %(i,j).(i:1..n & j:1..n | {i2,j2|i2:1..n & j2:1..n & (i,j) /= (i2,j2) & (i2-i=j2-j or i-i2=j2-j)})
  &
  knight_move = %(i,j).(i:1..n & j:1..n | {i2,j2|i2:1..n & j2:1..n & i/=i2 & j/=j2 & dist(i,i2)+dist(j,j2)=3})
  &
  attack = {Rook |-> same_row_or_col,
            Bishop |-> same_diagonal,
            Queen |-> %p.(p:(1..n)*(1..n)| same_row_or_col(p) \/ same_diagonal(p)),
            Knight |-> knight_move,
            Empty |-> ((1..n)*(1..n))*{{}}
            }
  
  & 
  
  /* constraints on the number of pieces: */
  nr_of_pieces : PIECES --> 0..n**2 &
  // {Queen|->n, Rook|->n, Bishop |-> 2*n-2, Knight |-> 2} <: nr_of_pieces &
  {Queen|->n, Rook|->n, Bishop |-> 5, Knight |-> 2} <: nr_of_pieces &
  SIGMA(p).(p:PIECES|nr_of_pieces(p)) = n**2
 
  &
  /* Now the proper crowded chessboard constraint itself: */
  board : (1..n)*(1..n) --> PIECES
  &
  /* pieces do not attack pieces of the same type: */
  !(pos,piece).( pos|-> piece : board
       => !(pos2).( pos2:attack(piece)(pos) => board(pos2) /= piece))  
  &
  /* the cardinality constraints are respected: */
  !P.(P:PIECES => card({p| p:dom(board) & board(p)=P}) = nr_of_pieces(P))


ASSERTIONS

  !(pos,piece).( pos|-> piece : board
       =>
           (piece : {Queen,Rook} => !(pos2).( pos2:same_row_or_col(pos) => board(pos2) /= piece))
           &
           (piece : {Queen,Bishop} => !(pos2).( pos2:same_diagonal(pos) => board(pos2) /= piece))
           &
           (piece : {Knight} => !(pos2).( pos2:knight_move(pos) => board(pos2) /= piece))
           )
           ;
 card({p| p:dom(board) & board(p)=Queen}) = n &
 card({p| p:dom(board) & board(p)=Rook}) = n &
 card({p| p:dom(board) & board(p)=Bishop}) = nr_of_pieces(Bishop) &
 card({p| p:dom(board) & board(p)=Knight}) = nr_of_pieces(Knight) &
 card({p| p:dom(board) & board(p)=Empty}) = (n*n - 2*n - nr_of_pieces(Bishop) - nr_of_pieces(Knight))

END

