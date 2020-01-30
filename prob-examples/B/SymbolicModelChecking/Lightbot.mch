MACHINE Lightbot
/* Model of Lightbot Robot Puzzle
   Michael Leuschel, Dec. 2014 */
/* TO DO: use refinement: high-level model no program,
   then try and replay abstract counter example Move,Move,Move,Light,Turn,.... 
   at lower level with program where GoSub, Return are skip events
  cbc_sequence finds solution (without gosub) immediately (15 step sequence):
Move;Move;Move;Turn_Right;Light;Move;Move;Move;Turn_Right;Light;Move;Move;Move;Turn_Right;Light
  BMC finds solution using to_light = {4,1}
  
  cbc sequence also finds solution in 40 ms for sequence:
GoSub;Move;Move;Move;Turn_Right,Light;Return;GoSub;Move;Move;Move;Turn_Right,Light;Return;GoSub;Move;Move;Move;Turn_Right,Light
 here max_pc of 10 should be sufficient (if we don't require proper stopping)
*/
SETS INSTR = {turn_left,turn_right,move,light,gosub,return,stop}
DEFINITIONS
 GOAL == (to_light = {} /* & PRG(pc)=stop */);
 ANIMATION_FUNCTION1 == {r,c,i| r:1..my & c:1..mx & i=" "};
 ANIMATION_FUNCTION2 == {r,c,i| (c,r):blocked & i="#"};
 ANIMATION_FUNCTION3 == {r,c,i| (c,r):to_light & i="O"} <+ {(y,x) |-> "R"}
CONSTANTS mx,my, blocked   ,mxpc, subpc, PRG
PROPERTIES
 mx = 4 & my=4 &
 blocked = { (2,1), (3,1), (2,2),(3,2) }

 & mxpc = 11
 & PRG : 1..mxpc --> INSTR
 & subpc : 2..mxpc
 & PRG(mxpc) = stop
VARIABLES x,y, dx,dy, to_light,
          pc, return_addr
INVARIANT
  x:1..mx & y:1..my & dx:-1..1 & dy:-1..1 & to_light <: (1..mx)*(1..my)
  & pc : 1..mxpc & return_addr : 1..mxpc
  & not(GOAL) /* for BMC */
INITIALISATION x,y  := 1,1 ||  dx,dy := 0,1 || to_light := {(4,1),(4,4),(1,4)} 
               || pc := 1 || return_addr := mxpc
OPERATIONS
  Move = SELECT x+dx:1..mx & y+dy : 1..my & not((x+dx)|->(y+dy) : blocked) 
             &  PRG(pc) = move
         THEN     x := x+dx || y := y+dy || pc := pc+1
    END;
  Turn_Left = SELECT PRG(pc)=turn_left THEN dx,dy := -dy,dx || pc:= pc+1 END;
  Turn_Right = SELECT PRG(pc)=turn_right THEN dx,dy := dy,-dx || pc:= pc+1 END;
  Light = SELECT PRG(pc)=light THEN to_light := to_light \ {(x,y)} || pc := pc+1 END;
  GoSub = SELECT PRG(pc) = gosub THEN  return_addr := pc+1 || pc := subpc END;
  Return =  SELECT PRG(pc) = return THEN pc := return_addr || return_addr := mxpc END;
  Stop = SELECT PRG(pc) = stop THEN skip END
END

