MACHINE HashSetSet
SETS
 ID
DEFINITIONS scope_ID == 3
VARIABLES ssi
INVARIANT
 ssi:POW(POW(ID))
INITIALISATION ssi:={}
OPERATIONS
  Add(yy) = PRE yy<:ID & yy/:ssi THEN ssi:= ssi \/ {yy} END
END

