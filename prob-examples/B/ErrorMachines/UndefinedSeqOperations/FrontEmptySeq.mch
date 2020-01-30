MACHINE FrontEmptySeq
SETS
 ID={aa,bb}
CONSTANTS iv
PROPERTIES
 iv:iseq(ID) & front(iv)=[aa]  /* without the conditions below we may apply last to the empty sequence */
  /* & size(iv)>0 & iv /= [] */
VARIABLES xx
INVARIANT
 xx:ID
INITIALISATION xx:=first(iv)
OPERATIONS
  Set(yy) = PRE yy:ID THEN xx:= yy END
END

