MACHINE DefSetPartTest4
DEFINITIONS SET_PREF_MAX_INITIALISATIONS == 2;
 SET_PREF_STATIC_SYMMETRY_DETECTION == TRUE;
 SET_PREF_TIME_OUT == 1000
SETS
 ID
CONSTANTS  P1, P2, aa, bb
PROPERTIES

 aa:P1 & bb:P2 &  // not yet detected as aa /= bb

 P1 \/ P2 = ID & P1 /\ P2 = {}

& card(ID) = 10
& card(P1) = card(P2)
ASSERTIONS
 card(P1) = 5
END
