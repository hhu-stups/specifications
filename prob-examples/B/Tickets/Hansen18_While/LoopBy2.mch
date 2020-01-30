MACHINE LoopBy2
INCLUDES M1
OPERATIONS
 Set = 
 BEGIN
     WHILE xx+10 <= k
   DO
       IncBy(10)
   INVARIANT xx : 1..k
   VARIANT k - xx
   END
 END;
 r <-- Get = BEGIN r:= xx END
END