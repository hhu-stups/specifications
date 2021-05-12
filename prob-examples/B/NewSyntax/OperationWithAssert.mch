MACHINE ExpressionOperationWithAssert
DEFINITIONS SET_PREF_ALLOW_OPERATION_CALLS_IN_EXPRESSIONS == TRUE
OPERATIONS
  r1<-- Test1(x) =
    PRE x : 1..10
    THEN
      r1 :=  x + 1
      ;ASSERT r1 : NATURAL THEN skip END
    END;
  r1<-- Fact(x) =
    PRE x : 1..100
    THEN
      IF x=1 THEN
        r1 := 1
      ELSE
        r1 :=  x*Fact(x-1)
      END
      ;
      ASSERT r1 : NATURAL THEN skip END
    END
ASSERTIONS
  Test1(10)=11
END
