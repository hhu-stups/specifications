MACHINE PartialFunCartesianNATURAL
SETS
 ID={aa,bb}
DEFINITIONS
  DOMAIN ==  (NATURAL*NATURAL1*INTEGER);
  DOMAIN1 == (NATURAL1*NATURAL1*NATURAL1)
VARIABLES f
INVARIANT
 f:DOMAIN +-> ID
INITIALISATION f:={}
OPERATIONS
  res <-- IsPFunDOMAIN = IF f:DOMAIN +-> ID THEN res := TRUE ELSE res := FALSE END;
  res <-- IsPFunDOMAIN1 = IF f:DOMAIN1 +-> ID THEN res := TRUE ELSE res := FALSE END;
  res <-- IsPInjDOMAIN = IF f:DOMAIN >+> ID THEN res := TRUE ELSE res := FALSE END;  
  res <-- IsPInjDOMAIN1 = IF f:DOMAIN1 >+> ID THEN res := TRUE ELSE res := FALSE END;   
  res <-- IsPSurjDOMAIN = IF f:DOMAIN +->> ID THEN res := TRUE ELSE res := FALSE END;  
  res <-- IsPSurjDOMAIN1 = IF f:DOMAIN1 +->> ID THEN res := TRUE ELSE res := FALSE END;   
  res <-- IsPBijDOMAIN = IF f:DOMAIN >+>> ID THEN res := TRUE ELSE res := FALSE END;   /* B4Free does not like >+>> */
  res <-- IsPBijDOMAIN1 = IF f:DOMAIN1 >+>> ID THEN res := TRUE ELSE res := FALSE END;  /* B4Free does not like >+>> */
  Reset = BEGIN f := {} END;
  Setf01M1(yy) = PRE yy:ID THEN f(0|->1|->-1):= yy END;
  Setf010(yy) = PRE yy:ID THEN f(0|->1|->0):= yy END;
  Setf111(yy) = PRE yy:ID THEN f(1|->1|->1):= yy END;
  Setf2(yy) = PRE yy:ID THEN f(2|->2|->2):= yy END;
  Setf8(yy) = PRE yy:ID THEN f(8|->8|->8):= yy END;
  Setf888(yy) = PRE yy:ID THEN f(888|->888|->888):= yy END
END

