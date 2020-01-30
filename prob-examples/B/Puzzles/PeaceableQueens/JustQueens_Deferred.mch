MACHINE JustQueensDeferred
/* Puzzle from page 329 of Handbook of Constraint Programming but without Kings */
/*
 A version with deferred sets rather than integers;
  makes it harder to prevent symmetric solutions and makes ProB without Kodkod much slower
 ProB+Kodkod seems not much slower than the Alloy solution

 Timings on MacBook Air 1.7GHz, 24th January 2014:
 dim=8, n=3 : solved in 0.03 secs with ProB, ProB+Kodkod : 0.33 secs
 dim=8, n=4 : solved in 0.05 secs with ProB, ProB+Kodkod : 0.83 secs 
 dim=8, n=5 : solved in 3.28 secs with ProB, ProB+Kodkod : 0.46 - 3.57 secs
 dim=8, n=6 : ProB+Kodkod : 1.06 secs
 dim=8, n=7 : ProB+Kodkod : 2.97 secs
 dim=8, n=8 : ProB+Kodkod : 17.24 secs
 dim=8, n=9 : ProB+Kodkod : > 5 minutes ?

*/
SETS BQueens; WQueens
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
      ANIMATION_FUNCTION == ( UNION(k).(k:BQueens| {(blackc(k),blackr(k),2+BWOFFSET(blackc(k),blackr(k)))}) \/
                              UNION(k).(k:WQueens| {(whitec(k),whiter(k),6+BWOFFSET(whitec(k),whiter(k)))})    );
      N == 7
CONSTANTS dim, blackc, blackr, whitec, whiter
PROPERTIES
 card(WQueens) = card(BQueens) &
 card(WQueens) = N  & card(BQueens) = N &
 
 dim = 8 &
 blackc : BQueens --> 1..dim &
 whitec : WQueens --> 1..dim &
 blackr : BQueens --> 1..dim &
 whiter : WQueens --> 1..dim &
 
 !(i,j).(i:BQueens & j:BQueens & i/=j => (blackc(i),blackr(i)) /= (blackc(j),blackr(j))) &
 !(i,j).(i:WQueens & j:WQueens & i/=j => (whitec(i),whiter(i)) /= (whitec(j),whiter(j))) &
 
 !(i,j).(i:BQueens & j:WQueens => blackc(i) /= whitec(j)) &
 !(i,j).(i:BQueens & j:WQueens => blackr(i) /= whiter(j)) &
 !(i,j).(i:BQueens & j:WQueens => blackr(i) /= whiter(j) + (blackc(i)-whitec(j))) &
 !(i,j).(i:BQueens & j:WQueens => blackr(i) /= whiter(j) - (blackc(i)-whitec(j)))
END

