
MACHINE context
CONCRETE_CONSTANTS
  ADD_MSG,
  BIT,
  CARRY,
  CARRY_MSG,
  MSG,
  SUM,
  sze
PROPERTIES
    /* @c:BIT−def  */ BIT = {0,1}
  & /* @c:size−def  */ sze = 8
  & /* @c:MSG−def  */ MSG = 1 .. sze --> BIT
  & /* @c:SUM−def  */ SUM = {(((0|->0)|->0)|->0),(((0|->0)|->1)|->1),(((0|->1)|->0)|->1),(((0|->1)|->1)|->0),(((1|->0)|->0)|->1),(((1|->0)|->1)|->0),(((1|->1)|->0)|->0),(((1|->1)|->1)|->1)}
  & /* @c:CARRY−def  */ CARRY = {(((0|->0)|->0)|->0),(((0|->0)|->1)|->0),(((0|->1)|->0)|->0),(((0|->1)|->1)|->1),(((1|->0)|->0)|->0),(((1|->0)|->1)|->1),(((1|->1)|->0)|->1),(((1|->1)|->1)|->1)}
  & /* @c:CARRY_MSG−def  */ CARRY_MSG = /*@symbolic */ {m1,m2,c|m1 : MSG & (m2 : MSG & (c : MSG & c = {r,s|r : 1 .. sze & (s : BIT & ((r = 1 => s = 1) & (r > 1 => s = CARRY((m1(r - 1) |-> m2(r - 1)) |-> c(r - 1)))))}))}
  & /* @c:ADD_MSG−def  */ ADD_MSG = /*@symbolic */  {m1,m2,c|m1 : MSG & (m2 : MSG & (c : MSG & c = {i,v|v : INTEGER & (i : 1 .. sze & v = SUM((m1(i) |-> m2(i)) |-> CARRY_MSG(m1 |-> m2)(i)))}))}
ASSERTIONS
  /* @c:CARRY_MSG−type  */ CARRY_MSG : (MSG * MSG) --> MSG
INITIALISATION
    skip
END
