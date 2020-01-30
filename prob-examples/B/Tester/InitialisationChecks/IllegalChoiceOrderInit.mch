MACHINE IllegalChoiceOrderInit
SETS
 ID={aa,bb}
CONSTANTS iv
PROPERTIES
 iv = aa
VARIABLES xx,yy
INVARIANT
 xx:ID & yy:ID
INITIALISATION
 CHOICE
  xx:=aa ; yy := bb
 OR
  xx := yy ;
  yy := iv END
END

