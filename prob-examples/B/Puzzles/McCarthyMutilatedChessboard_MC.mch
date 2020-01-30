MACHINE McCarthyMutilatedChessboard_MC
/* A encoding of the famous problem so that model checking finds a solution */
DEFINITIONS n==7;
      ANIMATION_FUNCTION_DEFAULT == ( {r,c,i|r:0..n & c:0..n & i=2+(r+c) mod 2 }  );
      ANIMATION_FUNCTION == ( {r,c,i|r|->c : remaining & i=((r+c) mod 2) }  );
      ANIMATION_IMG0 == "images/sm_empty_box.gif";
      ANIMATION_IMG1 == "images/sm_gray_box.gif";
      ANIMATION_IMG2 == "images/sm_queen_white.gif";
      ANIMATION_IMG3 == "images/sm_queen_black.gif";
CONSTANTS Board, MutilatedBoard
PROPERTIES
 Board = (0..n) * (0..n) &
 MutilatedBoard = Board \ {(0,0),(n,n)} 
VARIABLES row,remaining
INVARIANT
 row : 0..n & remaining <: Board
 /* row = n+1 means a solution was found */
INITIALISATION remaining := MutilatedBoard 
               || row := 0
OPERATIONS
  TileRight(y) = PRE row|->y : remaining & row|->(y+1) : remaining &
                     y<n & (y=0 or row|->(y-1) /: remaining) THEN
     remaining := remaining - { row|->y, row|->(y+1)}
  END;
  TileDown(y) = PRE row|->y : remaining & (row+1)|->y : remaining &
                    row<n & (y=0 or row|->(y-1) /: remaining) THEN
     remaining := remaining - { row|->y, (row+1)|->y}
  END;
  NextRow = PRE !y.(y:0..n => row|->y /: remaining) THEN
     row := row+1
  END
END

