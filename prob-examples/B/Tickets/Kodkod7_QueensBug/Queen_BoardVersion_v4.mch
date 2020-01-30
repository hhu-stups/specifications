MACHINE QueensBoardVersion_v4
/*
 simplified version of problem
 Kodkod fails to find a solution even though there is one
*/
CONSTANTS board
PROPERTIES
 board <: (1..2) * (1..2) /* board contains coordinates of all queens */
 &
 board /= {}
 &

((1,2):board => (3,2) /: board ) &
((1,1):board => (3,1) /: board ) &

((2,1):board => (3,1) /: board  ) &
((2,2):board => (3,2) /: board )

DEFINITIONS
   SET_PREF_KODKOD == TRUE;
   SET_PREF_KODKOD_SYMMETRY == 0;
 //     SET_PREF_KODKOD_MAX_NR_SOLS == 1;
 //     SET_PREF_KODKOD_SAT_SOLVER == "sat4j";
 n==2;
      ANIMATION_FUNCTION_DEFAULT == ( {r,c,i|r:1..n & c:1..n & i=(r+c) mod 2 }  );
      ANIMATION_FUNCTION == ( {r,c,i|c:1..n & (r,c):board & i=2+((r+c) mod 2) }  );
      ANIMATION_IMG0 == "images/sm_empty_box.gif";
      ANIMATION_IMG1 == "images/sm_gray_box.gif";
      ANIMATION_IMG2 == "images/sm_queen_white.gif";
      ANIMATION_IMG3 == "images/sm_queen_black.gif";
      SET_PREF_MAX_INITIALISATIONS == 10;
      SET_PREF_MAX_OPERATIONS == 10;
END


