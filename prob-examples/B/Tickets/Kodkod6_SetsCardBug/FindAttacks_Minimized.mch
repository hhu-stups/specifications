MACHINE FindAttacks_Minimized
// minimized version: removing constraints as much as possible while keeping bug of Kodkod
DEFINITIONS
 SET_PREF_KODKOD == TRUE
SETS
 ARGUMENTS={A,B,C}
CONSTANTS attacks
PROPERTIES
   attacks : ARGUMENTS <-> ARGUMENTS &
   dom(attacks) = ARGUMENTS &
   card(attacks) < 2
END

