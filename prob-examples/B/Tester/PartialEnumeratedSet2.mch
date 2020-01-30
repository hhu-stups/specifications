MACHINE PartialEnumeratedSet2
/* check if ProB can deal with a partially enumerated set */
SETS
 ID
CONSTANTS iv,iw
PROPERTIES
 iv:ID & iw:ID & iv/= iw & card(ID)=3
VARIABLES xx
INVARIANT
 xx:ID
INITIALISATION xx:=iv
OPERATIONS
  IsIv = PRE xx=iv THEN skip END;
  IsNotIv = PRE xx/=iv THEN skip END;
  IsIw = PRE xx=iw THEN skip END;
  IsNotIw = PRE xx/=iw THEN skip END;
  Set(yy) = PRE yy:ID THEN xx:= yy END
END
