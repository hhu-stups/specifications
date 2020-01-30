MACHINE CstDefError1
SETS
 ID={aa,bb}
CONSTANTS iv,iv2
PROPERTIES
 iv:ID    /*  <----- iv2 not typed */
VARIABLES xx
INVARIANT
 xx:POW(ID)
INITIALISATION xx:={iv}
OPERATIONS
  Set(yy) = PRE yy:ID THEN xx:= {yy} END
END

