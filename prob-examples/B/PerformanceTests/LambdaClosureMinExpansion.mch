MACHINE LambdaClosureMinExpansion
DEFINITIONS
 SET_PREF_SYMBOLIC == FALSE
CONSTANTS y,f
PROPERTIES
 f = %x.(x:1..10|y+x) & 
 min(ran(f))=100000 &
 y:1..100000
OPERATIONS
 r <-- GET(z) = PRE z:dom(f) THEN r:= f(z) END
END

