MACHINE FunOutsideOfDomain
SETS
 ID={aa,bb}
CONSTANTS iv,f
PROPERTIES
 iv:ID & iv=aa & 
 f: ID +-> ID & ran(f) = {iv} &
 f(iv) = iv  /* without condition iv:dom(f) this is potentially undefined */
VARIABLES xx
INVARIANT
 xx:ID
INITIALISATION xx:=iv
OPERATIONS
  Set(yy) = PRE yy:ID THEN xx:= yy END
END

