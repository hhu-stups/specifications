MACHINE ExplicitComputations2
/* A machine with some explicitly given results for certain computations */
SETS
  PROC = {p1,p2,p3}
CONSTANTS
  r 
PROPERTIES
  p1=p1 & p1 /= p2 & not(p1=p2) &
  r = {p1 |-> p2, p2|-> p3} &
  r >< r = { p1|->(p2,p2), p2|->(p3,p3) } &
  (r || r) = { (p1,p1)|->(p2,p2), (p1,p2)|->(p2,p3), (p2,p1)|->(p3,p2), (p2,p2)|->(p3,p3) } 
ASSERTIONS
not(
  (r || r) = { (p1,p1)|->(p2,p2), (p1,p2)|->(p2,p3), (p2,p1)|->(p3,p2), (p2,p2)|->(p3,p2) } 
  )
END