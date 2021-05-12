MACHINE NQueens
CONSTANTS n,queens
PROPERTIES
 n = 14 & /* ProB takes about 0.09 seconds (0.03 with 1.3.3) for first solution for n=14;
              1.27 seconds for n=18, 6.4 seconds for n=20 (0.08 with 1.3.3)
             (with MAX_INITIALISATION=1) solutions found up to 30 (now much higher with 1.3.3) */
 queens : 1..n >-> 1..n /* for each column the row in which the queen is in */
 &
 !(q1,q2).(q1:1..n & q2:2..n & q2>q1
    => queens(q2)-queens(q1) /= q2-q1 & queens(q1)-queens(q2) /= q2-q1)
DEFINITIONS
      ANIMATION_FUNCTION_DEFAULT == ( {r,c,i|r:1..n & c:1..n & i=(r+c) mod 2 }  );
      ANIMATION_FUNCTION == ( {r,c,i|c:1..n & r=queens(c) & i=2+((r+c) mod 2) }  );
      ANIMATION_IMG0 == "images/sm_empty_box.gif";
      ANIMATION_IMG1 == "images/sm_gray_box.gif";
      ANIMATION_IMG2 == "images/sm_queen_white.gif";
      ANIMATION_IMG3 == "images/sm_queen_black.gif";
      SET_PREF_TIME_OUT == 10000; /* 4000 ms was required on my computer */
      //SET_PREF_RANDOMISE_ENUMERATION_ORDER == TRUE;
      //SET_PREF_RANDOMISED_RESTART_INIT == TRUE
OPERATIONS
  r<--Get(yy) = PRE yy:1..n THEN r:= queens(yy) END
END

