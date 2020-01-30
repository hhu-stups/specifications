MACHINE JustQueens_8_8
/* Puzzle from page 329 of Handbook of Constraint Programming but without Kings */

DEFINITIONS
      SET_PREF_TIME_OUT == 1000000;
      SET_PREF_MAX_INITIALISATIONS == 2;
      SET_PREF_MAX_OPERATIONS == 30;
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
      ANIMATION_FUNCTION == ( UNION(k).(k:1..nb| {(blackc(k),blackr(k),2+BWOFFSET(blackc(k),blackr(k)))}) \/
                              UNION(k).(k:1..nw| {(whitec(k),whiter(k),6+BWOFFSET(whitec(k),whiter(k)))})    );
      ORDERED(c,r) == (!i.(i:1..(n-1) => c(i) <= c(i+1)) &
                       !i.(i:1..(n-1) => (c(i)=c(i+1) => r(i) < r(i+1))))
CONSTANTS n, dim
PROPERTIES
 n = 8 & dim = 8 /* &

 
  whitec(1) < blackc(1) */
VARIABLES
   lastblack_r, lastblack_c, lastwhite_r, lastwhite_c,
   nb,nw,
   blackc, blackr, whitec, whiter
INVARIANT
    lastblack_r:0..n &
    lastblack_c:0..n & lastwhite_r:0..n & lastwhite_c:0..n&
    nb : 0..n & nw: 0..n & nw >= nb &
   blackc : 1..nb --> 1..dim &
   whitec : 1..nw --> 1..dim &
   blackr : 1..nb --> 1..dim &
   whiter : 1..nw --> 1..dim
INITIALISATION
  lastblack_r, lastblack_c, lastwhite_r, lastwhite_c := 0,0,0,0 ||
  nw,nb := 0,0 ||
  blackc,whitec,blackr,whiter := {},{},{},{}
OPERATIONS
 /* alternate between placing white and black queens */
  PlaceWhiteQueen(row,col,nr) = PRE row:1..n & col:1..n & row >= lastwhite_r &
        (row=lastwhite_r => col > lastwhite_c) &
        nr = (nw+1) &
        nw = nb & nw <n &
        !i.(i:1..nb => (blackc(i) /= col & blackr(i) /= row &
                        blackr(i) /= row + (blackc(i) - col) &
                        blackr(i) /= row - (blackc(i) - col) 
                        ))
   THEN
      lastwhite_r,lastwhite_c := row,col ||
      nw := nr ||
      whitec(nr) := col ||
      whiter(nr) := row
  END;
  /* we could add a constraint that the first black queen has a higher row than the first white one */
  PlaceBlackQueen(row,col,nr) = PRE row:1..n & col:1..n & row >= lastblack_r &
        (row=lastblack_r => col > lastblack_c) &
        nr = (nb+1) &
        nw > nb & nw <n &
        !i.(i:1..nw => (whitec(i) /= col & whiter(i) /= row &
                        whiter(i) /= row + (whitec(i) - col) &
                        whiter(i) /= row - (whitec(i) - col) 
                        ))
   THEN
      lastblack_r,lastblack_c := row,col ||
      nb := nr ||
      blackc(nr) := col ||
      blackr(nr) := row
  END;
  Reach6 = PRE nb=6 THEN skip END;
  Reach7 = PRE nb=7 THEN skip END
END

