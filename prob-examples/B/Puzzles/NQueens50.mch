MACHINE NQueens50
CONSTANTS n,queens
PROPERTIES
 n = 50 & /* Takes 3.25 seconds on 3.06 GHz MacBook Pro with ProB 1.3.2; 0.98 (first load) - 1.14 (second load) with ProB 1.3.3 */
 queens : 1..n >-> 1..n /* for each column the row in which the queen is in */
 &
 !(q1,q2).(q1:1..n & q2:2..n & q2>q1
    => queens(q1)+q2-q1 /= queens(q2) & queens(q1)-q2+q1 /= queens(q2))
DEFINITIONS
      ANIMATION_FUNCTION_DEFAULT == ( {r,c,i|r:1..n & c:1..n & i=(r+c) mod 2 }  );
      ANIMATION_FUNCTION == ( {r,c,i|c:1..n & r=queens(c) & i=2+((r+c) mod 2) }  );
      ANIMATION_IMG0 == "images/sm_empty_box.gif";
      ANIMATION_IMG1 == "images/sm_gray_box.gif";
      ANIMATION_IMG2 == "images/sm_queen_white.gif";
      ANIMATION_IMG3 == "images/sm_queen_black.gif";
      SET_PREF_TIME_OUT == 6000; 
      SET_PREF_CLPFD == TRUE;
      SET_PREF_MAX_INITIALISATIONS == 3
OPERATIONS
  r<--Get(yy) = PRE yy:1..n THEN r:= queens(yy) END
END

