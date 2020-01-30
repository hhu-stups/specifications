MACHINE maze1
DEFINITIONS GOAL == (x=5 & y=5)
VARIABLES x,y
INVARIANT
 x:INTEGER & y:INTEGER
INITIALISATION x,y := 0,0
OPERATIONS
  IncX = x:=x+1;
  IncY = y:=y+1
END

/*
;
      ANIMATION_FUNCTION_DEFAULT == {r,c,i|r:0..10 & c:0..6 & i=0};
      ANIMATION_FUNCTION == ( {x|->y|->1});
      ANIMATION_IMG0 == "images/sm_empty_box.gif";
      ANIMATION_IMG1 == "images/sm_bullet_box.gif";
*/
