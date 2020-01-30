MACHINE QueensRooksBishopsKnights_v3
 // uses has_bishop total function
DEFINITIONS
      n==5 ; 
      NBSHP==2*n-2;
      diff(ii,kk) == (kk:1..n & ii/=kk);
      diff2(ii,kk) == (kk:1..n & ii<kk);
      SET_PREF_MAX_INITIALISATIONS == 1;
      SET_PREF_TIME_OUT == 5000;
      ANIMATION_FUNCTION_DEFAULT == ( {r,c,i|r:1..n & c:1..n & i=board(r,c) }  );
      "LibraryIO.def"
SETS
  PIECES = {Queen, Rook, Bishop, Empty}

CONSTANTS board
PROPERTIES
  board : (1..n)*(1..n) --> PIECES &
  
  !(i,j).(i:1..n & j:1..n
    => LET bij BE bij = board((i,j)) IN
      (bij : {Queen,Rook}
             => !k.(diff(i,k) => board((k,j)) /= bij) &
                !k.(diff(j,k) => board((i,k)) /= bij)
       ) &
       (bij : {Bishop,Queen}
             => !k.(k:1..(n-1) 
                 =>  board[{(i+k,j+k)}] /= {bij} & board[{(i+k,j-k)}] /= {bij} &
                     board[{(i-k,j+k)}] /= {bij} & board[{(i-k,j-k)}] /= {bij}
                )
        )
        END
    )
 &        
 card({i,j| i:1..n & j:1..n & board((i,j))=Queen}) = n &
 card({i,j| i:1..n & j:1..n & board((i,j))=Rook}) = n &
 card({i,j| i:1..n & j:1..n & board((i,j))=Bishop}) = NBSHP &
 card({i,j| i:1..n & j:1..n & board((i,j))=Empty}) = (n*n - 2*n - NBSHP)

 // & observe(board)
END

