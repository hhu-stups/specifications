MACHINE Puzzle3
DEFINITIONS
  INV == (board: ((1..dim)*(1..dim)) -->> 0..nmax);
  GOAL2 == !(i,j).(i:1..dim & j:1..dim => board(i|->j) = (j+(i-1)*dim) mod dim*dim);
  PLACED(i,j) == (board(i|->j) = j-1+(i-1)*dim);
  GOAL == !(i,j).(i:1..dim & j:1..dim => PLACED(i,j));
  ANIMATION_FUNCTION == ( {r,c,i|r:1..dim & c:1..dim & i=0} <+ 
                              board
                              );
      ANIMATION_IMG0 == "images/sm_empty_box.gif";
      ANIMATION_IMG1 == "images/sm_1.gif";
      ANIMATION_IMG2 == "images/sm_2.gif";
      ANIMATION_IMG3 == "images/sm_3.gif";
 HEURISTIC_FUNCTION == SIGMA(i,j).(i:1..dim & j:1..dim & not(PLACED(i,j))|1)
CONSTANTS dim, nmax
PROPERTIES
 dim:NATURAL1 &  dim=2 &
 nmax:NATURAL1 & nmax = dim*dim-1
VARIABLES board
INVARIANT
 INV
INITIALISATION 
  board : (INV & GOAL)
OPERATIONS
  MoveDown(i,j,x) = PRE i:2..dim & j:1..dim & board(i|->j) = 0 & x:1..nmax & board(i-1|->j) = x  THEN
     board := board <+ {(i|->j)|->x, (i-1|->j)|->0}
  END;
  MoveUp(i,j,x) = PRE i:1..dim-1 & j:1..dim & board(i|->j) = 0 & x:1..nmax & board(i+1|->j) = x  THEN
     board := board <+ {(i|->j)|->x, (i+1|->j)|->0}
  END;
  MoveRight(i,j,x) = PRE i:1..dim & j:2..dim & board(i|->j) = 0 & x:1..nmax & board(i|->j-1) = x  THEN
     board := board <+ {(i|->j)|->x, (i|->j-1)|->0}
  END;
  MoveLeft(i,j,x) = PRE i:1..dim & j:1..dim-1 & board(i|->j) = 0 & x:1..nmax & board(i|->j+1) = x  THEN
     board := board <+ {(i|->j)|->x, (i|->j+1)|->0}
  END;
  r <-- HF = BEGIN r:= HEURISTIC_FUNCTION END
END

