MACHINE IllegalParallelInit
SETS
 ID={aa,bb}
CONSTANTS iv
PROPERTIES
 iv = aa
VARIABLES xx,yy
INVARIANT
 xx:ID & yy:ID
INITIALISATION xx:=iv || yy := xx
END

