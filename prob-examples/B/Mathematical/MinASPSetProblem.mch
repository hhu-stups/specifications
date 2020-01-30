MACHINE MinASPSetProblem
/* Finding Minimal Solutions to a propositional formula */
DEFINITIONS
 SOL(a,b,c) == ( (a=TRUE or b=TRUE) & (a=TRUE or b=FALSE or c=FALSE) & (a=FALSE or c=FALSE) );
 IMPROVES(v,nv) == (v /= nv & !i.(i:dom(v)=> (v(i)=FALSE => nv(i)=FALSE) ) )
CONSTANTS a,b,c
PROPERTIES
 SOL(a,b,c) & /* we have a solution */
 not(#(aa,bb,cc).(IMPROVES([a,b,c],[aa,bb,cc]) & SOL(aa,bb,cc)) ) /* there is no better one */
END

