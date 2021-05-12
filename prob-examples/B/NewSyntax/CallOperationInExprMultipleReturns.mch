MACHINE CallOperationInExprMultipleReturns
DEFINITIONS SET_PREF_ALLOW_OPERATION_CALLS_IN_EXPRESSIONS == TRUE
OPERATIONS
  d,m <-- DivMod2(x) = PRE x:0..255 THEN d := x / 2 || m := x mod 2 END;
  res <-- Sum2(x,y) = PRE x:0..255 THEN res := x*2 + y END
ASSERTIONS
  Sum2(2,1) = 5;
  DivMod2(5) = (2,1);
//  !x.(x:0..100 => Sum2(DivMod2(x)) = x);
 1=1
END

