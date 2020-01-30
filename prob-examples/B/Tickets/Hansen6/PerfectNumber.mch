MACHINE PerfectNumber
CONSTANTS perfect, perfectNumberGreater7
PROPERTIES
perfect = %n.(n:NATURAL | bool(SIGMA(x).(x: 1..(n-1) & #p.(p: 1..n & x*p = n)| x)=n))
/* ProB finds no solution if maxint is 5. If maxint is greater than 28, ProB finds one solution (28)*/
/* ProB seems to use 0..MAXINT to enumerate NATRUAL */
& perfectNumberGreater7 = min({x| x :NATURAL & x > 7 &  perfect(x) = TRUE  & not(#y.(y> 7 & y<x & perfect(y)= TRUE))})
END

