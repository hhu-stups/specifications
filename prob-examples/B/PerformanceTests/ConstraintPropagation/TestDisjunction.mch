MACHINE TestDisjunction
DEFINITIONS SET_PREF_MAXINT == 25
CONSTANTS a,b
PROPERTIES
 a <: 1..25 & b<: 1..25 &
 (a={1,2,3} or a={3,4,5}) &
 (b={2,3,4} or b={1,3,5}) &
 (2:a => 5:b) &
 (a={} => b={} )  &
 a /\ b = {1,3}
OPERATIONS
  ElemA(yy) = PRE yy:a THEN skip END;
  ElemB(yy) = PRE yy:b THEN skip END
END

