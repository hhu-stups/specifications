MACHINE QueensWithEvents
// a version of the N-queens model with events to pre-fill the chessboard by hand
CONSTANTS n
PROPERTIES
 n : NATURAL &
 n < 120
DEFINITIONS
      ANIMATION_FUNCTION_DEFAULT == ( {r,c,i|r:1..n & c:1..n & i=(r+c) mod 2 }  );
      ANIMATION_FUNCTION == ( {r,c,i|c:1..n & c|->r:queens & i=2+((r+c) mod 2) }  );
      ANIMATION_FUNCTION1 == ( {r,c,i|c:1..n & r:1..n & c|->r/:queens & pos_is_attacked(c,r) & i=13+((r+c) mod 2) }  );
      ANIMATION_FUNCTION2 == ( {r,c,i|c:1..n & c|->r:queens & is_attacked(c) & i=10 }  );
      ANIMATION_IMG0 == "Queens/ChessPieces/Chess_emptyl45.gif";
      ANIMATION_IMG1 == "Queens/ChessPieces/Chess_emptyd45.gif";
      ANIMATION_IMG2 == "Queens/ChessPieces/Chess_qll45.gif";
      ANIMATION_IMG3 == "Queens/ChessPieces/Chess_qld45.gif";
      ANIMATION_IMG10 == "Queens/ChessPieces/Chess_qrt45.gif"; // Red queen
      ANIMATION_IMG11 == "Queens/ChessPieces/Chess_emptyg45.gif"; // green square
      ANIMATION_IMG12 == "Queens/ChessPieces/Chess_emptyXg45.gif"; // green square with X
      ANIMATION_IMG13 == "Queens/ChessPieces/Chess_emptyDOTl45.gif"; // white square with dot
      ANIMATION_IMG14 == "Queens/ChessPieces/Chess_emptyDOTd45.gif"; // black square with dot
      SET_PREF_TIME_OUT == 6000;
      SET_PREF_CLPFD == TRUE;
      SET_PREF_MAX_INITIALISATIONS == 120;
      SET_PREF_MAX_OPERATIONS == 10;
      MAX_OPERATIONS_SetQueen == 1000;
      MAX_OPERATIONS_ChangeQueen == 1000;
      MAX_OPERATIONS_SolveAny == 4;
      //SET_PREF_RANDOMISE_ENUMERATION_ORDER == TRUE;
      ANIMATION_RIGHT_CLICK(I,J) == CHOICE SetQueen(I,J) OR ChangeQueen(I,J) OR Solve OR SolveFuzzy END;
      ANIMATION_CLICK(I,J,tocol,torow) == CHOICE SetQueen(I,J) OR ChangeQueen(I,J) END;

      is_attacked(q1) == q1:dom(queens) &
                         #q2.(q2:dom(queens) & q2 /= q1 &
                              (no_attack(q1,q2,queens) => queens(q1) = queens(q2)));
      pos_is_attacked(q1,q1row) ==
                         #q2.(q2:dom(queens) & q2 /= q1 &
                              (no_attack_pos(q1,q1row,q2,queens(q2)) => q1row = queens(q2)));
      no_attack(q1,q2,board) == no_attack_pos(q1,board(q1),q2,board(q2));
      no_attack_pos(q1,q1row,q2,q2row) == (q1row+q2-q1 /= q2row & q1row-q2+q1 /= q2row);
      Solution(board) == (
         board :  perm(1..n) /* for each column the row in which the queen is in */
         &
         !(q1,q2).(q1:1..n & q2:2..n & q2>q1 => no_attack(q1,q2,board) )
        )
VARIABLES queens
INVARIANT
  queens : (1..n) +-> (1..n)
INITIALISATION
  queens := {}
OPERATIONS
  Solve = ANY solution WHERE
      Solution(solution) &
      !x.(x:dom(queens) => solution(x)=queens(x))
  THEN
     queens := solution
  END;
  SolveFuzzy = ANY solution WHERE
      Solution(solution) &
      !x.(x:dom(queens) => solution(x):{queens(x)-1,queens(x),queens(x)+1})
  THEN
     queens := solution
  END;
  SetQueen(i,j) = SELECT i:1..n & j:1..n & i /: dom(queens) THEN
     queens(i) := j
  END;
  ChangeQueen(i,j) = SELECT i:1..n & j:1..n & i : dom(queens) & j /= queens(i) THEN
     queens(i) := j
  END;
  r<--Get(yy) = PRE yy:dom(queens) THEN r:= queens(yy) END
END

