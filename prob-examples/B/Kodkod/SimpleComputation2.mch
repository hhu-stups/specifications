MACHINE SimpleComputation
/*
 limit   Kodkod  ProB
  100     0.800  0.000
  200     1.210  0.000
  400     4.870  0.000
 1000    33.020  0.000
*/
CONSTANTS limit, a, b, x
PROPERTIES
 a = 1..limit & b = (limit+2 .. limit+limit) &
 x = a \/ b &

 limit = 1000
ASSERTIONS
 card(x) = 2*limit-1
OPERATIONS
 c <-- GetCard = c:=card(x)
END

