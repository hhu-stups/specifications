MACHINE DiceMovementPuzzle
/* start with the dice up with 1 in upper-left corner and then move to lower-right corner
   and finish with dice with 1 on top */
CONSTANTS maxx,maxy
PROPERTIES maxx = 10 & maxy = 7 
DEFINITIONS GOAL == (x=maxx & y=maxy & dice_top = 1);
     ANIMATION_FUNCTION_DEFAULT == {r,c,i|r:1..maxy & c:1..maxx & i=0};
     ANIMATION_FUNCTION == ( {(y,x,dice_top), 
                              (-3,2,dice_up),
            (-2,2,dice_top),(-2,1,dice_left),(-2,3,dice_right),
                              (-1,2,dice_down)} \/ hist );
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
VARIABLES x,y,  dice_top, dice_bot, dice_left, dice_right, dice_up, dice_down
 , hist
INVARIANT
 x:NATURAL & y:NATURAL &
 {dice_top, dice_bot, dice_left, dice_right, dice_up, dice_down} = 1..6
 & hist : ((1..maxy)*(1..maxx)) +-> 1..6
INITIALISATION
   x,y := 1,1 ||
   /* we hard code one specific initial configuration; but in principle any position with 1 on top is allowed */
   dice_top, dice_bot, dice_left, dice_right, dice_up, dice_down := 1,6,2,5,4,3
  || hist := {}
OPERATIONS
  MoveRight = SELECT x<maxx THEN
    x := x+1 ||
    dice_left,dice_top,dice_right,dice_bot := dice_bot,dice_left,dice_top,dice_right
   || hist(y,x) := dice_top
  END;
  MoveDown = SELECT y<maxy THEN
    y := y+1 ||
    dice_up,dice_top,dice_down,dice_bot := dice_bot,dice_up,dice_top,dice_down
   || hist(y,x) := dice_top

  END
END

