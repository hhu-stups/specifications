MACHINE TicTacToe_ErrOp
SETS
NC = {O,X,empty};
Pos;
RowCol
CONSTANTS middle
PROPERTIES
middle:Pos & card(Pos) = 3 & card(RowCol)=2
VARIABLES turn, board
INVARIANT
 turn : {O,X} &
 board : RowCol --> Pos --> Pos --> NC
INITIALISATION board := RowCol * Pos * Pos * {empty}
OPERATIONS
 Put(nc,rc,r,c) = PRE turn=nc & board(rc)(r)(c) = empty THEN
    board(rc)(r)(c) := nc || turn :: NC - {turn,empty}
 END
END
