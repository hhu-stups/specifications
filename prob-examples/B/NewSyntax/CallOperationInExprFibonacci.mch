MACHINE CallQueryOperationInExpreFibonacci
DEFINITIONS SET_PREF_ALLOW_OPERATION_CALLS_IN_EXPRESSIONS == TRUE
SETS
 ID={aa,bb}
VARIABLES jj
INVARIANT
 jj:ID
INITIALISATION jj:=aa
OPERATIONS
  r <-- Fibonacci(x) = PRE x:NATURAL THEN
          IF x <= 2 THEN
             r := 1
          ELSE
             r := Fibonacci(x-1)+Fibonacci(x-2)
          END
        END;
  r <-- FibonacciE(x) = PRE x:NATURAL THEN
          r := IF x <= 2 THEN
             1
          ELSE
             FibonacciE(x-1)+FibonacciE(x-2)
          END
        END;
  r <-- Factorial(x) = PRE x:NATURAL THEN
          IF x <= 1 THEN
             r := 1
          ELSE
             r := x*Factorial(x-1)
          END
        END
ASSERTIONS
  Fibonacci(7) = 13;
  Factorial(5) = 120
END

