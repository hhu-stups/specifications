MACHINE M1
USES M2
ASSERTIONS 
  x = 1
INVARIANT
  x>0
DEFINITIONS
  GOAL == x = 1  // rename_used in bmachine_construction should probably also traverse GOAL Definition
END
