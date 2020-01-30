
MACHINE m0
/* version with just a single initialisation; takes ProB 1.7 seconds to model check (258 states) */
/* with TLC it takes quite a while (7 states a minute) */
ABSTRACT_CONSTANTS ADD_MSG, CARRY_MSG
CONCRETE_CONSTANTS
  BIT,
  CARRY,
  MSG,
  SUM,
  sze
ABSTRACT_VARIABLES
  m1,
  m2
/* PROMOTED OPERATIONS
  add */
PROPERTIES
    /* @c:BIT−def  */ BIT = {0,1}
  & /* @c:size−def  */ sze = 8
  & /* @c:MSG−def  */ MSG = 1 .. sze --> BIT
  
  & /* @c:SUM−def  */ SUM = {(((0|->0)|->0)|->0),(((0|->0)|->1)|->1),(((0|->1)|->0)|->1),
  (((0|->1)|->1)|->0),(((1|->0)|->0)|->1),(((1|->0)|->1)|->0),
  (((1|->1)|->0)|->0),(((1|->1)|->1)|->1)}
  
  & /* @c:CARRY−def  */ CARRY = {(((0|->0)|->0)|->0),(((0|->0)|->1)|->0),(((0|->1)|->0)|->0),
  (((0|->1)|->1)|->1),(((1|->0)|->0)|->0),
  (((1|->0)|->1)|->1),(((1|->1)|->0)|->1),(((1|->1)|->1)|->1)}
  
  & /* @c:CARRY_MSG−def  */ CARRY_MSG = // /*@symbolic */ 
  {m1,m2,c|m1 : MSG & m2 : MSG & c : MSG &
    c(1)=1 &
    !r.(r:2..sze => c(r) = CARRY((m1(r - 1) |-> m2(r - 1)) |-> c(r - 1)))}
    
  & /* @c:ADD_MSG−def  */ ADD_MSG = // /*@symbolic */  
    %(m1,m2).(m1 : MSG & m2 : MSG | %i.(i : 1 .. sze | SUM((m1(i) |-> m2(i)) |-> CARRY_MSG(m1 |-> m2)(i))))
INVARIANT
    /* @m0:inv1  */ m1 : MSG
  & /* @m0:inv2  */ m2 : MSG
ASSERTIONS
  /* @c:CARRY_MSG−type  */ CARRY_MSG : MSG * MSG --> MSG
INITIALISATION
   BEGIN
         m1 := %i.(i:1..8|0)
      ||
         m2 := %i.(i:1..8|0)
    END
OPERATIONS
  add(p) = 
    SELECT
        /* @m0:grd1  */ p = ADD_MSG(m1 |-> m2)
    THEN 
         m1 := p
    END
END
