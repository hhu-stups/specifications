MACHINE ExistsBodyWarningTest
SETS
 ID={aa,bb}
CONSTANTS iv
PROPERTIES
 iv:ID
VARIABLES xx,yy
INVARIANT
 xx:ID & yy:INTEGER
INITIALISATION xx:=iv || yy :=0
OPERATIONS
  /*
ProB erroneously reports the warning "Warning: body of existential quantifier is a implication (not allowed by Atelier-B): xx = aa => foo = 1"
for the following example: */
Set = ANY foo
WHERE 
foo : INTEGER
& (xx : {aa} => foo = 1)
THEN
yy := foo
END
END

