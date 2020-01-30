MACHINE ID_Propagation
CONSTANTS ii, s1, s2
PROPERTIES
 ii = id(s1) &  s1 <: s2 &
 ii[s2] = 1..10 & s2 = 0..13 
VARIABLES xx
INVARIANT
 xx:s1
INITIALISATION xx:=min(s1)
OPERATIONS
 c <-- CardS1 = BEGIN c := card(s1) END
END

