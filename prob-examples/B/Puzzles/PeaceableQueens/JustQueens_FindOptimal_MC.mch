MACHINE JustQueens_FindOptimalMC
/* Encoding the Puzzle as a Solve Operation 
   For some reason this is considerably slower; investigate why !!
*/

DEFINITIONS
      SET_PREF_TIME_OUT == 1000000;
      SET_PREF_MAX_INITIALISATIONS == 1;
      ANIMATION_IMG0 == "images/sm_empty_box.gif";
      ANIMATION_IMG1 == "images/sm_gray_box.gif";
      ANIMATION_IMG2 == "images/sm_queen_white.gif";
      ANIMATION_IMG3 == "images/sm_queen_black.gif";
      ANIMATION_IMG4 == "images/sm_knight_white.gif";
      ANIMATION_IMG5 == "images/sm_knight_black.gif";
      ANIMATION_IMG6 == "images/sm_white_queen_white.gif";
      ANIMATION_IMG7 == "images/sm_white_queen_black.gif";
      BWOFFSET(xx,yy) == (xx+yy) mod 2;
      ANIMATION_FUNCTION_DEFAULT == ( {r,c,i|r:1..dim & c:1..dim & i=(r+c) mod 2 }  );
      ANIMATION_FUNCTION == ( UNION(k).(k:1..n| {(blackc(k),blackr(k),2+BWOFFSET(blackc(k),blackr(k)))}) \/
                              UNION(k).(k:1..n| {(whitec(k),whiter(k),6+BWOFFSET(whitec(k),whiter(k)))})    );
      ORDERED(c,r,nn) == (!i.(i:1..(nn-1) => c(i) <= c(i+1)) &
                          !i.(i:1..(nn-1) => (c(i)=c(i+1) => r(i) < r(i+1))))
CONSTANTS dim
PROPERTIES
 dim = 8
ASSERTIONS
 ORDERED(blackc,blackr,n) &  /* ensures proper ordering + that we do not place two queens on same square */
 ORDERED(whitec,whiter,n) &
 
 !(i,j).(i:1..n & j:1..n => blackc(i) /= whitec(j)) &
 !(i,j).(i:1..n & j:1..n => blackr(i) /= whiter(j)) &
 !(i,j).(i:1..n & j:1..n => blackr(i) /= whiter(j) + (blackc(i)-whitec(j))) &
 !(i,j).(i:1..n & j:1..n => blackr(i) /= whiter(j) - (blackc(i)-whitec(j))) 
VARIABLES n, blackc, blackr, whitec, whiter
INVARIANT n: NATURAL &
 blackc : 1..n --> 1..dim &
 whitec : 1..n --> 1..dim &
 blackr : 1..n --> 1..dim &
 whiter : 1..n --> 1..dim
INITIALISATION n := 0 || blackc, blackr, whitec, whiter := {},{},{},{}
OPERATIONS
  SolveNext(n1,blackc1, blackr1, whitec1, whiter1) = 
  SELECT n1=n+1 &
         blackc1 : 1..n1 --> 1..dim &
         whitec1 : 1..n1 --> 1..dim &
         blackr1 : 1..n1 --> 1..dim &
         whiter1 : 1..n1 --> 1..dim &
         ORDERED(blackc1,blackr1,n1) &  /* ensures proper ordering + that we do not place two queens on same square */
         ORDERED(whitec1,whiter1,n1) &
 
 
        !(i,j).(i:1..n1 & j:1..n1 => blackc1(i) /= whitec1(j)) &
        !(i,j).(i:1..n1 & j:1..n1 => blackr1(i) /= whiter1(j)) &
        !(i,j).(i:1..n1 & j:1..n1 => blackr1(i) /= whiter1(j) + (blackc1(i)-whitec1(j))) &
        !(i,j).(i:1..n1 & j:1..n1 => blackr1(i) /= whiter1(j) - (blackc1(i)-whitec1(j))) &
 
         whitec1(1) < blackc1(1) /* symmetry breaking */

     THEN
          n, blackc, blackr, whitec, whiter := n1, blackc1, blackr1, whitec1, whiter1
  END
END

