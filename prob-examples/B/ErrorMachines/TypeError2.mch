MACHINE TypeError2
SETS
 ID={aa,bb}
CONSTANTS iv
PROPERTIES
 iv:ID
VARIABLES xx
INVARIANT
 xx:POW(ID)
INITIALISATION xx:={iv}  
OPERATIONS
  Set(yy) = PRE yy:ID THEN 
     xx:= yy /*  <----- Type Error: should be {iv}; detected as invariant violation */
  END
END

