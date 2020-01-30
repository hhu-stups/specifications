MACHINE QueensRooksBishopsKnights_TF_v2
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
// n==5, 4 Knights: 0.9 seconds
// n==5, 5 Knights: 1.1 seconds
// n==5, 6 Knights: no solution after 2.2 seconds
// n==6, 6 Knights: ??
DEFINITIONS
      n==5 ; 
      NBSHP==2*n-2;
      NKNGHT==5;
      diff(ii,kk) == (kk:1..n & ii/=kk);
      diff2(ii,kk) == (kk:1..n & ii<kk);
      SET_PREF_MAX_INITIALISATIONS == 1;
      SET_PREF_TIME_OUT == 450000;
      ANIMATION_FUNCTION_DEFAULT == ( {r,c,i|r:1..n & c:1..n & i=board(r,c) }  );
      ANIMATION_IMG1 == "ChessPieces/Chess_qll45.gif";
      ANIMATION_IMG2 == "ChessPieces/Chess_rll45.gif";
      ANIMATION_IMG3 == "ChessPieces/Chess_bll45.gif";
      ANIMATION_IMG4 == "ChessPieces/Chess_nll45.gif";
      ANIMATION_IMG5 == "ChessPieces/Chess_emptyl45.gif";
      
      "LibraryIO.def";
       Diagonals == ran(%i.(i:0..(n-1)|{j,d|j:1..(n) & (j,i+j)|->d:board})) \/ 
                    ran(%i.(i:0..(n-1)|{j,d|j:1..(n) & (j,i-j)|->d:board})) // TO DO: add more diagonals
                    ;
       SameDiagonal == {i,j,i2,j2|i:1..n & j:1..n & i2:1..n & j2:1..n &  i>i2 & j/=j2 &
                           ((i-i2) = (j-j2) or (i-i2) = (j2-j))}
SETS
  PIECES = {Queen, Rook, Bishop, Knight,Empty}

CONSTANTS board, rooks, queens, OnSameDiagonal
PROPERTIES
  rooks : 1..n >-> 1..n & 
 
  queens(1) : 1..4 & // symmetry breaking
  queens : 1..n >-> 1..n & 
  !i.(i:1..n => board(i,queens(i)) = Queen & board(i,rooks(i))=Rook) &
  //!i.(i:1..n => !j.(j:1..n & j/=queens(i) => board(i,j) /= Queen)) & // slow down ?

  OnSameDiagonal = SameDiagonal
  &
  !(i,j,i2,j2).( (i,j,i2,j2):OnSameDiagonal 
     =>  (board((i,j)) : {Queen,Bishop} => board((i2,j2)) /= board((i,j))) &
         (board((i2,j2)) : {Queen,Bishop} => board((i2,j2)) /= board((i,j))) 
     )
  &
  
  board : (1..n)*(1..n) --> PIECES &
  
  !(i,j).(i:1..n & j:1..n
    => LET bij BE bij = board((i,j)) IN
      (bij : {Queen,Rook}
             => !k.(diff(i,k) => board((k,j)) /= bij) &
                !k.(diff(j,k) => board((i,k)) /= bij)
       ) &
       (bij : {Knight}
             =>  board[{(i+2,j+1)}] /= {bij} & board[{(i+2,j-1)}] /= {bij} &
                 board[{(i-2,j+1)}] /= {bij} & board[{(i-2,j-1)}] /= {bij} &
                 board[{(i+1,j+2)}] /= {bij} & board[{(i+1,j-2)}] /= {bij} &
                 board[{(i-1,j+2)}] /= {bij} & board[{(i-1,j-2)}] /= {bij}
        )
        END
    )
 &        
 card({i,j| i:1..n & j:1..n & board((i,j))=Queen}) = n &
 card({i,j| i:1..n & j:1..n & board((i,j))=Rook}) = n &
 card({i,j| i:1..n & j:1..n & board((i,j))=Bishop}) = NBSHP &
 card({i,j| i:1..n & j:1..n & board((i,j))=Knight}) = NKNGHT &
 card({i,j| i:1..n & j:1..n & board((i,j))=Empty}) = (n*n - 2*n - NBSHP - NKNGHT)

 // & observe(board)
ASSERTIONS
 
        LET diag BE diag = Diagonals IN
          !d.(d:diag => card({i|i:dom(d) & d(i)=Queen}) < 2) &
          !d.(d:diag => card({i|i:dom(d) & d(i)=Bishop}) < 2) 
        END 
    ;
  !(i,j,i2,j2).( (i,j,i2,j2):OnSameDiagonal 
     =>  (board((i,j)) : {Queen,Bishop} => board((i2,j2)) /= board((i,j))))
     ;
     
     
  !(i,j).(i:1..n & j:1..n
    => LET bij BE bij = board((i,j)) IN
        (bij : {Queen,Bishop}
             => !kb.(kb:1..(n-1) 
                 =>  (i+kb<=n =>
                       (board[{(i+kb,j+kb)}] /= {bij} &
                        board[{(i+kb,j-kb)}] /= {bij})
                     )
                     &
                     (i-kb>0 =>
                       (board[{(i-kb,j+kb)}] /= {bij} &
                        board[{(i-kb,j-kb)}] /= {bij})
                     )
                )
        )
        END
    )
    
END

