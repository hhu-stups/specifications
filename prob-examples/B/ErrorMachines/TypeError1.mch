MACHINE TypeError1
SETS
 ID={aa,bb}
CONSTANTS iv
PROPERTIES
 iv:ID
VARIABLES xx
INVARIANT
 xx:POW(ID)
INITIALISATION xx:={{iv}}  /*  <----- Type Error: should be {iv} */
OPERATIONS
  Set(yy) = PRE yy:ID THEN xx:= {yy} END
END

