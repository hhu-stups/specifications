MACHINE PO_Simple
SETS
 ID={aa,bb}
CONSTANTS iv
PROPERTIES
 iv:ID
VARIABLES xx,yy,zz
INVARIANT
 xx:ID & yy:ID & zz:ID 
INITIALISATION xx:=iv || yy := aa || zz := bb
OPERATIONS
  Set(aa) = PRE aa:ID THEN xx:= aa || yy:= aa || zz := aa END;
  MoveXtoY = BEGIN yy := xx END;
  MOVEXtoZ = BEGIN zz := xx END;
    /*   Partial Order Property: (MoveXtoY ; MOVEXtoZ)   ==   (MOVEXtoZ ; MoveXtoY)  */
  SWAPXY = BEGIN xx := yy || yy := xx END
    /*  Idempotency Property:  (SWAPXY ; SWAPXY)  ==  skip  */
END