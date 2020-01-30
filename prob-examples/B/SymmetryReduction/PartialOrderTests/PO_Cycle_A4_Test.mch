MACHINE PO_Cycle_A4_Test
SETS
 ID={aa,bb,cc}
VARIABLES xx, yy
INVARIANT
 xx:ID & yy:0..2 
ASSERTIONS
  (yy=2 => xx=aa)   // The current POR A4 Cycle detection has a mistake which prevents finding this assertion violation in most cases; if the assertion is in the invariant the error seems to be found always
INITIALISATION xx::{aa,bb} || yy := 0
OPERATIONS
  Sety = SELECT yy:0..1 THEN yy := 1 END;
  Setxaa = SELECT xx:{aa,bb} THEN xx := aa END;
  Setxbb = SELECT xx:{aa,bb} THEN xx := bb END;
  Setxaabbcc = SELECT xx:{aa,bb} THEN xx :: {aa,bb} END;

//  GoToDeadlock = SELECT yy=1 & xx=aa THEN xx := cc || yy:= 2 END
  TryGoToDeadlock = SELECT yy=1 THEN yy:= 2 END
END

