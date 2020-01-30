MACHINE MaxOfEmptySet
CONSTANTS nrs
PROPERTIES
 nrs <: NATURAL1 &
 max(nrs) = 3 /* &  Without the condition below we may take the max of the empty set
 nrs /= {} */
VARIABLES xx
INVARIANT
 xx:nrs
INITIALISATION xx::nrs
END

