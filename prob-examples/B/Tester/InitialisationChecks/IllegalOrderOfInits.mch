MACHINE IllegalOrderOfInits
SETS
 ID={aa,bb}
CONSTANTS iv
PROPERTIES
 iv = aa
VARIABLES xx,yy
INVARIANT
 xx:ID & yy:ID
INITIALISATION xx:=yy ; yy := iv
END

