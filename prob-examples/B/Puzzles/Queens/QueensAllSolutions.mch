MACHINE QueensAllSolutions
/* A version of N-Queens where we try to find N such that there are exactly 92 solutions */
CONSTANTS n,all_queens
PROPERTIES
 n: NAT1 &
 all_queens = 
  {queens | queens : 1..n >-> 1..n /* for each column the row in which the queen is in */
                &
           !(q1,q2).(q1:1..n & q2:2..n & q2>q1
              => queens(q1)+(q2-q1) /= queens(q2) & queens(q1)+(q1-q2) /= queens(q2))
   } &
  card(all_queens) = 92
DEFINITIONS
      ANIMATION_FUNCTION_DEFAULT == ( {r,c,i|r:1..n & c:1..n & i=(r+c) mod 2 }  );
      ANIMATION_FUNCTION == ( {r,c,i|c:1..n & r=queens(c) & i=2+((r+c) mod 2) }  );
      ANIMATION_IMG0 == "images/sm_empty_box.gif";
      ANIMATION_IMG1 == "images/sm_gray_box.gif";
      ANIMATION_IMG2 == "images/sm_queen_white.gif";
      ANIMATION_IMG3 == "images/sm_queen_black.gif";
      SET_PREF_MAX_INITIALISATIONS == 100;
      SET_PREF_MAX_OPERATIONS == 10;
      SET_PREF_CLPFD == TRUE; SET_PREF_TIME_OUT == 10000;
      SET_PREF_MAXINT == 11
VARIABLES queens
INVARIANT queens : all_queens
INITIALISATION queens :: all_queens
OPERATIONS
  r<--Get = BEGIN r:= card(all_queens) END
END


