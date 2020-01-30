MACHINE RelationOverSetSet
/* A test to see whether we can detect a difference between hash marker and full symmetry */
SETS
 ID
DEFINITIONS scope_ID == 2
VARIABLES ssi
INVARIANT
 ssi:POW(POW(ID)) <-> POW(POW(ID))
INITIALISATION ssi:={}
OPERATIONS
  Add(x,y) = PRE x:POW(POW(ID)) & y:POW(POW(ID)) & x|->y/:ssi &
                 card(ssi)<3 THEN ssi:= ssi \/ {x|->y} END
END




