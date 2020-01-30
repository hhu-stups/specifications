MACHINE AssignToUndeclaredVar
SETS
 ID={aa,bb}
CONSTANTS iv
PROPERTIES
 iv:ID
VARIABLES xx
INVARIANT
 xx:ID
INITIALISATION xx:=iv
OPERATIONS
  Set(yy) = PRE yy:ID THEN 
               IF yy=aa THEN
                 xx:= yy
               ELSE 
                  x:= yy   /* Unknown variable x */
           END END
END

