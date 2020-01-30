MACHINE MinOfEmptySet
CONSTANTS nrs
PROPERTIES
 nrs <: 1..5 &
 min(nrs) = 3 /* &  Without the condition below we may take the min of the empty set
 nrs /= {} */
VARIABLES xx
INVARIANT
 xx:nrs
INITIALISATION xx::nrs
END

