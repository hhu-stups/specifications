MACHINE CardinalityLaws
/* Check that ProB computes the cardinalities of certain custom closures correctly */
DEFINITIONS
 MAX == 1023
VARIABLES n
INVARIANT
 n:0..MAX &

 card(POW(1..n)) = 2**n &
 card(POW1(1..n)) = 2**n - 1 &
 (n<512 => card(1..n <-> BOOL) = 2**(n*2)) & /* currently 2**1024 gives inf result in safe_pow2 */

 (n<647 => card(1..n --> 1..3) = 3**n) & /* did violation found for n=34, 41; SICStus bug for 115 with old safe_pown */

 (n<442 => card(1..n --> 1..5) = 5**n) &
 (n<365 => card(1..n --> 1..7) = 7**n) & 
 (n<297 => card(1..n --> 1..11) = 11**n) &

 (n<365 => card(1..n +-> 1..6) = 7**n)&

 ((n>1 & n<1001) => card(perm(1..n)) = n*card(perm(1..(n-1)))) /* 1001 or larger did trigger internal error: arithmetic multiplication was called on inf & posting CLP(FD) constraint */
 &
  (n<2000 => card(((1..n)*(50..60) || (2..30)*(20..22))) = 957*n)
INITIALISATION n:=0
OPERATIONS
  Inc = PRE n<MAX THEN n:= n+1 END;
  Inc10 = PRE n+9<MAX THEN n := n+10 END
END

