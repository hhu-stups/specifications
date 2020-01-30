MACHINE LotsOfInvariants
DEFINITIONS SET_PREF_PROOF_INFO == FALSE /* avoid that ProB filters out invariants */
/* Performance results 23.13.2013; 
    
  Runtime without pe: 6.4 secs  ;  now 6.20 secs with CLPFD; 7.11 secs without (2nd April)
  Runtime with pe / dynamic code execution: 2.53  ; now 2.43 with CLPFD
  Runtime with pe / static code execution: 2.28
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
  a /= b &
  a /= c &
  a /= d &
  a /= e &
  a /= f &
  a /= h &
  a /= g &
  a /= i 
 &
  b /= a &
  b /= c &
  b /= d &
  b /= e &
  b /= f &
  b /= g &
  b /= h &
  b /= i 
 &
  c /= a &
  c /= b &
  c /= d &
  c /= e &
  c /= f &
  c /= g &
  c /= h &
  c /= i 
 &
  d /= a &
  d /= b &
  d /= c &
  d /= e &
  d /= f &
  d /= g &
  d /= h &
  d /= i 
 &
  e /= a &
  e /= b &
  e /= c &
  e /= d &
  e /= f &
  e /= g &
  e /= h &
  e /= i 
 &
  f /= a &
  f /= b &
  f /= c &
  f /= d &
  f /= e &
  f /= g &
  f /= h &
  f /= i 
 &
  g /= a &
  g /= b &
  g /= c &
  g /= d &
  g /= e &
  g /= f &
  g /= h &
  g /= i
 &
  h /= a &
  h /= b &
  h /= c &
  h /= d &
  h /= e &
  h /= f &
  h /= g &
  h /= i
 &
  i /= a &
  i /= b &
  i /= c &
  i /= d &
  i /= e &
  i /= f &
  i /= g &
  i /= h &
  a < 10000
INITIALISATION a,b,c,d,e,f,g,h,i := 10,9,8,7,6,5,4,3,2
OPERATIONS
  Inca = a := a + 1
END

