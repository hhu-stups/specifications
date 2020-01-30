MACHINE ReflectionTest
DEFINITIONS
  EXTERNAL_FUNCTION_STATE_AS_STRING == INTEGER --> STRING;
  STATE_AS_STRING(x) == "";
  EXTERNAL_PREDICATE_STATE_SUCC == INTEGER * INTEGER;
  STATE_SUCC(x,y) == (1=1);
  EXTERNAL_PREDICATE_STATE_SAT == INTEGER * STRING;
  STATE_SAT(x,y) == (1=1);
  EXTERNAL_PREDICATE_STATE_EVAL(T) == INTEGER * STRING * T;
  STATE_EVAL(x,y,v) == (1=1);
  EXTERNAL_FUNCTION_EVAL(T) == (INTEGER * STRING) --> T;
  EVAL(x,y) == 1;
  EXTERNAL_FUNCTION_HISTORY == seq(INTEGER);
  HISTORY == [];
  EXTERNAL_PREDICATE_INITIAL_STATE == INTEGER;
  INITIAL_STATE(x) == (x=0);
  EXTERNAL_FUNCTION_MACHINE_INFO == (STRING*STRING) --> STRING;
  MACHINE_INFO(machine_name,info) == ""
SETS
 ID={aa,bb}
CONSTANTS iv
PROPERTIES
 iv:ID
VARIABLES xx, pc
INVARIANT
 xx:ID & pc:NATURAL
INITIALISATION xx:=iv || pc := 0
OPERATIONS
  Set(yy) = PRE yy:ID & pc<10 THEN xx:= yy || pc := pc+1 END
END

/*
let s = {x,s| STATE_SUCC(x,s)}

>>> r=STATE_AS_STRING(x) & s[{x}] = {}
Existentially Quantified Predicate over r,x is TRUE
Solution: 
       r = "Constants:1, Vars:( xx=bb &
       pc=3 )" &
       x = 17

>>> r=STATE_AS_STRING(x) & x:s[{x}]
Existentially Quantified Predicate over r,x is FALSE

dom({r,x|STATE_EVAL(x,"pc",r) & r:INTEGER})

>>> ({r,x,y|STATE_EVAL(x,"pc",r) & r:INTEGER & STATE_SUCC(x,y) & STATE_EVAL(y,"pc",r+1)})
Expression Value = 
{((0|->2)|->4),((0|->2)|->5),((0|->3)|->14),((0|->3)|->15),((1|->4)|->6),((1|->4)|->7),((1|->5)|->6),((1|->5)|->7),((1|->14)|->16),((1|->14)|->17),((2|->6)|->8),((2|->6)|->9),((2|->7)|->8),((2|->7)|->9),((2|->17)|->18),((2|->17)|->19),((3|->8)|->10),((3|->8)|->11),((3|->9)|->10),((3|->9)|->11),((3|->19)|->20),((3|->19)|->21),((4|->10)|->12),((4|->10)|->13),((4|->11)|->12),((4|->11)|->13),((4|->21)|->22),((4|->21)|->23),((5|->12)|->30),((5|->12)|->31),((5|->23)|->24),((5|->23)|->25),((6|->25)|->26),((6|->25)|->27),((7|->27)|->28),((7|->27)|->29),((8|->29)|->32),((8|->29)|->33)}

>>> F:{"pc>22","pc>3"} & STATE_SAT(x,F) & STATE_SUCC(y,x) & not(STATE_SAT(y,F))
Existentially Quantified Predicate over F,x,y is TRUE
Solution: 
       F = "pc>3" &
       x = 12 &
       y = 8

>>> fpc = %x.(x:INTEGER|EVAL(x,"pc*pc")) & fpc : INTEGER +-> INTEGER & map = (tail(HISTORY) ; fpc)
Existentially Quantified Predicate over fpc,map is TRUE
Solution: 
       fpc = %x.(x : INTEGER|EVAL EXT: (x,"pc*pc")) &
       map = {(1|->0),(2|->1),(3|->4),(4|->9),(5|->16)}


>>> {x|x:INTEGER & #sid.(EVAL(sid,"pc")=x)}
Expression Value = 
{0,1,2,3,4,5}

>>> EVAL(sid,"pc")>3 & desc = STATE_AS_STRING(sid)
Existentially Quantified Predicate over sid,desc is TRUE
Solution: 
       sid = 9 &
       desc = "Constants:0, Vars:( xx=aa &
       pc=4 )"

>>> let fpc2 = {x,r|r:INTEGER & EVAL(x,"pc*pc")=r}
Expression Value = 
{x,r|(x : INTEGER & r : INTEGER) & EVAL EXT: (x,"pc*pc") = r}
>>> (tail(HISTORY) ; fpc)
Expression Value = 
{(1|->0),(2|->1),(3|->4),(4|->9),(5|->16)}
>>> :show
Nr        prj1      prj2      
1         1         0         
2         2         1         
3         3         4         
4         4         9         
5         5         16     

*/