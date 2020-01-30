MACHINE InfiniteParityFunction
CONSTANTS parity
PROPERTIES
   parity : NATURAL --> INTEGER & 
   parity = %x.(x:NATURAL|x mod 2)
DEFINITIONS
  finite(S) == (S:FIN(S)) /* B encoding of finite */
ASSERTIONS
   parity(10) = 0; parity(11)=1;
   parity[1..10] = 0..1;
   (id(1..7) ; parity) = [1,0,1,0,1,0,1];
   20|->0 : parity;
   21|->0 /: parity;
   {20|->0, 120|->0, 121|->1, 1001|->1} <: parity;
   {20|->0, 120|->0, 121|->1, 1001|->2} /<: parity;

   not (finite(parity));
   finite(NAT);
   not(finite(NATURAL));
   finite(INT);
   finite(NAT1);
   finite(1..100000);
   not(finite(INTEGER));
   not(finite(NATURAL1));
   finite({1,3,5});
   finite((1..100000)*(1..100000));
   not(finite((1..100000)*NATURAL));
   not(finite(BOOL*INTEGER));
   not(finite(INTEGER*BOOL));
   finite(BOOL*BOOL*BOOL*POW(BOOL));
   not(finite(POW(INTEGER)));
   not(finite(FIN(INTEGER)));
   finite(POW(POW(POW(BOOL))));
   finite(POW(1..3));
   finite(FIN(1..3));
   finite({1,3,5});
   not(NATURAL1 : FIN(INTEGER)); /* alternate encoding of finite */
   NAT1 : FIN(INTEGER);
   not(NATURAL : FIN(NATURAL));
   not(NATURAL1 : FIN(NATURAL));
   NATURAL1 : POW(NATURAL);
   not(0..10:FIN(NATURAL1));
   0..10 : FIN(NATURAL);
   not(finite({x|x>2}));
   NATURAL /: FIN1(INTEGER);
   {} /: FIN1(NATURAL);
   {} : FIN(NATURAL);
   {x|x>2} /: FIN1(NATURAL)
VARIABLES c
INVARIANT
 c: NATURAL
INITIALISATION c:=0
OPERATIONS
  Inc = BEGIN c:=c+1 END;
  r <-- Parity = BEGIN r:= parity(c) END;
  r <-- ParityImage = BEGIN r:= parity[0..c] END;
  r <-- ParityHistory = BEGIN r:= (%i.(i:1..c+1|i-1) ; parity) END
END

