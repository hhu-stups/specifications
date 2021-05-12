MACHINE CallQueryOperationInExpression
DEFINITIONS SET_PREF_ALLOW_OPERATION_CALLS_IN_EXPRESSIONS == TRUE
INCLUDES CallQueryOps
SETS
 ID={aa,bb}
VARIABLES jj
INVARIANT
 jj:ID & Double(2)=4
INITIALISATION jj:=aa
OPERATIONS
  r <-- Get2 = BEGIN r := 2 END;
  r <-- Double2(x) = BEGIN r <-- Double(x) END;
  r <-- Double3(x) = PRE x:0..Double(2) THEN
     r := Double2(x)
    END
 // r <-- Cyclic(x) = PRE x:0..2 & r:INTEGER THEN
 //    r := Cyclic(x)
 //   END
ASSERTIONS
  2 = Double(1);
  Double3(Double3(2)) = 8
//  Get2 = Double(1)  does not work yet
END

