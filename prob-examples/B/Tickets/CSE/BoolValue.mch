MACHINE BoolValue
DEFINITIONS
 SET_PREF_CSE == TRUE
SETS
 ID={aa,bb}
CONSTANTS iv
PROPERTIES
 iv = aa &
{x| x/: {1,2,10000}} \/ {10000} /= {z|z/:{1,10000,2}} &
{b | b=TRUE <=> {x| x/: {1,2,10000}} \/ {10000} /= {z|z/:{1,10000,2}}} = {TRUE}
END

