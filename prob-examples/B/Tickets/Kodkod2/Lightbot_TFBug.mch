MACHINE Lightbot_TFBug
SETS INSTR = {turn_left,turn_right,move,light,gosub,return,stop}
CONSTANTS mx,my, blocked   ,mxpc, subpc, PRG
PROPERTIES
 mx = 4 & my=4 &
 blocked = { (2,1), (3,1), (2,2),(3,2) }

 & mxpc = 11
 & PRG : 1..mxpc --> INSTR
 & subpc : 2..mxpc
 & PRG(mxpc) = stop
ASSERTIONS
 PRG(mxpc) = stop
END

