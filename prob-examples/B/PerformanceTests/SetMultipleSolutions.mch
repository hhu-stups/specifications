MACHINE SetMultipleSolutions
SETS
 ID={aa,bb}
DEFINITIONS SET_PREF_MAX_INITIALISATIONS == 2
 /* check that max_reached not triggered */
CONSTANTS sol
PROPERTIES
 sol <: -1..10 &
 card(sol) = 3 &
 SIGMA(x).(x:sol|x) = 27
END

