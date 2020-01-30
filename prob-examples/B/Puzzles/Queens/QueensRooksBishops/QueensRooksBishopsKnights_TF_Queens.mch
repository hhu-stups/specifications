MACHINE QueensRooksBishopsKnights_TF_Queens
/* a version of the Crowded Chessboard model where we allow only queens */
/* Purpose: compare performance with pure N-Queens model (it is considerably slower) */

// Runtimes
// n==8:  1.7 seconds 
// n==9:  0.6 seconds 
// n==10: 4.7 seconds

/*
 Crowded Chessboard Problem from problem 306:
  Dudeney, H. E. Amusements in Mathematics. New York: Dover, pp. 88-89 and 96, 1970.

  Optimal number of bishops: 2*n - 2
 http://mathworld.wolfram.com/BishopsProblem.html
 http://www.gutenberg.org/files/16713/16713-h/16713-h.htm#CHESSBOARD_PROBLEMS
*/

DEFINITIONS
      n==8 ; 
      NBSHP==0; // 2*n-2;
      NKNGHT==0; //6;
      NROOK==0; //n
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
      
      "LibraryIO.def"
SETS
  PIECES = {Queen, Rook, Bishop, Knight,Empty}

CONSTANTS board
PROPERTIES
  board : (1..n)*(1..n) --> PIECES &
  
  !(i,j).(i:1..n & j:1..n
    => LET bij BE bij = board((i,j)) IN
      (bij : {Queen,Rook}
             =>    !k1.(diff(i,k1) => board((k1,j)) /= bij) & !k2.(diff(j,k2) => board((i,k2)) /= bij)
                // !k1.(diff(i,k1) => (k1,j)|->bij /: board) & !k2.(diff(j,k2) => (i,k2)|-> bij /: board) // can be reified, but is slower !
       ) &
       (bij : {Bishop,Queen}
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
        &
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
 card({i,j| i:1..n & j:1..n & board((i,j))=Rook}) = NROOK &
 card({i,j| i:1..n & j:1..n & board((i,j))=Bishop}) = NBSHP &
 card({i,j| i:1..n & j:1..n & board((i,j))=Knight}) = NKNGHT 
// & card({i,j| i:1..n & j:1..n & board((i,j))=Empty}) = (n*n - n - NROOK - NBSHP - NKNGHT) // implied by the above

// & observe(board)
END
/*
 Alternative formulations:
 
!kb.(kb:1..max({i-1,n-i})
                 =>  board[{(i+kb,j+kb)}] /= {bij} & board[{(i+kb,j-kb)}] /= {bij} 
                ) &
                !kb.(kb:1..max({j-1,n-j})
                 =>  board[{(i-kb,j+kb)}] /= {bij} & board[{(i-kb,j-kb)}] /= {bij}
                )
                
                
       (bij : {Bishop,Queen}
             => !kb.(kb:1..(n-1) 
                 =>  (i+kb<=n =>
                       ((j+kb<=n => board((i+kb,j+kb)) /= bij) &
                        (j-kb>1 => board((i+kb,j-kb)) /= bij))
                     )
                     &
                     (i-kb>0 =>
                       ((j+kb<=n => board((i-kb,j+kb)) /= bij) &
                        (j-kb>1 => board((i-kb,j-kb)) /= bij))
                     )
                )
        )
                */

