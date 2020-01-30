MACHINE PO_Cycle_A4_Test_Inv
SETS
 ID={aa,bb,cc}
VARIABLES xx, yy, zz
INVARIANT
 xx:ID & yy:ID
       & zz:{aa,bb}
ASSERTIONS
  zz:{aa,bb}
INITIALISATION xx::{aa,bb} || yy := aa || zz := aa
OPERATIONS
//  Sety = BEGIN yy := 1 END;
  Incy = BEGIN yy :: ID END;
  Setxaa = BEGIN xx := aa END;
  Setxbb = BEGIN xx := bb END;
  Setxaabbcc = BEGIN xx :: {aa,bb} END;

//  GoToDeadlock = SELECT yy=1 & xx=aa THEN xx := cc || yy:= 2 END
  ViolateINV= SELECT yy=cc THEN zz := cc END
END

