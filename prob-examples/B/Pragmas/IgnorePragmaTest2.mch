MACHINE IgnorePragmaTest2
DEFINITIONS SET_PREF_USE_IGNORE_PRAGMAS == TRUE
SETS
 ID={aa,bb}
CONSTANTS x,y,z
PROPERTIES
 x : INTEGER &
 y : NATURAL &
 x = 200 &
 y = x+x &
 x > y /*@desc prob-ignore */ &
 !zz.(zz>y => y mod zz = y) &
 z>22 & z<24
END
