MACHINE LightbotAbstract
/* Model of Lightbot Robot Puzzle
   Michael Leuschel, Dec. 2014 */
/* Abstract Model without Robot Program
*/
DEFINITIONS
 GOAL == (to_light = {} /* & PRG(pc)=stop */);
 ANIMATION_FUNCTION1 == {r,c,i| r:1..my & c:1..mx & i=" "};
 ANIMATION_FUNCTION2 == {r,c,i| (c,r):blocked & i="#"};
 ANIMATION_FUNCTION3 == {r,c,i| (c,r):to_light & i="O"} <+ {(y,x) |-> "R"}
CONSTANTS mx,my, blocked  
PROPERTIES
 mx = 4 & my=4 &
 blocked = { (2,1), (3,1), (2,2),(3,2) }

VARIABLES x,y, dx,dy, to_light
INVARIANT
  x:1..mx & y:1..my & dx:-1..1 & dy:-1..1 & to_light <: (1..mx)*(1..my)
  & not(GOAL) /* for BMC */
INITIALISATION x,y  := 1,1 ||  dx,dy := 0,1 || to_light := {(4,1),(4,4),(1,4)} 
OPERATIONS
  Move = SELECT x+dx:1..mx & y+dy : 1..my & not((x+dx)|->(y+dy) : blocked) 
         THEN     x := x+dx || y := y+dy 
    END;
  Turn_Left = BEGIN dx,dy := -dy,dx END;
  Turn_Right = BEGIN dx,dy := dy,-dx END;
  Light = BEGIN to_light := to_light \ {(x,y)} END;
  GoSub = skip;
  Return =  skip;
  Stop = skip 
END

