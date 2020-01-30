MACHINE WhileFactorial
VARIABLES f
INVARIANT
  f:NATURAL1
INITIALISATION f := 1
OPERATIONS
  res <-- Factorial = 
         VAR i,r IN
            i := 1;
            r := 1;
            WHILE i<f DO
              i := i + 1;
              r := r * i
            INVARIANT i:1..f
            VARIANT f-i
            END;
            res := r
         END;
  IncF = BEGIN f := f+1 END
END

