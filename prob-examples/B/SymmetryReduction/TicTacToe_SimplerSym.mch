MACHINE TicTacToe_SimplerSym
/* Purpose: can we write a B model so that all/most symmetries of Tic-Tac-Toe
   are symmetries on deferred sets ??  */
/* Rows can be swapped by symmetry in this model; similarly Columns; but
   not rows against columns */
/*
 AnimationFunction only works properly without symmetry and if middleR=Rows2,middleC=Cols2 is chosen
*/
/* flood: 1450 nodes (correct?: 2*765 + 2  + 18 (= 2*9) ??) (14.6 seconds);
   hash 1450 nodes (15.0 seconds);
   nauty: 1450 nodes (17.7 seconds)  -> time cut in half when putting all vars in the same level
   without symmetry (MAX_INITIALISATION=1): 5480 nodes (correct: 5478+2) (53.7 seconds) */

/* Space complexity: 3^9 = 19683, but includes many illegal positions,
   removing illegal positions: 5,478
   after including symmetries: 765 */
SETS
 NC = {O,X};
 Rows ; Cols /* left/top, middle, right/bottom */
DEFINITIONS
  win_vert(ox) == #(r).( r:Rows &
                          !c.(c:Cols => (r,c):dom(board) & board(r,c)=ox));
  win_horiz(ox) == #(c).( c:Cols &
                          !r.(r:Rows => (r,c):dom(board) & board(r,c)=ox));
  win_diag1(ox) == #(r1,r2,c1,c2).({r1,r2}=Rows-{middleR} & {c1,c2}=Cols-{middleC} &
                                 (r1,c1):dom(board) & board(r1,c1)=ox &
                                 (r2,c2):dom(board) & board(r2,c2)=ox &
                                 (middleR,middleC):dom(board) & board(middleR,middleC)=ox); // slow after exists partitioning
  win_diag(ox) ==  (middleR,middleC):dom(board) & board(middleR,middleC)=ox &
                           #(r1,r2,c1,c2).({r1,r2}=Rows-{middleR} & {c1,c2}=Cols-{middleC} &
                                 (r1,c1):dom(board) & board(r1,c1)=ox &
                                 (r2,c2):dom(board) & board(r2,c2)=ox); // fast
  win_diag3(ox) ==  #(r1,r2,c1,c2).({r1,r2}=Rows-{middleR} & {c1,c2}=Cols-{middleC} &
                                 (r1,c1):dom(board) & board(r1,c1)=ox &
                                 (r2,c2):dom(board) & board(r2,c2)=ox)
                                 &
                             (middleR,middleC):dom(board) & board(middleR,middleC)=ox; // slow
  win(ox) == (win_vert(ox) or win_horiz(ox) or win_diag(ox));
  GOAL == win_vert_horiz(X);
      ANIMATION_FUNCTION_DEFAULT == {r,c,i|r:Rows & c:Cols & i=3};
      ANIMATION_FUNCTION == board;
      ANIMATION_IMG1 == "images/circle.gif";
      ANIMATION_IMG2 == "images/cross.gif";
      ANIMATION_IMG3 == "images/empty_box.gif"
CONSTANTS middleR, middleC, other
PROPERTIES
 middleR:Rows & card(Rows) = 3 &
 middleC:Cols & card(Cols) = 3 &
 other = {O|->X, X|->O}
VARIABLES turn, board
INVARIANT
  turn : {O,X} &
  board : Rows * Cols +-> NC
INITIALISATION board := {} || turn := X
OPERATIONS
  Win_Vert(ox) = PRE turn = other(ox) & win_vert(ox) THEN
    skip
  END;
  Win_Horiz(ox) = PRE turn = other(ox) & win_horiz(ox) THEN
    skip
  END;
  Win_Diag(ox) = PRE turn = other(ox) & win_diag(ox) THEN
    skip
  END;
  Put(nc,r,c) = PRE turn=nc & not(win(other(nc))) &
                           (r,c) /: dom(board) THEN
     board(r,c) := turn ||
     turn := other(turn)
  END
END

