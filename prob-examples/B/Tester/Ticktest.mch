MACHINE Ticktest
/* Tests whether the animator can deal with CSP-named events */
SETS
 ID={aa,bb}
CONSTANTS iv
PROPERTIES
 iv:ID
VARIABLES xx
INVARIANT
 xx:ID
INITIALISATION xx:=iv
OPERATIONS
  tick(yy) = PRE yy:ID THEN xx:= yy END;
  i = BEGIN xx := aa END;
  tau(zz) = PRE zz=xx THEN skip END
END

