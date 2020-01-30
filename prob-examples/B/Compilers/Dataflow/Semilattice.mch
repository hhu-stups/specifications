MODEL
   Semilattice
SETS V = {a,b,c}
CONSTANTS
  meet,leq
PROPERTIES
  meet: V*V --> V &
  !x.(x:V => meet(x,x)=x) /* idempotence */
&
 !(x,y).(x:V & y:V => meet(x,y) = meet(y,x))  /* commutativity */
&
 !(x,y,z).(x:V & y:V & z:V => (meet(x,meet(y,z)) = meet(meet(x,y),z))) /* associativity */
&
 leq:V<->V &
 !(x,y).(x:V & y:V => (x|->y : leq  <=>  (meet(x,y) = x)) )
ASSERTIONS
 !x.(x:V => x|->x:leq); /* the induced partial order is reflexive */
 !(x,y).(x:V & y:V & x|->y:leq & y|->x:leq => x=y);  /* anti-symmetry */
 !(x,y,z).(x:V & y:V & z:V & x|->y:leq & y|->z:leq => x|->z:leq) /* transitivity */
END