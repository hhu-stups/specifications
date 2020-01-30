MACHINE BinPacking_UnicodeMinus
// below we use a unicode minus twice for --> 
SETS
  OBJECTS = {o1, o2, o3, o4, o5, o6, o7}
DEFINITIONS
  sol(xx) == (xx : OBJECTS −−> (1..card(OBJECTS)));
CONSTANTS aa
PROPERTIES
  sol(aa)
END

