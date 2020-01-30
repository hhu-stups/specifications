MACHINE SimpleDeadlock1
/* contains a deadlock that can be found with CBC */
SETS
 ID={aa,bb}
CONSTANTS iv
PROPERTIES
 iv:ID
VARIABLES mode, x
INVARIANT
 mode : 1..4 & x<: ID
INITIALISATION x:={iv} || mode := 1
OPERATIONS
  Add(yy) = PRE yy /: x THEN x := x \/ {yy} END;
  NextMode = PRE mode<3 THEN mode := mode+1 END
END

