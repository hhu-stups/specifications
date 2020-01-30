MACHINE QueensBoardVersion_v5
/*
 simplified version of problem
 Kodkod fails to find a solution even though there is one
*/
CONSTANTS board
PROPERTIES
 board <: {1}  /* board contains coordinates of all queens */
 &
 board /= {}
 &
 (3) /: board 

DEFINITIONS
   SET_PREF_KODKOD == TRUE;
   SET_PREF_KODKOD_SYMMETRY == 0;
 //     SET_PREF_KODKOD_MAX_NR_SOLS == 1;
 //     SET_PREF_KODKOD_SAT_SOLVER == "sat4j";
      SET_PREF_MAX_INITIALISATIONS == 10;
      SET_PREF_MAX_OPERATIONS == 10;
END


