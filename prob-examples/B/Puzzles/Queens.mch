MACHINE Queens
CONSTANTS M
PROPERTIES
 M=5
DEFINITIONS
  ANIMATION_FUNCTION == {r,c,i|r:1..M & c:1..M & i=board(r,c) };
      ANIMATION_IMG0 == "images/sm_empty_box.gif";
      ANIMATION_IMG1 == "images/sm_queen_white.gif";
  IDX == (1..M);
  BOARD == (IDX * IDX) --> BOOL;
VARIABLES board
INVARIANT
 board : BOARD
INITIALISATION board := (IDX * IDX) * {FALSE}
OPERATIONS
  SetQueen(i,j) = PRE i:IDX& j:IDX & !j2.(j2:IDX => board(i,j2) = FALSE) THEN
    board(i,j) := TRUE
  END;
 /* Solve did time out if M>3  */
  Solve(sol) = PRE sol:BOARD & 
                   /* !(i,j).(i:IDX & j:IDX & board(i,j)=TRUE => sol(i,j)=TRUE) & */
                   !pair.(pair:board~[{TRUE}] => sol(pair)=TRUE) &

                   !(i,j).(i|->j:(IDX*IDX) & /* following does not work efficiently yet: i:IDX & j:IDX & */                   sol(i,j)=TRUE
                         => !j2.(j2:IDX & j2>j => sol(i,j2)=FALSE) & /* vertical */
                            !i2.(i2:IDX & i2>i => sol(i2,j)=FALSE) & /* horizontal */
                            !i2.(i2:IDX & i2>i & j>(i2-i) => sol(i2,j-i2+i)=FALSE) & /* diag 1 */
                            !i2.(i2:IDX & i2>i & j+i2-i<=M => sol(i2,j+i2-i)=FALSE) /* diag 2 */
                          ) 
               THEN
    board := sol
  END
END

