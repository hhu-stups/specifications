MACHINE C0
SETS /* enumerated */
  P={P1,P2,P3,P4,P5}
ABSTRACT_CONSTANTS
  Affinity
PROPERTIES
    /* @axm3 */ Affinity = Affinity~  /* Previously ProB detected this as a recursive function */
  & /* @axm4 */ Affinity = {P1 |-> P3,P3 |-> P1}
ASSERTIONS
  Affinity(P1) = P3
END

