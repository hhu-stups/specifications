MACHINE IgnorePragmaTest
DEFINITIONS SET_PREF_USE_IGNORE_PRAGMAS == TRUE
SETS
 ID={aa,bb}
CONSTANTS x,y
PROPERTIES
 x : INTEGER &
 y : NATURAL &
 x = 200 &
 y = x+x &
 x > y /*@desc prob-ignore */
 
END