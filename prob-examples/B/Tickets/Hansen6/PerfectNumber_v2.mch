MACHINE PerfectNumber_v2
DEFINITIONS SET_PREF_CLPFD == TRUE
CONSTANTS perfect, perfectNumberGreater7
PROPERTIES
perfect = %n.(n:NATURAL | bool(SIGMA(x).(x: 1..(n-1) & #p.(p: 1..n & x*p = n)| x)=n))
& perfectNumberGreater7 = min({x| x :NATURAL & x > 7 & x<100 & perfect(x) = TRUE  & not(#y.(y> 7 & y<x & perfect(y)= TRUE))})
OPERATIONS
 IsPerfect(x) = PRE x:1..100 & perfect(x)=TRUE THEN skip END
END

