MACHINE Labyrinth
DEFINITIONS
 ANIMATION_IMG0 == "images/sm_wall_none_box.gif";
 ANIMATION_IMG1 == "images/sm_wall_bot_box.gif";
 ANIMATION_IMG2 == "images/sm_wall_right_box.gif";
 ANIMATION_IMG3 == "images/sm_wall_bot_right_box.gif";
      ANIMATION_FUNCTION_DEFAULT == ( {r,c,i|r:1..n & c:1..m & i=0 }  );
      ANIMATION_FUNCTION == ( {r,c,i| r|->c/:go_down & r|->c :  go_right & i=1 } \/ 
                              {r,c,i| r|->c: go_down & r|->c /: go_right & i=2 } \/
                              {r,c,i| r|->c: SQRS & r|->c/:go_down & r|->c /: go_right & i=3 } );
 SQRS == (1..n)*(1..m);  /* row, column */
 GOAL == (x=m & y=n)
CONSTANTS n, m, go_right, go_down
PROPERTIES
 go_right <: (1..n)*(1..(m-1)) &
 go_down <: (1..(n-1))*(1..m) &

 n=4 & /* rows */
 m=6 & /* columns */
 go_right = { (1,1), (1,2), (1,4), (1,5), (2,1), (2,2), (2,4),(3,1), (3,2), (3,5), (4,1), (4,2),(4,3), (4,5) } &
 go_down  = { (1,1), (1,5), (1,6),(2,3), (2,4), (2,6), (3,1), (3,4),(3,5) }
VARIABLES x,y
INVARIANT
 x: 1..m & y:1..n
INITIALISATION x,y := 1,1
OPERATIONS
  GoRight = PRE (y,x) : go_right THEN x := x+1 END;
  GoLeft = PRE (y,x-1) : go_right THEN x := x-1 END;
  GoDown = PRE (y,x) : go_down THEN y := y+1 END;
  GoUp = PRE (y-1,x) : go_down THEN y := y-1 END
END

