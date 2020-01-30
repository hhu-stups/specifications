MACHINE SimpsonParadox_v3
/* try to find instances of Simpson's Paradox 
   https://en.wikipedia.org/wiki/Simpson%27s_paradox
   global_succ as DEFINITION rather than as constant
*/
SETS
 Treatment = {A,B}; // e..g., Treatment A, B
 Parameter2 = {ps,pl,pr} // e.g., parameter ps,pl,..
DEFINITIONS MX == 30; RANGE == 0..MX; RANGE1 == 1..MX;
 perc(x,py) == (succs(x,py) * 100) / tally(x,py); // percentage of successful treatments for Treatment x with Parameter py
 global_succ(a) == ((succs(a,ps)+succs(a,pl)+succs(a,pr)) * 100)
                     /
                     (tally(a,ps)+tally(a,pl)+tally(a,pr)) ;
 ANIMATION_FUNCTION == {r,c,i|r:Treatment & c:Parameter2 & i=(r,c,succs(r,c),tally(r,c),perc(r,c))};
 SET_PREF_RANDOMISE_ENUMERATION_ORDER == TRUE;
 "LibraryIO.def"
CONSTANTS tally, succs
PROPERTIES
 // observe((tally,succs)) &
  succs : (Treatment * Parameter2) --> RANGE & // success tally of treatment combination
  tally : (Treatment * Parameter2) --> RANGE1 & // total number of patients
  !x.(x:dom(tally) => succs(x) <= tally(x)) &

  !x.(x:Parameter2 => perc(A,x) < perc(B,x)) & // in each category B is better than A
    
  global_succ(A) > global_succ(B) // globally A is better
OPERATIONS
  r <-- GlobalTreatmentSuccess(a) = PRE a:Treatment THEN
     r := global_succ(a)
  END;
  ra,rb <-- LocalTreatmentSuccess(p) = PRE p:Parameter2 THEN
   ra,rb := perc(A,p),perc(B,p)
  END
END
