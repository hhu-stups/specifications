MACHINE ExistsBodyImpl
SETS
 ID={aa,bb}
CONSTANTS iv
PROPERTIES
 iv:ID &
 #rr.(rr:{aa} => rr=aa)
VARIABLES xx
INVARIANT
 xx:ID
INITIALISATION xx:=iv
OPERATIONS
  Set(yy) = PRE yy:ID THEN xx:= yy END
END

