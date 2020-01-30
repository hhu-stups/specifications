MACHINE NineQueensAndKingBW
/* Puzzle from page 329 of Handbook of Constraint Programming */
/* Started 9h22; interrupted for a few minutes
 9h48 first sol for n=4, dim=8 with visualization; 9h49 solution for n=7 in 20 ms 
 9h57: solution for n=8 & dim=8 in 44 seconds; error detected in formula for white king
 
 9h59 fixed; now solution found in 7.8s seconds for n=8 & dim=8
 
 10h12 : n=9 marked as unsatisfiable;
 
 still contained a few issues
 11h28: solution for n=8, dim=8 found in 82 seconds
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
      BWOFFSET(xx,yy) == (xx+yy) mod 2;
      ANIMATION_FUNCTION_DEFAULT == ( {r,c,i|r:1..dim & c:1..dim & i=(r+c) mod 2 }  );
      ANIMATION_FUNCTION == ( {(blackc(0),blackr(0),5), 
                               (whitec(0),whiter(0),4)} \/
                              UNION(k).(k:1..n| {(blackc(k),blackr(k),2+BWOFFSET(blackc(k),blackr(k)))}) \/
                              UNION(k).(k:1..n| {(whitec(k),whiter(k),6)})    );
      ORDERED(c,r) == (!i.(i:1..(n-1) => c(i) <= c(i+1)) & !i.(i:1..(n-1) => (c(i)=c(i+1) => r(i) < r(i+1))))
CONSTANTS n, dim, blackc, blackr, whitec, whiter
PROPERTIES
 n = 8 & dim = 8 &
 blackc : 0..n --> 1..dim &
 whitec : 0..n --> 1.. dim &
 blackr : 0..n --> 1..dim &
 whiter : 0..n --> 1.. dim &
 ORDERED(blackc,blackr) &  /* ensures proper ordering + that we do not place two queens on same square */
 ORDERED(whitec,whiter) &
 
 (blackc(0)|->blackr(0)) /= (whitec(0)|->whiter(0)) &
 (blackc(0)|->blackr(0)) /= (whitec(0)+1|->whiter(0)) &
 (blackc(0)|->blackr(0)) /= (whitec(0)+1|->whiter(0)+1) &
 (blackc(0)|->blackr(0)) /= (whitec(0)+1|->whiter(0)-1) &
 (blackc(0)|->blackr(0)) /= (whitec(0)|->whiter(0)+1) &
 (blackc(0)|->blackr(0)) /= (whitec(0)|->whiter(0)-1) &
 (blackc(0)|->blackr(0)) /= (whitec(0)-1|->whiter(0)) &
 (blackc(0)|->blackr(0)) /= (whitec(0)-1|->whiter(0)+1) &
 (blackc(0)|->blackr(0)) /= (whitec(0)-1|->whiter(0)-1) &
 
 !i.(i:1..n => (blackc(0)|->blackr(0)) /= (blackc(i)|->blackr(i))) &
 !i.(i:1..n => (whitec(0)|->whiter(0)) /= (whitec(i)|->whiter(i))) &
 
 !(i,j).(i:0..n & j:0..n & (i/=0 or j/=0) => blackc(i) /= whitec(j)) &
 !(i,j).(i:0..n & j:0..n & (i/=0 or j/=0) => blackr(i) /= whiter(j)) &
 !(i,j).(i:0..n & j:0..n & (i/=0 or j/=0) => blackr(i) /= whiter(j) + (blackc(i)-whitec(j))) &
 !(i,j).(i:0..n & j:0..n & (i/=0 or j/=0) => blackr(i) /= whiter(j) - (blackc(i)-whitec(j))) &
 
  whitec(1) < blackc(1) /* symmetry breaking */
END

