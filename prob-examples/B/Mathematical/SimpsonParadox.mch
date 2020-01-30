MACHINE SimpsonParadox
/* try to find instances of Simpson's Paradox 
   https://en.wikipedia.org/wiki/Simpson%27s_paradox
*/
SETS
 Parameter1 = {A,B};
 Parameter2 = {s,l}
DEFINITIONS RANGE == 0..10; RANGE1 == 1..10;
 perc(x,y) == (succs(x,y) * 100) / tally(x,y);
 ANIMATION_FUNCTION == {r,c,i|r:Parameter1 & c:Parameter2 & i=(r,c,succs(r,c),tally(r,c),perc(r,c))};
CONSTANTS tally, succs, global_succ
PROPERTIES
  succs : (Parameter1 * Parameter2) --> RANGE &
  tally : (Parameter1 * Parameter2) --> RANGE1 &
  !x.(x:dom(tally) => succs(x) <= tally(x)) &

  !x.(x:Parameter2 => perc(A,x) < perc(B,x)) & // in each category B is better than A
   
  global_succ = %a.(a:Parameter1|
                     (SIGMA(y).(y:Parameter2|succs(a,y)) * 100)
                     /
                     SIGMA(v).(v:Parameter2|tally(a,v))) 
& global_succ(A) > global_succ(B) // globally A is better
END
