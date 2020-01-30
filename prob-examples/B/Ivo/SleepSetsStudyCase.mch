MACHINE SleepSetsStudyCase

DEFINITIONS
 ASSERT_LTL_1 == "GF (e(Op1) or sink)"

VARIABLES x,y,v,w

CONSTANTS BITSET

PROPERTIES
 BITSET={0,1}
INVARIANT
 x:BITSET & y:BITSET & v:BITSET & w:BITSET
INITIALISATION x:=0 || y:=0 || v,w := 0,0
OPERATIONS
  Op1(x1) = PRE x1:BITSET & x<1 & v=0 THEN x := x+1 END;
  /*Op1_1 = PRE x=1 & y=0 & v=0 & w=0 THEN skip END;*/
  Op2 = PRE x=1 & v<1 THEN v := v+1 END;
  Op3 = PRE y<1 & w=0 THEN y := y+1 END;
  /*Op3_1 = PRE x=0 & y=1 & v=0 & w=0 THEN skip END;*/
  Op4 = PRE y=1 & w<1 THEN w := w+1 END
END
