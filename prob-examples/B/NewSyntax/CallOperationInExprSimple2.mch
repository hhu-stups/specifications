MACHINE CallOperationInExprSimple2
DEFINITIONS SET_PREF_ALLOW_OPERATION_CALLS_IN_EXPRESSIONS == TRUE
SETS
 ID={aa,bb}
VARIABLES jj
INVARIANT
 jj:ID
INITIALISATION jj:=aa
OPERATIONS
  r <-- Double(x) = PRE x:0..255 THEN r := (x+x) mod 255 END;
  r <-- Divisors(x) = PRE x:1..255 THEN
         VAR i IN
            i := 1; r:=0;
            WHILE i*i <= x DO
              IF x mod i = 0 THEN
                 r := r+1  // used to be detected as reading output !
              END;
              i:=i+1
              INVARIANT i : 1..(x+1)
              VARIANT x-i
            END
         END
        END;
  r <-- Test = BEGIN r := Divisors(Double(2)*Double(3)) END
ASSERTIONS
  Double(2) = 4;
  Double(128) = 1;
  Divisors(3) = 2;
  Divisors(4) = 3
END

