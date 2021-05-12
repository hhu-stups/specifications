MACHINE WhileSeqTest
SETS
 ID={aa,bb}
CONSTANTS iv
PROPERTIES
 iv:ID
VARIABLES xx, ff
INVARIANT
 xx:ID & ff:1..1 --> (1..5 --> BOOL)
INITIALISATION xx:=iv || ff := [[TRUE,TRUE,FALSE,FALSE,TRUE]]
OPERATIONS
  Set(yy) = PRE yy:ID THEN xx:= yy END;
  res <-- Compute = VAR zz IN
              zz := 1;
              WHILE zz<10 DO
                zz := zz+3
              INVARIANT zz:1..12
              VARIANT 12-zz
              END;
                res := zz+ 100 / zz
           END;
  Test13 = BEGIN
            ff(1)(3) := TRUE
         END;
  Test16 = BEGIN
            ff(1)(6) := TRUE
         END;
  Test21 = BEGIN
            ff(2)(1) := TRUE
         END
END

