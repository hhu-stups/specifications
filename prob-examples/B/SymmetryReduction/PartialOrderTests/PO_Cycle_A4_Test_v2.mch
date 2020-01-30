MACHINE PO_Cycle_A4_Test_v2
SETS
 ID={aa,bb}
VARIABLES xx, yy
INVARIANT
 xx:ID & yy:INTEGER
INITIALISATION xx::ID || yy :: {0,1}
OPERATIONS
  Sety0 = BEGIN yy := 0 END;
  Sety1 = BEGIN yy := 1 END;
 
  Setxaa = BEGIN xx := aa END;
  Setxbb = BEGIN xx := bb END
END

