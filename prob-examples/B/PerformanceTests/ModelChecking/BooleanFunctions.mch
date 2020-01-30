MACHINE BooleanFunctions
// a good example for using TLC backend
CONSTANTS n
PROPERTIES n = 15 & n>1
VARIABLES bv
INVARIANT
 bv: 1..n --> NAT &
 bv /= [1,0,1,0,1,0, 1,0,1,0,1,0, 1,0,1]
INITIALISATION bv := %x.(x:1..n|0)
OPERATIONS
   Shift = bv := %x.(x:2..n|bv(x-1)) \/ {1|->1};
   Rotate = bv := %x.(x:2..n|bv(x-1)) \/ {1|->bv(n)}
END

