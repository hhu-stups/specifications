MACHINE DefSetPartTest5
DEFINITIONS SET_PREF_MAX_INITIALISATIONS == 2;
 SET_PREF_STATIC_SYMMETRY_DETECTION == TRUE;
 SET_PREF_TIME_OUT == 1000
SETS
 ID
CONSTANTS  P1, P2, P3, aa, bb
PROPERTIES

 aa:P1 & bb:P2 &  // not yet detected as aa /= bb
 aa /= bb &

 P1 \/ P2 \/ P3 = ID & P1 /\ P2 = {} & P1 /\ P3 = {} & P2 /\ P3 = {}

& card(ID) = 9
& card(P1) = card(P2)
& card(P2) = card(P3)
ASSERTIONS
 card(P1) = 3
END
