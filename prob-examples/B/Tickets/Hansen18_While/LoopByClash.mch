MACHINE LoopByClash
INCLUDES M1
OPERATIONS
 Set = 
 VAR aa,bb IN
   aa := 1; bb := 1;
     WHILE xx+aa+bb <= k
   DO
       aa <-- IncByTwoStep1(bb,aa)  /* on purpose use ids that clash with parameters aa,bb */
   INVARIANT xx : 1..k
   VARIANT k - xx
   END
 END;
 r <-- Get = BEGIN r:= xx END
END