MACHINE ID_not_declared
SETS
 ID={aa,bb,cc}
CONSTANTS iv,w /* s not declared */
PROPERTIES
 iv:ID & s = {bb,cc} &
 iv:s & w:s
VARIABLES x
INVARIANT x:s
INITIALISATION x:= bb
END

