MACHINE Loop
INCLUDES M1
OPERATIONS
 Set =
 BEGIN
     WHILE xx < k
   DO
       Inc  // defined by Inc = PRE xx < k THEN xx := xx + 1 END;
   INVARIANT xx : 1..k
   VARIANT k - xx
   END
 END;
 r <-- Get = BEGIN r:= xx END
END
