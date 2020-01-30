MACHINE ComprehensionTest
SETS
 ID={aa,bb,cc}
CONSTANTS iv
PROPERTIES
 iv:ID
VARIABLES xx
INVARIANT
 xx:ID
INITIALISATION xx:=iv
OPERATIONS
  Set(yy) = PRE yy:ID THEN xx:= yy END;
  res <-- Diff(yy) = PRE yy:ID THEN res:= {zz|zz:ID & zz /=yy} END
END

