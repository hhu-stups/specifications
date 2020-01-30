MACHINE CstDefError2
SETS
 ID={aa,bb}
CONSTANTS iv
PROPERTIES
 iv:ID & iv2:ID   /*  <----- iv2 not declared in CONSTANTS */
VARIABLES xx
INVARIANT
 xx:POW(ID)
INITIALISATION xx:={iv}
OPERATIONS
  Set(yy) = PRE yy:ID THEN xx:= {yy} END
END

