MACHINE BitManipulationFunctions
DEFINITIONS
  BIT == 0..1;
  Sz == 4;
  WORD == (1..Sz) --> BIT;
  ONEW == %i.(i:1..Sz|1);
  ZEROW == %i.(i:1..Sz|0);

  SET_PREF_TRY_FIND_ABORT == TRUE

ABSTRACT_CONSTANTS and, xor, neg, neg2
PROPERTIES
 and : (WORD*WORD --> WORD) &
 and = %(x,y).(x:WORD & y:WORD | %i.(i:dom(x)|x(i)*y(i))) &
 xor : (WORD*WORD --> WORD) &
 xor = %(x,y).(x:WORD & y:WORD | %i.(i:dom(x)| (x(i)+y(i)) mod 2 )) &

 neg : WORD --> WORD &
 neg = %x.(x:WORD | xor(x,ONEW)) &

 neg2 : ((INTEGER<->INTEGER)<->(INTEGER<->INTEGER)) &
 neg2 = /*@symbolic */ %x.(x:seq(BIT) | xor(x,ONEW))

ASSERTIONS
  and([1,0,1,1],[1,1,0,1]) = [1,0,0,1];
  !bv.(bv:{[1,0,1,1]} => xor(xor(bv,[1,1,0,1]),[1,1,0,1]) = bv);

  /*@label "WD error1" */ neg2([0]) = [1]
VARIABLES bv1,bv2
INVARIANT bv1:WORD & bv2:WORD
INITIALISATION bv1 := [1,1,1,1] || bv2 := [0,1,0,0]
OPERATIONS
  AndBv = bv1 := and(bv1,bv2);
  XorBv = bv1 := xor(bv1,bv2);
  NegBv1 = bv1 := neg(bv1);
  NegBv2 = bv2 := neg(bv2)
END

