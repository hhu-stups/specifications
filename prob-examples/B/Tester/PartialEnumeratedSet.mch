MACHINE PartialEnumeratedSet
/* check if ProB can deal with a partially enumerated set */
SETS
 ID
CONSTANTS iv
PROPERTIES
 iv:ID & card(ID)=2
VARIABLES xx
INVARIANT
 xx:ID
INITIALISATION xx:=iv
OPERATIONS
  IsIv = PRE xx=iv THEN skip END;
  IsNotIv = PRE xx/=iv THEN skip END;
  Set(yy) = PRE yy:ID THEN xx:= yy END
END

