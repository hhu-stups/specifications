MACHINE TicTacToe_Sym
/* Purpose: can we write a B model so that all/most symmetries of Tic-Tac-Toe ??

  hash symmetry : 1401 nodes, 78.3 secs ;
  wo symmetry: 5480 nodes (MAX_INIT=22); 288.8 seconds
  nauty symmetry is very slow (even slower when total function for board used)
  flooding works, 77.6 secs 1461 nodes + 4019 permutations nodes (which seems ok;
   not all TicTacToe symmetries are symmetries in our B model:
  - (rc,p1,p2) and (rc,p1,p1) with p1 and p2 different from middle are symmetric
    (X put into corner)
   but not detected as symmetric by our method as they could be distinguished
 - also: Rows/Cols have to be permuted in synchrony; it would be better to have 
   two deferred sets, as in TicTacToe_SimplerSym.mch
*/

/* Space complexity: 3^9 = 19683, but includes many illegal positions,
   removing illegal positions: 5,478
   after including symmetries: 765 */
SETS
 NC = {O,X};
 Pos; /* left/top, middle, right/bottom */
 RowCol /* indicates in which order the coordinates come, row first or col first */
DEFINITIONS
  win_vert_horiz(ox) == #(rc,r).(rc:RowCol & r:Pos & 
                          !c.(c:Pos => (rc,r,c):dom(board) & board(rc,r,c)=ox));
  win_diag1(ox) == #(rc).(rc:RowCol & !c.(c:Pos => (rc,c,c):dom(board) & board(rc,c,c)=ox));
  win_diag2(ox) == #(rc,p1,p2).(rc:RowCol & p1:Pos & p2:Pos & {p1,p2} = Pos-{middle} &
                                 (rc,p1,p2):dom(board) & board(rc,p1,p2)=ox &
                                 (rc,p2,p1):dom(board) & board(rc,p2,p1)=ox &
                           (rc,middle,middle):dom(board) & board(rc,middle,middle)=ox);
  win(ox) == (win_vert_horiz(ox) or win_diag1(ox) or win_diag2(ox));
  GOAL == win_vert_horiz(X);
     /* ANIMATION_FUNCTION == {r,c,i|r:Pos & c:Pos & #rc.(rc:RowCol & i:NC & (rc,r,c)|->i:board)};
      ANIMATION_FUNCTION_DEFAULT == {r,c,i|r:Pos & c:Pos & i=3};
      ANIMATION_IMG1 == "images/circle.gif";
      ANIMATION_IMG2 == "images/cross.gif";
      ANIMATION_IMG3 == "images/empty_box.gif" */
CONSTANTS middle, other
PROPERTIES
 middle:Pos & card(Pos) = 3 & card(RowCol)=2 &
 other = {O|->X, X|->O}
VARIABLES turn, board
INVARIANT
  turn : {O,X} &
  board : RowCol * Pos * Pos +-> NC &
  !(rc,r,c).((rc,r,c):dom(board) & board(rc,r,c)=O => #rc2.(rc2:RowCol & rc2 /= rc & board(rc2,c,r)=O)) &
  !(rc,r,c).((rc,r,c):dom(board) & board(rc,r,c)=X => #rc2.(rc2:RowCol & rc2 /= rc & board(rc2,c,r)=X))
INITIALISATION board := {} || turn := X
OPERATIONS
 /* Line(rc,r,ox) = PRE rc:RowCol & r:Pos & ox:{O,X} & !c.(c:Pos => (rc,r,c):dom(board) & board(rc,r,c)=ox) THEN
     skip
  END; */
  Win(ox) = PRE turn = other(ox) & win(ox) THEN
    skip
  END;
  Put(nc,rc,rc2,r,c) = PRE turn=nc & not(win(other(nc))) &
                           (rc,r,c) /: dom(board) & rc2 /= rc THEN
     board := board <+ { (rc,r,c) |-> nc, (rc2,c,r) |-> nc } ||
     turn := other(turn) 
  END
END

