MACHINE JustQueens_FindOptimal_CBC
/* Puzzle from page 329 of Handbook of Constraint Programming but without Kings */
/*
 dim=5  -->  optimum n=4 found in 0.18 secs
 dim=6  -->  optimum n=5 found in 1.16 secs
 dim=7  -->  optimum n=7 found in 21.174 secs

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
                          !i.(i:1..(nn-1) => (c(i)=c(i+1) => r(i) < r(i+1))));
      CHECK_TYPE(bc,br,wc,wr,nn) == (
			 bc : 1..nn --> 1..dim &
			 wc : 1..nn --> 1..dim &
			 br : 1..nn --> 1..dim &
			 wr : 1..nn --> 1..dim );
      CHECK_DIAGONALS(bc,br,wc,wr,nn) == (
			 !(i,j).(i:1..nn & j:1..nn => bc(i) /= wc(j)) &
			 !(i,j).(i:1..nn & j:1..nn => br(i) /= wr(j)) &
			 !(i,j).(i:1..nn & j:1..nn => br(i) /= wr(j) + (bc(i)-wc(j))) &
			 !(i,j).(i:1..nn & j:1..nn => br(i) /= wr(j) - (bc(i)-wc(j)))
           )
CONSTANTS n, dim, blackc, blackr, whitec, whiter
PROPERTIES
 n : 1..16 & dim = 8 &
 
 CHECK_TYPE(blackc, blackr, whitec, whiter, n) &
 ORDERED(blackc,blackr,n) &  /* ensures proper ordering + that we do not place two queens on same square */
 ORDERED(whitec,whiter,n) &
 CHECK_DIAGONALS(blackc, blackr, whitec, whiter, n) &
 whitec(1) < blackc(1) /* symmetry breaking */ &

 /* Repeat constraints for n+1 and assert that it cannot be solved */
  not( #(n1,blackc1, blackr1, whitec1, whiter1). 
        (n1=n+1 & /* n1:2..17 & */
         CHECK_TYPE(blackc1, blackr1, whitec1, whiter1, n1) &
		 ORDERED(blackc1,blackr1,n1) &  /* ensures proper ordering + that we do not place two queens on same square */
		 ORDERED(whitec1,whiter1,n1) &
         CHECK_DIAGONALS(blackc1, blackr1, whitec1, whiter1, n1) &
		 whitec1(1) < blackc1(1) /* symmetry breaking */
      )
     )
END

