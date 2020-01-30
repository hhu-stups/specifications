MACHINE TestingCircDef2
ABSTRACT_CONSTANTS k,l
PROPERTIES
 k : INTEGER
 & k = IF_THEN_ELSE(bool(1 = 1), 11, foo) &
 l : INTEGER
 & l = IF_THEN_ELSE(bool(1 = 2), 11, foo)
DEFINITIONS
 IF_THEN_ELSE(P, a, b) == (%t_.(t_=0 & P = TRUE | a )\/%t_.(t_=0 & not(P= TRUE) | b ))(0);
 
 foo == IF_THEN_ELSE(bool(1 = 2),22, 33)
ASSERTIONS
 k=11;
 l=33
END