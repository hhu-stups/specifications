MACHINE ExecuteAll
CONSTANTS k
PROPERTIES
k : 10..100
ASSERTIONS x<101
VARIABLES x
INVARIANT
x: 1..100
INITIALISATION x:=1 
OPERATIONS
 Inc = SELECT x < k THEN x:= x + 1 END
END