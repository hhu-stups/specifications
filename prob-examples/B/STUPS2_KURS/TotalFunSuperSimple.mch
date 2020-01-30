MACHINE TotalFunSuperSimple
SETS
 ID={aa,bb}
CONSTANTS f
PROPERTIES
 f:ID-->(ID>->>ID)
OPERATIONS
  r <-- Get(yy) = PRE yy:ID THEN r:= f(yy)(yy) END
END

