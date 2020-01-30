MACHINE TicTacToe_Sym_Total
/* not yet finished; representing board as total function */
SETS
 NC = {O,X,empty};
 Pos;
 RowCol
DEFINITIONS
  win_vert_horiz(ox) == #(rc,r).(rc:RowCol & r:Pos & !c.(c:Pos => board(rc,r,c)=ox));
  GOAL == win_vert_horiz(X)
CONSTANTS middle
PROPERTIES
 middle:Pos & card(Pos) = 3 & card(RowCol)=2
VARIABLES turn, board
INVARIANT
  turn : {O,X} &
  board : RowCol * Pos * Pos --> NC
INITIALISATION board := (RowCol * Pos * Pos) * {empty} || turn := X
OPERATIONS
  Put(nc,rc,rc2,r,c) = PRE turn=nc & board(rc,r,c) = empty & rc2 /= rc THEN
     board := board <+ { (rc,r,c) |-> nc, (rc2,c,r) |-> nc } ||
     turn :: NC - {turn,empty} 
  END
END

