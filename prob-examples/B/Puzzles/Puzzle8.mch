MACHINE Puzzle8
DEFINITIONS
  INV == (board: ((1..dim)*(1..dim)) -->> 0..nmax);
  GOAL2 == !(i,j).(i:1..dim & j:1..dim => board(i|->j) = (j+(i-1)*dim) mod dim*dim);
  GOAL == !(i,j).(i:1..dim & j:1..dim => board(i|->j) = j-1+(i-1)*dim);
  ANIMATION_FUNCTION == ( {r,c,i|r:1..dim & c:1..dim & i=0} <+
                              board
                              );
      ANIMATION_IMG0 == "images/sm_empty_box.gif";
      ANIMATION_IMG1 == "images/sm_1.gif";
      ANIMATION_IMG2 == "images/sm_2.gif";
      ANIMATION_IMG3 == "images/sm_3.gif";
      ANIMATION_IMG4 == "images/sm_4.gif";
      ANIMATION_IMG5 == "images/sm_5.gif";
      ANIMATION_IMG6 == "images/sm_6.gif";
      ANIMATION_IMG7 == "images/sm_7.gif";
      ANIMATION_IMG8 == "images/sm_8.gif";
      ANIMATION_IMG9 == "images/sm_9.gif";
      ANIMATION_RIGHT_CLICK(J,I) ==
                ANY piece WHERE piece:1..nmax THEN
                CHOICE MoveUp(I,J,piece) OR MoveLeft(I,J,piece) OR
                       MoveDown(I,J,piece) OR MoveRight(I,J,piece)
                END
                END;
      ANIMATION_CLICK(J,I,J2,I2) == ANY piece WHERE piece:1..nmax THEN
                 IF J2>J THEN
                  MoveRight(I2,J2,piece)
                 ELSIF J2<J THEN
                  MoveLeft(I2,J2,piece)
                 ELSIF I2<I THEN
                  MoveUp(I2,J2,piece)
                 ELSIF I2>I THEN
                  MoveDown(I2,J2,piece)
                 END
                END
CONSTANTS dim, nmax
PROPERTIES
 dim:NATURAL1 &  dim=3 &
 nmax:NATURAL1 & nmax = dim*dim-1
VARIABLES board
INVARIANT
 INV
INITIALISATION
  board : (INV & GOAL)
OPERATIONS
  mi,mx <-- GridR = BEGIN mi := min(dom(dom(ANIMATION_FUNCTION))) || mx := max(dom(dom(ANIMATION_FUNCTION))) END;     mi,mx <-- GridC = BEGIN mi := min(ran(dom(ANIMATION_FUNCTION))) || mx := max(ran(dom(ANIMATION_FUNCTION))) END;
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
  Goal2(i,j) = PRE i:1..dim & j:1..dim & board(i|->j) = (j+(i-1)*dim) mod dim*dim THEN skip END
END

