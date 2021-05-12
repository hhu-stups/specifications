MACHINE RandomWalk
 // Test Performance of Animation Function for large grids
DEFINITIONS
   ANIMATION_IMG10 == "blank_square.gif";
   ANIMATION_IMG11 == "free_square.gif";
   ANIMATION_IMG12 == "occupied_square.gif";
   ANIMATION_IMG13 == "gray_dot.gif";
   SZ == 30;
   ANIMATION_FUNCTION1 == (-SZ..SZ)*(-SZ..SZ)*{10};
   ANIMATION_FUNCTION2 == hist*{13};
   ANIMATION_FUNCTION3 == {(x,y,12)};
VARIABLES
  x,y, hist
INVARIANT
  x:INTEGER & y:INTEGER &
  hist : POW(INTEGER*INTEGER)
INITIALISATION
  x,y := 0,0 || hist := {}
OPERATIONS
  Move(nx,ny) = PRE (x=nx or y=ny) & nx:{x-1,x,x+1} & ny:{y-1,y,y+1} THEN
     x,y := nx,ny || hist := hist \/ {x|->y}
  END
END