MACHINE HygMacroTest2
SETS
 ID={aa,bb,cc,dd}
DEFINITIONS
  AB == {aa,bb};
  TEST == {bb|bb:AB}
CONSTANTS iv
PROPERTIES
 iv = {aa|aa:AB}
OPERATIONS
 r <-- getAB = BEGIN r := {aa|aa:AB} END
END

