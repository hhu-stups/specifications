MACHINE KnightsTour_tlc /* variation of KnightsTour where we have added not(GOAL) to invariant */
/* Solution used to be found by ProB in 212.14 seconds using DF */
/* open:14 live:30251 deadlocked:12897 total:43162 TOTAL_OPERATIONS 51088 */
/* Question: can we improve the performance ? */
/* Now in 1.3.7-beta1 it takes about 5-7 seconds; about 70 seconds in default mixed DF/BF */
CONSTANTS n
PROPERTIES n=5
DEFINITIONS GOAL == (card(board)=n*n);
      ANIMATION_FUNCTION_DEFAULT == ( {r,c,ii|r:1..n & c:1..n & ii=0 }  );
      ANIMATION_FUNCTION == ( {r,c,if| r|->c:board & if=1 } <+ {(i,j,3)}  );
      ANIMATION_IMG0 == "images/sm_empty_box.gif";
      ANIMATION_IMG1 == "images/sm_gray_box.gif";
      ANIMATION_IMG2 == "images/sm_knight_white.gif";
      ANIMATION_IMG3 == "images/sm_knight_black.gif";
      KMOVES(dx,dy,x,y) == ( (dx=x+1 & dy=y+2) or (dx=x+1 & dy=y-2) or
                         (dx=x-1 & dy=y+2) or (dx=x-1 & dy=y-2) or
                         (dx=x+2 & dy=y+1) or (dx=x+2 & dy=y-1) or
                         (dx=x-2 & dy=y+1) or (dx=x-2 & dy=y-1) );
VARIABLES board, i, j
INVARIANT   board <: (1..n) * (1..n) & i:1..n & j:1..n 
           /* just the typing: board : INTEGER<->INTEGER & i:INTEGER & j:INTEGER */
INITIALISATION
  board,i,j := {(1,1)},1,1
OPERATIONS
  Move(x,y) = PRE KMOVES(x,y,i,j) & x:1..n & y:1..n & (x,y) /: board THEN
    i,j := x,y ||
    board := board \/ {(x,y)}
  END
END