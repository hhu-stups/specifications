MACHINE DefDouble
SETS
 ID={aa,bb,cc,dd,ee}
DEFINITIONS
 twice(x) == (x;x) ;
 double(x,y) == BEGIN x:=y;x:=y END
VARIABLES xx, c
INVARIANT
 xx:ID <-> ID & c:NATURAL
INITIALISATION xx:={aa|->bb, bb|->cc, cc|->dd, dd|->ee} || c:=0
OPERATIONS
  Add2 = double(c,c+1);
  ctr <-- Getc = BEGIN ctr := c END;
  res <-- GetRel = BEGIN res := xx END;
  Compose = BEGIN xx := twice(xx) END;
  Compose2 = BEGIN xx := twice(twice(xx)) END;
  Reset = BEGIN xx:={aa|->bb, bb|->cc, cc|->dd, dd|->ee}  END
END

