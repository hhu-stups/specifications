MACHINE SomeInvariants
DEFINITIONS SET_PREF_PROOF_INFO == FALSE /* avoid that ProB filters out invariants */
VARIABLES a,b,c,d,e,f,g,h,i
INVARIANT
  a > b &
  b > c &
  c > d &
  d > e &
  f > g &
  h > i &

  a < 10000
INITIALISATION a,b,c,d,e,f,g,h,i := 10,9,8,7,6,5,4,3,2
OPERATIONS
  Inca = a := a + 1
END

