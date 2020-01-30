MACHINE Pigenhole
DEFINITIONS
 SET_PREF_KODKOD == FALSE
SETS
 Pigeons;Holes
CONSTANTS n,occupies
PROPERTIES
 n = 100 &
 card(Pigeons) = n &
 card(Holes) = n-1 &
 occupies : Pigeons >-> Holes // fast because of ProB built-in card check
// occupies : Pigeons --> Holes & !(x,y).(x/=y => occupies(x)/=occupies(y))
END

