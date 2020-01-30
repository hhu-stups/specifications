MACHINE DefSetTest1
// should be only three possible initialisations
DEFINITIONS SET_PREF_MAX_INITIALISATIONS == 4
SETS
 ID
CONSTANTS iv, iv2, AlloySingleton
PROPERTIES
  card(ID) = 6 &
  iv:ID & iv2 : ID & iv2 /= iv &
  {AlloySingleton} <: ID
//  AlloySingleton <: ID & card(AlloySingleton) = 1 &  AlloySingleton /= {iv}
END

