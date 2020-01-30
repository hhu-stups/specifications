MACHINE SubstSetInTests
SETS
 ID={aa,bb}
CONSTANTS iv
PROPERTIES
 iv:ID
VARIABLES xc,xs
INVARIANT
 xc:ID*ID & xs: POW(ID)
INITIALISATION xc,xs := aa|->bb,{aa,bb}
OPERATIONS
  Setc(yy) = PRE yy:ID THEN xc:: {yy}*{yy} END;
  Setc2 = BEGIN xc:: ID*ID END;
  a,b <-- Getc = BEGIN a,b := prj1(ID,ID)(xc),prj2(ID,ID)(xc) END;
  Sets = BEGIN xs :: {x|x:POW(ID) & x <: xs} END;
  r <-- is_el(e) = PRE e:ID THEN
                    IF e:xs THEN r:= TRUE ELSE r:= FALSE END
                   END
END

