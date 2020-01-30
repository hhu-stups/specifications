MACHINE NQueens
CONSTANTS n,queens
PROPERTIES
 n = 8 &  /* works quite efficiently with CLPFD on;
              n=16 solved in 0.03 seconds (1.5.0)
              n=20 solved in 0.04 seconds (1.5.0)
              n=21 solved in 0.04 seconds (1.5.0)
              n=50 solved in 3.25 seconds (now 1.17 with 1.3.3; 0.26 with 1.5.1);
              n=60 solved in 5.63 seconds; (now 2.11 with 1.3.3; 0.34 with 1.5.1)
              n=70 solved in 9.09 seconds (now 3.43 with 1.3.3; 0.42 with 1.5.1)
   Model is faster with perm(1..n) instead of 1..n >-> 1..n  (0.33 secs for n=70 with 1.5.1 instead of 0.42)
     using  -->> instead of >-> works at about same speed
*/
 queens : 1..n >-> 1..n /* for each column the row in which the queen is in */
 &
 !(q1,q2).(q1:1..n & q2:2..n & q2>q1
    => queens(q1)+(q2-q1) /= queens(q2) & queens(q1)+(q1-q2) /= queens(q2))
 /* Note: putting brackets around q2-q1 and q1-q2 makes it 10 % faster with ProB */
DEFINITIONS
      ANIMATION_FUNCTION_DEFAULT == ( {r,c,i|r:1..n & c:1..n & i=(r+c) mod 2 }  );
      ANIMATION_FUNCTION == ( {r,c,i|c:1..n & r=queens(c) & i=2+((r+c) mod 2) }  );
      ANIMATION_IMG0 == "images/sm_empty_box.gif";
      ANIMATION_IMG1 == "images/sm_gray_box.gif";
      ANIMATION_IMG2 == "images/sm_queen_white.gif";
      ANIMATION_IMG3 == "images/sm_queen_black.gif";
      SET_PREF_MAX_INITIALISATIONS == 10;
      SET_PREF_MAX_OPERATIONS == 10;
OPERATIONS
  r<--Get(yy) = PRE yy:1..n THEN r:= queens(yy) END
END


