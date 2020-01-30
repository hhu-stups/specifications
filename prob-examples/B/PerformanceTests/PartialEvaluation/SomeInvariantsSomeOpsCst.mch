MACHINE SomeInvariantsSomeOpsCst
DEFINITIONS SET_PREF_PROOF_INFO == FALSE /* avoid that ProB filters out invariants */
/* Time: 14.83 secs without deadlock checking ; 14951 states */
/* with pe of invariant: xx secs ;
  about the same with pe of operations :-( 
  There must be some considerable overhead in specfile or the model checker
*/
; DMAX == 5000
CONSTANTS MAX, sqr
PROPERTIES MAX = DMAX &
 sqr = %i.(i:1..DMAX|i*i)
VARIABLES a,b,c,d,e,f,g,h,i
INVARIANT
  a > b &
  b > c &
  c > d &
  d > e &
  f > g &
  h > i &

  a < DMAX
INITIALISATION a,b,c,d,e,f,g,h,i := 10,9,8,7,6,5,4,3,2
OPERATIONS
  Inca = PRE a+1<DMAX THEN a := a + 1 END;
  Incb1000 = PRE b+1001 = a THEN b := b+1000 END
END

