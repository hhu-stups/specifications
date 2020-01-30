MACHINE LargeErrorMessage
SETS
 ID={aa,bb}
CONSTANTS s1,s2
PROPERTIES
 s1 = (1..10)*(1..20) &
 s2 = %i.(i:1..100|i*i)
VARIABLES xx,v1,v2
INVARIANT
 xx:ID & v1:INTEGER <-> INTEGER & v2: INTEGER <->INTEGER
INITIALISATION xx:=aa || v1 := s1 || v2 := s2
OPERATIONS
  Test = PRE s2(20) > 20 & max(s2[200..400]) <100 THEN skip END
END

