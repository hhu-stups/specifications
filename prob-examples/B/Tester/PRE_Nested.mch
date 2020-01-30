MACHINE PRE_Nested
SETS
 ID={aa,bb}
CONSTANTS iv
PROPERTIES
 iv:ID
VARIABLES xx, zz
INVARIANT
 xx:ID & zz:ID
INITIALISATION xx:=iv || zz:= aa
OPERATIONS
  Set(yy) = PRE yy:ID THEN xx:= yy || PRE yy/=bb THEN zz := yy END END
END

