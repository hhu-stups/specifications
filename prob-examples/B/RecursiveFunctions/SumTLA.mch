MACHINE SumTLA
ABSTRACT_CONSTANTS g, g2, g3
PROPERTIES
 g : INTEGER <-> INTEGER
& g = %x.(x:NATURAL| IF_THEN_ELSE(bool(x=0),0,x+g(x-1)))    /* this work now */
& g2 = %x.(x:NATURAL| IF_THEN_ELSEx0(0,x+g2(x-1)))         /* this does work now */
& g3 = %x.( x=0 | 0 )\/%x.(not(x=0) | x+g3(x-1) )          /* this works */
ASSERTIONS  g(3) = 6;
 g2(3) = 6;
 g3(3) = 6;
 SIGMA(x).(x:1..4|g(x)) = 20;
 SIGMA(x).(x:1..4|g2(x)) = 20;
 SIGMA(x).(x:1..4|g3(x)) = 20
DEFINITIONS
SET_PREF_SYMBOLIC == TRUE;
IF_THEN_ELSE(P, a, b) == (%t_.(t_=0 & P = TRUE | a )\/%t_.(t_=0 & not(P= TRUE) | b ))(0);
IF_THEN_ELSEx0(a, b) == (%t_.(t_=0 & x=0 | a )\/%t_.(t_=0 & not(x=0) | b ))(0);
END