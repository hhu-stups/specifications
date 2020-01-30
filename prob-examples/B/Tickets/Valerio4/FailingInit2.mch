MACHINE FailingInit2
SETS
 ID={aa,bb}
CONSTANTS iv, f
PROPERTIES
 iv:ID & f = {1|->aa, 2|->bb}
VARIABLES xx, yy
INVARIANT
 xx:ID & yy:ID
INITIALISATION xx,yy:=iv,f(0)
OPERATIONS
  Set(yy) = PRE yy:ID THEN xx:= yy END
END

