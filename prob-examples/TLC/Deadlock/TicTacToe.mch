MACHINE TicTacToe
SETS
  NC = {O,X};
  Pos;
  RowCol
CONSTANTS middle
PROPERTIES
  middle:Pos & card(Pos) = 3 & card(RowCol)=2
VARIABLES turn, board
INVARIANT
   turn : NC &
   board : (Pos * Pos) +-> NC
INITIALISATION board := {} || turn := X
OPERATIONS
   Put(nc,x,y) = PRE turn=nc & (x |-> y) /: dom(board) THEN
      board(x,y) := nc || turn :: NC-{turn}
   END;
   Win(nc) =
     PRE nc : NC
       & (   #row.(row:Pos & !col.(col:Pos => ( (row |-> col) |-> nc ) : board))
          or #col.(col:Pos & !row.(row:Pos => ( (row |-> col) |-> nc ) : board))
          or (   (middle|->middle) |-> nc) : board
               & #(a,b).( a /= middle & b /= middle & a/=b
                        & ((a|->b) |-> nc):board
                        & ((b|->a) |-> nc):board) )
     THEN skip END
END