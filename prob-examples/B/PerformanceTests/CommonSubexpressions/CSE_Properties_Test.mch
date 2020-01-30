MACHINE CSE_Properties_Test
SETS
 ID={aa,bb}
CONSTANTS iv, x
PROPERTIES
 iv:ID & (x+x) > 10 & (x+x) < 20
VARIABLES xx
INVARIANT
 xx:ID & (x+x) > 10 & (x+x) < 20
INITIALISATION xx:=iv
OPERATIONS
  Set(yy) = PRE yy:ID & (yy=aa or (not(yy=aa) & yy=bb)) THEN xx:= yy END
END

