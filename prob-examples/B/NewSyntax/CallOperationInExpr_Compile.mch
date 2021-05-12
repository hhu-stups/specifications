MACHINE CallQueryOperationInExpr_Compile
DEFINITIONS SET_PREF_ALLOW_OPERATION_CALLS_IN_EXPRESSIONS == TRUE
SETS
 ID={aa,bb}
VARIABLES counter, func
INVARIANT
  counter:1..10 & func: INTEGER <-> INTEGER
INITIALISATION counter:=1 || func := {}
OPERATIONS
  IncCounter = PRE counter < 10 THEN counter := counter+1 END;
  r <-- Double(x) = PRE x:0..255 THEN r := (x+x) mod 255 END;
  r <-- MulCtr(y) = PRE y:0..255 THEN r := (y*counter) mod 255 END;
  r <-- Test1 = BEGIN r := MulCtr(Double(2)*Double(3)) END;
  r <-- Test2 = BEGIN r := func(Double(2)*Double(3)) END;
  SetFunc = BEGIN func := %xx.(xx:0..255|MulCtr(xx)) END;
  SetFunc2 = BEGIN func := %xx.(xx:NATURAL|MulCtr(xx)) END
ASSERTIONS
  Double(2) = 4;
  Double(128) = 1
END

