MACHINE LoopByDouble
INCLUDES M1
OPERATIONS
 Set = 
 VAR step IN
   step := 1;
     WHILE xx+2*step <= k
   DO
       step <-- IncByTwoStep(step,step)
   INVARIANT xx : 1..k
   VARIANT k - xx
   END
 END;
 r <-- Get = BEGIN r:= xx END
END