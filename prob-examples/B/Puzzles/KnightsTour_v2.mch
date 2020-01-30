MACHINE KnightsTour_v2
/* A slower version due to the set comprehension computation of KMOVES at every step */
/* Solution found by ProB in 598.96 seconds using DF */
/* open:14 live:19687 deadlocked:8476 total:28177 TOTAL_OPERATIONS 32866 */
/* Question: can we improve the performance ? */
CONSTANTS n
PROPERTIES n=5
DEFINITIONS GOAL == (card(board)=n*n);
      ANIMATION_FUNCTION_DEFAULT == ( {r,c,i|r:1..n & c:1..n & i=0 }  );
      ANIMATION_FUNCTION == ( {r,c,i| r|->c:board & i=1 } <+ {(i,j,3)}  );
      ANIMATION_IMG0 == "images/sm_empty_box.gif";
      ANIMATION_IMG1 == "images/sm_gray_box.gif";
      ANIMATION_IMG2 == "images/sm_knight_white.gif";
      ANIMATION_IMG3 == "images/sm_knight_black.gif";
      KMOVES(x,y) == {dx,dy | (dx=x+1 & dy=y+2) or (dx=x+1 & dy=y-2) or
                         (dx=x-1 & dy=y+2) or (dx=x-1 & dy=y-2) or
                         (dx=x+2 & dy=y+1) or (dx=x+2 & dy=y-1) or
                         (dx=x-2 & dy=y+1) or (dx=x-2 & dy=y-1) };
VARIABLES board, i, j
INVARIANT   board <: (1..n) * (1..n) & i:1..n & j:1..n
           /* just the typing: board : INTEGER<->INTEGER & i:INTEGER & j:INTEGER */
INITIALISATION
  board,i,j := {(1,1)},1,1
OPERATIONS
  Move(x,y) = PRE (x,y):KMOVES(i,j) & x:1..n & y:1..n & (x,y) /: board THEN
    i,j := x,y ||
    board := board \/ {(x,y)}
  END
END