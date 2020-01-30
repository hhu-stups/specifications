MACHINE NonDetChoicesOpViewTest
// check that non-deterministic assignments are shown in the operations/event view
SETS
 ID={aa,bb,cc}
CONSTANTS iv
PROPERTIES
 iv:ID
VARIABLES xx,yy
INVARIANT
 xx:ID & yy:ID
INITIALISATION xx :: ID || yy :: (ID \ {iv})
OPERATIONS
  ChooseByChoice = CHOICE xx := aa OR xx:= bb END;
  ChooseNonDet1 = BEGIN xx :: ID\{xx} END;
  ChooseNonDet2 = BEGIN xx :: ID\{xx} || yy :: (ID\{iv}) END;
  ChooseNonDet3 = BEGIN xx,yy : (xx /= yy) END;
  ChooseNonDet4 = SELECT xx /= yy THEN xx := yy ELSE yy := aa END;
  ChooseNonDet5 = ANY v WHERE v:ID \ {xx} THEN xx := v END;
  ChooseNonDet6 = SELECT xx /= yy THEN
                      ANY vv WHERE vv:ID THEN xx := vv END
                  END;
  ChooseDet1 = SELECT xx/=yy THEN xx:=yy END
END
