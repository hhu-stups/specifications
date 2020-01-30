MACHINE Test_Inv_Reduction
// 13 States, 110 Operations with POR, exactly the same with POR !
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
  Setxaa = BEGIN xx := aa END;
  Setxbb = BEGIN xx := bb END;
  Setxaabbcc = BEGIN xx :: {aa,bb} END;

  Setyy = BEGIN yy := bb END;

  Setzz =  BEGIN zz := bb END;
  Setzz2 = SELECT zz=bb & zz=aa
           THEN zz:= cc END
END

