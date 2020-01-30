MACHINE NQueensModelCheck
/* A version of N-Queens where Model Checking is used to find a solution */
/* This is less efficient and more low-level (we hard-wire the way the order in which queens are placed) than the versions which specify the constraints in the PROPERTIES */
/* for best results use Depth-First Search */
/* takes, e.g., 0.02 seconds for n=7, 0.23 seconds for n=8,
     0.08 for n=9, 0.24 for n=10, 0.12 for n=11,
     0.65 for n=12 (note: 9.99 seconds with Mixed DF/BF; TLA takes 75 seconds for queensMC.tla),
     0.30 for n=13 (note: 3.74 seconds with Mixed DF/BF; TLA takes 8 minutes 18 seconds),
     5.49 for n=14,
     4.89 for n=15, 
   to find first solution */
DEFINITIONS GOAL == cur>n;
 SET_PREF_MAX_OPERATIONS == 32;
      ANIMATION_FUNCTION_DEFAULT == ( {r,c,i|r:1..n & c:1..n & i=(r+c) mod 2 }  );
      ANIMATION_FUNCTION == ( {r,c,i|c:1..n & c|->r:q & i=2+((r+c) mod 2) }  );
      ANIMATION_IMG0 == "images/sm_empty_box.gif";
      ANIMATION_IMG1 == "images/sm_gray_box.gif";
      ANIMATION_IMG2 == "images/sm_queen_white.gif";
      ANIMATION_IMG3 == "images/sm_queen_black.gif";
CONSTANTS n
PROPERTIES
 n=5
VARIABLES q, cur
INVARIANT
 q : 1..n +-> 1..n &
 cur : 1..(n+1)
INITIALISATION q:={} || cur := 1
OPERATIONS
  SetQueen(i) = PRE cur<=n & i:1..n & 
     !j.(j:1..(cur-1) => i /= q(j) & i/= q(j)+j-cur & i/=q(j)-j+cur ) THEN
   q(cur) := i ||
   cur := cur+1
  END
END
