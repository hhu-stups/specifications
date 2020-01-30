MACHINE LotsOfInvariants2
DEFINITIONS SET_PREF_PROOF_INFO == FALSE /* avoid that ProB filters out invariants */
; SET_PREF_CLPFD == FALSE
/* Performance results 21.1.2013
  Runtime without pe: 6.3 secs  without CLPFD
  Runtime with pe / dynamic code execution: 3.8 secs now 4.2 secs ??
  Runtime with pe / static code execution: 3.67 secs
*/
VARIABLES a,b,c,d,e,f,g,h,i
INVARIANT
  a > b &
  b > c &
  c > d &
  d > e &
  f > g &
  h > i 
 & 
  a >= b &
  b >= c &
  c >= d &
  d >= e &
  f >= g &
  h >= i 
 &
  (a+a+a+a)+(a+a+a+a)*1 > (b+b+b+b)*1+(b+b+b+b)*(1+0)
 &
  (a+a+a+a)+(a+a+a+a)*1 > (c+c+c+c)*1+(b+b+b+b)*(1+0)
 &
  (a+a+a+a)+(a+a+a+a)*1 > (d+c+d+c)*1+(b+b+b+b)*(1+0)
 &
  (a+a+a+a)+(a+a+a+a)*1 > (e+c+e+c)*1+(b+b+b+b)*(1+0)
 &
  (a+a+a+a)+(a+a+a+a)*1 > (f+c+f+c)*1+(b+b+b+b)*(1+0)
 &
  a < 10000
INITIALISATION a,b,c,d,e,f,g,h,i := 10,9,8,7,6,5,4,3,2
OPERATIONS
  Inca = a := a + 1
END

