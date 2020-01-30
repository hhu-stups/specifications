MACHINE ForAll_NATURAL
DEFINITIONS
 SET_PREF_MAXINT == 29
CONSTANTS n,f
PROPERTIES
 n : 29..30 &
 f : 1..n --> NATURAL &
 !x.(x:NATURAL1 & x<=n => f(x)=x)
ASSERTIONS
 f(n) = n
INVARIANT f(n)=n
OPERATIONS
 ok = PRE f(n)=n & f(n-1)=n-1 THEN skip END
END

