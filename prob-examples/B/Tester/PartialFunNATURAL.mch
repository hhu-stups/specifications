MACHINE PartialFunNATURAL
SETS
 ID={aa,bb}
VARIABLES f
INVARIANT
 f:INTEGER +-> ID
INITIALISATION f:={}
OPERATIONS
  res <-- IsPFunNATURAL = IF f:NATURAL +-> ID THEN res := TRUE ELSE res := FALSE END;
  res <-- IsPFunNATURAL1 = IF f:NATURAL1 +-> ID THEN res := TRUE ELSE res := FALSE END;
  res <-- IsPFunINTEGER = IF f:INTEGER +-> ID THEN res := TRUE ELSE res := FALSE END; 
  res <-- IsPInjNATURAL = IF f:NATURAL >+> ID THEN res := TRUE ELSE res := FALSE END;  
  res <-- IsPInjNATURAL1 = IF f:NATURAL1 >+> ID THEN res := TRUE ELSE res := FALSE END;   
  res <-- IsPSurjNATURAL = IF f:NATURAL +->> ID THEN res := TRUE ELSE res := FALSE END;  
  res <-- IsPSurjNATURAL1 = IF f:NATURAL1 +->> ID THEN res := TRUE ELSE res := FALSE END;   
  res <-- IsPBijNATURAL = IF f:NATURAL >+>> ID THEN res := TRUE ELSE res := FALSE END;  
  res <-- IsPBijNATURAL1 = IF f:NATURAL1 >+>> ID THEN res := TRUE ELSE res := FALSE END; 
  Reset = BEGIN f := {} END;
  SetfM1(yy) = PRE yy:ID THEN f(-1):= yy END;
  Setf0(yy) = PRE yy:ID THEN f(0):= yy END;
  Setf1(yy) = PRE yy:ID THEN f(1):= yy END;
  Setf2(yy) = PRE yy:ID THEN f(2):= yy END;
  Setf8(yy) = PRE yy:ID THEN f(8):= yy END;
  Setf888(yy) = PRE yy:ID THEN f(888):= yy END
END

