MACHINE NQueens_Completion
CONSTANTS n
PROPERTIES
 n = 8
DEFINITIONS
      ANIMATION_FUNCTION_DEFAULT == ( {r,c,i|r:1..n & c:1..n & i=(r+c) mod 2 }  );
      ANIMATION_FUNCTION == ( {r,c,i|c:1..n & r=board(c) & i=2+((r+c) mod 2) }  );
      ANIMATION_IMG0 == "images/sm_empty_box.gif";
      ANIMATION_IMG1 == "images/sm_gray_box.gif";
      ANIMATION_IMG2 == "images/sm_queen_white.gif";
      ANIMATION_IMG3 == "images/sm_queen_black.gif";
      SET_PREF_MAX_INITIALISATIONS == 10;
      SET_PREF_MAX_OPERATIONS == 10;
VARIABLES board
INVARIANT board : 1..n +-> 1..n
INITIALISATION board := {}
OPERATIONS
  SetCompletionProblem1 = /* problem from Gent, Jeffeson, Nightingale paper */
     board := {2|->5, 4|->4};
  Solve(queens) = SELECT
     queens : perm(1..n) /* for each column the row in which the queen is in */ &
     !(q1,q2).(q1:1..n & q2:2..n & q2>q1
         => queens(q1)+(q2-q1) /= queens(q2) & queens(q1)+(q1-q2) /= queens(q2)) &
     !(q0).(q0:dom(board) => queens(q0)=board(q0)) THEN
     board := queens
  END
END


