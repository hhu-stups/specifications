MACHINE JustQueens
/* Puzzle from page 329 of Handbook of Constraint Programming but without Kings */
/*
 dim=7, n=7 : solved in 0.3 secs
 dim=7, n=8 : unsat in 20 secs
 dim=8, n=6 : solved in 0.02 secs   (1.12 secs with Kodkod)
 dim=8, n=7 : solved in 0.06 secs   (2.66 secs with Kodkod)
 dim=8, n=8 : solved in 0.53 secs   (8.44 secs with Kodkod; 7.03 secs second run; +/- 8.5 with Alloy & miniSat; 9.3 seconds if we avoid overflows)
 dim=8, n=9 : solved in 12.96 secs  (128.07 secs with Kodkod ; +/- 84 secs with Alloy & miniSat)
 dim=8, n=10 : unsat in 728 secs    (Alloy & miniSat still running after over four hours)
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
      ORDERED(c,r) == (!i.(i:1..(n-1) => c(i) <= c(i+1)) &
                       !i.(i:1..(n-1) => (c(i)=c(i+1) => r(i) < r(i+1))))
CONSTANTS n, dim, blackc, blackr, whitec, whiter
PROPERTIES
 n = 8 & dim = 8 &
 blackc : 1..n --> 1..dim &
 whitec : 1..n --> 1..dim &
 blackr : 1..n --> 1..dim &
 whiter : 1..n --> 1..dim &
 ORDERED(blackc,blackr) &  /* ensures proper ordering + that we do not place two queens on same square */
 ORDERED(whitec,whiter) &
 
 
 !(i,j).(i:1..n & j:1..n => blackc(i) /= whitec(j)) &
 !(i,j).(i:1..n & j:1..n => blackr(i) /= whiter(j)) &
 !(i,j).(i:1..n & j:1..n => blackr(i) /= whiter(j) + (blackc(i)-whitec(j))) &
 !(i,j).(i:1..n & j:1..n => blackr(i) /= whiter(j) - (blackc(i)-whitec(j))) &
 
  whitec(1) < blackc(1) /* symmetry breaking */
END

