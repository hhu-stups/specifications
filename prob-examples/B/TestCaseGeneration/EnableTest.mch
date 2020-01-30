MACHINE EnableTest
SETS
 ID={aa,bb}
CONSTANTS iv
PROPERTIES
 iv:ID
VARIABLES xx, zz
INVARIANT
 xx:ID & zz: 0..10
INITIALISATION xx:=iv || zz:= 0
OPERATIONS
  TARGET8= PRE zz>8 THEN skip END;
  INDEP(yy) = PRE yy:ID THEN xx:= yy END;
  FIVE = BEGIN zz := 5 END;
  DEC = PRE zz>0 THEN zz := zz-1 END /* ;
  FourToTen = PRE zz=4 THEN zz := zz+zz+1 END */
END

