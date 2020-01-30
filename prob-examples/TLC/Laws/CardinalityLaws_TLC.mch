MACHINE CardinalityLaws_TLC
/* Check that ProB computes the cardinalities of certain custom closures correctly */
DEFINITIONS
 MAX == 1023
VARIABLES n
INVARIANT
 n:0..MAX &

 (n<10 => card(POW(1..n)) = 2**n) & /* originally n< 1023 */
 (n<10 => card(POW1(1..n)) = 2**n - 1) & /* originally n< 1023 */
 (n<10 => card(1..n <-> BOOL) = 2**(n*2)) & /*  originally n< 512;  currently 2**1024 gives inf result in safe_pow2 */

 (n<10 => card(1..n --> 1..3) = 3**n) & /* originally n< 512;  did violation found for n=34, 41; SICStus bug for 115 with old safe_pown */

 (n<10 => card(1..n --> 1..5) = 5**n) &  /* originally n< 442 */
 (n<10 => card(1..n --> 1..7) = 7**n) & /* originally n< 365 */
 (n<5 => card(1..n --> 1..11) = 11**n) & /*  originally n< 297 */
 
 (n<5 => card(1..n +-> 1..6) = 7**n)& /*  originally n< 365 */

 ((n>1 & n<5) => card(perm(1..n)) = n*card(perm(1..(n-1)))) /*  originally n< 1001: */ /* 1001 or larger did trigger internal error: arithmetic multiplication was called on inf & posting CLP(FD) constraint */
 &
  (n<100 => card(((1..n)*(50..60) || (2..30)*(20..22))) = 957*n) /*  originally n< 2000: */ 
INITIALISATION n:=0
OPERATIONS
  Inc = PRE n<MAX THEN n:= n+1 END;
  Inc10 = PRE n+9<MAX THEN n := n+10 END
END

