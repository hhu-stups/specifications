MACHINE MinCLPFDProblem
/* Finding Minimal Solutions to a CLP(FD) like formula */
DEFINITIONS
 SOL(a,b,c) == ( a + b =c &  a*b=c & c:0..100 & a:NATURAL & b:NATURAL );
 IMPROVES_Max(v,nv) == (v /= nv & !i.(i:dom(v) => v(i) <= nv(i) ) );
 IMPROVES_Min(v,nv) == (v /= nv & !i.(i:dom(v) => v(i) >= nv(i) ) )
CONSTANTS a,b,c
PROPERTIES
 SOL(a,b,c) & /* we have a solution */
 not(#(aa,bb,cc).(IMPROVES_Max([a,b,c],[aa,bb,cc]) & SOL(aa,bb,cc)) ) /* there is no better one */
END

