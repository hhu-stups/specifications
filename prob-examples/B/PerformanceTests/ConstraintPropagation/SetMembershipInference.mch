MACHINE SetMembershipInference
SETS
 ID={aa,bb,cc,dd,ee,ff,gg,hh}
DEFINITIONS
 SET_PREF_CLPFD == TRUE
CONSTANTS a,f,g,h
PROPERTIES
 a : {aa,cc,ee,gg} &
 f : 1..100 --> 1..100 &
 !x.(x:1..100 => (a : {bb,dd,ff,hh} or f(x)=x)) &  /* Test whether ProB infers that a is not an element of {bb,dd,ff,hh} and f(x)=x without enumerating */

 g : 1..100 --> 1..100 &
 !x.(x:1..100 => g(x) : {-1} \/ {x,x+2}) &
 !x.(x:1..100 => g(x) : {0} \/ {x,x-2}) &/* Test whether ProB infers that g(i)=x without enumerating */
 h : 1..100 --> ID &
 !x.(x:1..100 => h(x) : {bb,dd,ff,hh}) &
 !x.(x:1..100 => h(x) : {aa,cc,ee,gg,hh}) /* Test whether ProB infers that h(i)=hh without enumerating */
OPERATIONS
  r <-- GetF(yy) = PRE yy:1..100 THEN r:= f(yy) END;
  r <-- GetG(yy) = PRE yy:1..100 THEN r:= g(yy) END;
  r <-- GetH(yy) = PRE yy:1..100 THEN r:= h(yy) END
END

