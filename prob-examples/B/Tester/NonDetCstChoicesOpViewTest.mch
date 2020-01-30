MACHINE NonDetCstChoicesOpViewTest
SETS
 ID={aa,bb,cc}
CONSTANTS iv, iw
PROPERTIES
 iv:ID & iw = aa
VARIABLES xx,yy
INVARIANT
 xx:ID & yy:ID
INITIALISATION xx:=iw || yy :: {iv,iw}
OPERATIONS
  Set(yyz) = PRE yyz:ID THEN xx:= yyz END
END

