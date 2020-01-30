MACHINE QueryOperations
DEFINITIONS SET_PREF_COMPRESSION == FALSE
SETS
 ID={aa,bb}
CONSTANTS iv
PROPERTIES
 iv:ID
VARIABLES xx, cnt, zz
INVARIANT
 xx:ID & cnt:NATURAL & zz : POW(NATURAL)
INITIALISATION xx:=iv || cnt := 0 || zz := (1..1000 \/ 2000..3000) \ {2001}
OPERATIONS
  Set(yy) = PRE yy:ID THEN xx:= yy END;
  Incr = PRE cnt < 1000 THEN cnt := cnt+1 END;
  rr <-- IsActive(yy) = PRE yy:ID THEN rr := bool(xx=yy) END
END

