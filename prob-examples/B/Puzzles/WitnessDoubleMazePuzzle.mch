MACHINE WitnessDoubleMazePuzzle
// encoding of a symmetric maze puzzle from The Witness
SETS
 Snakes = {yell,blue}
DEFINITIONS SET_PREF_MAXINT == 7;
  EXIT == (posx(blue),posy(blue)) : { (1,DIM), (DIM,1) };
  COVER == (((3,2),yell):occupied & ((2,DIM),yell):occupied & ((5,4),blue):occupied &
            (4,3):dom(occupied)
 // TO DO: still missing three black points between vertices
           );
  GOAL == (EXIT & COVER);
  ANIMATION_IMG0 == "images/sm_empty_box.gif";
  ANIMATION_IMG1 == "images/sm_O_blue.gif";
  ANIMATION_IMG2 == "images/sm_O_yellow.gif";
  ANIMATION_FUNCTION_DEFAULT == {r,c,i| r:1..DIM & c:1..DIM & i=0};
  ANIMATION_FUNCTION1 == {r,c,i| (r,c):dom(occupied) & occupied(r,c)=blue & i=1};
  ANIMATION_FUNCTION2 == {r,c,i| (r,c):dom(occupied) & occupied(r,c)=yell & i=2}
CONSTANTS DIM
PROPERTIES
 DIM = 6
VARIABLES posx,posy, occupied
INVARIANT
  posx : Snakes --> (1..DIM) &
  posy : Snakes --> (1..DIM) &
  occupied : (1..DIM)*(1..DIM) +-> Snakes
INITIALISATION
  posx := {blue |-> 1, yell |-> DIM} ||
  posy := {blue |-> 1, yell |-> DIM} ||
  occupied := {(1,1)|->blue, (DIM,DIM)|->yell}
OPERATIONS
  Move(dx,dy,px,py) = PRE dx:-1..1 & dy:-1..1 & (dx=0 or dy=0) & (dx /= 0 or dy /= 0)
            & px = posx(blue)+dx
            & py = posy(blue)+dy
            & px : 1..DIM & posx(yell)-dx : 1..DIM
            & py : 1..DIM & posy(yell)-dy : 1..DIM
            &  (px,py) /: dom(occupied)
            &  (posx(yell)-dx,posy(yell)-dy) /: dom(occupied)
            &  (px,py) /= (posx(yell)-dx,posy(yell)-dy)
     THEN
      posx :=  {blue|->px, yell|->posx(yell)-dx} ||
      posy :=  {blue|->py, yell|->posy(yell)-dy} ||
      occupied := occupied \/ { (px,py)|->blue, (posx(yell)-dx,posy(yell)-dy)|->yell }
  END;
  Exit = PRE EXIT THEN skip END
END

