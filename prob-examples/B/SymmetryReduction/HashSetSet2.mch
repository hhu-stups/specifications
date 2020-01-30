MACHINE HashSetSet2
/* A test to see whether we can detect a difference between hash marker and full symmetry */
SETS
 ID
DEFINITIONS scope_ID == 5
VARIABLES ssi
INVARIANT
 ssi:POW(POW(ID))
INITIALISATION ssi:={}
OPERATIONS
  Add(x,y) = PRE x:ID & y:ID & {x,y}/:ssi THEN ssi:= ssi \/ {{x,y}} END
END

