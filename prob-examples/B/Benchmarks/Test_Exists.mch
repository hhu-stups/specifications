MACHINE Test_Exists
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
  Set(yy) = PRE yy:ID & #(rr).(rr:ID & rr=yy) THEN xx:= yy END;
  Set_fail(yy) = PRE yy:ID & #(rr).(rr:ID & rr/=yy & rr=yy) THEN xx:= yy END;
  Set_true(yy) = PRE yy:ID & not(#(rr).(rr:ID & rr/=yy & rr=yy)) THEN xx:= yy END
END

