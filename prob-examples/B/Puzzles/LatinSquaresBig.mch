MACHINE LatinSquaresBig
DEFINITIONS
  IDX == (1..Order);
   ANIMATION_FUNCTION == ( {r,c,i|r:1..Order & c:1..Order & i=0} <+ 
                              LatinSquare
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
      ANIMATION_IMG9 == "images/sm_9.gif"
CONSTANTS Order
PROPERTIES
 Order:NATURAL1 & Order:3..6
VARIABLES LatinSquare, StartSolve
INVARIANT
 LatinSquare: (IDX * IDX) +-> IDX & StartSolve:BOOL
INITIALISATION LatinSquare,StartSolve := {},FALSE
OPERATIONS
  Set(i,j,val) = PRE i:IDX & j:IDX & val:IDX & (i|->j) /: dom(LatinSquare) THEN LatinSquare(i,j) := val END;
  StartSolving = BEGIN StartSolve := TRUE END;
  Solve = PRE StartSolve=TRUE THEN
            ANY sol WHERE sol: (IDX*IDX) --> IDX &
                !(i,j).(i:IDX & j:IDX & (i|->j):dom(LatinSquare) => sol(i,j) = LatinSquare(i,j)) &
                !(i,j1,j2).(i:IDX & j1:IDX & j2:IDX & j1 > j2
                          =>  ( sol(i,j1) /= sol(i,j2) & sol(j1,i) /= sol(j2,i)) ) THEN
               LatinSquare := sol
            END
  END
END

