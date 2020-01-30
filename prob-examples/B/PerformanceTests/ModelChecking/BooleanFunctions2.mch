MACHINE BooleanFunctions2
// a good example for using TLC backend
CONSTANTS n
PROPERTIES n : 1..15 & n>1
VARIABLES bv, i
INVARIANT
 bv: 1..n --> NAT &
 i : 1..n
DEFINITIONS
  GOAL == (bv = [1,0,1,0,1,0, 1,0,1,0,1,0, 1,0,1]);
  SET_PREF_MAX_INITIALISATIONS == 16
INITIALISATION bv := %x.(x:1..n|0) || i:= 1
OPERATIONS
 //  Shift = bv := %x.(x:2..n|bv(x-1)) \/ {1|->1};
 //   Rotate = bv := %x.(x:2..n|bv(x-1)) \/ {1|->bv(n)};
   out1,out2 <-- LCHIP_FUNCTION(a,b,c) =
     SELECT a:0..1 & b:0..1 & c:0..1 THEN
       out1 := bv(i) ||
       out2 := 1-bv(i) ||
       IF a=b THEN
         bv(i) := c ||
         IF i<n THEN i := i+1 ELSE i:=1 END
       END
   END
END

