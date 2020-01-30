MACHINE
   	Jar
CONSTANTS
	nb
PROPERTIES
	nb = 2
VARIABLES
	jars, maxs
INVARIANT
	jars : (1..2) * NAT &
	maxs : (1..2) * NAT
INITIALISATION
	jars := {1 |-> 0, 2 |-> 0} ||
	maxs := {1 |-> 5, 2 |-> 3}
OPERATIONS
	fill( ii ) = 
		PRE ii:1..nb
		THEN jars(ii) := maxs(ii)
		END
END