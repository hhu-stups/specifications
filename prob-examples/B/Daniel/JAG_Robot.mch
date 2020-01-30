MACHINE JAG_Robot
/*
 Example from Groslambert, B2007
 LTL
 The original LTL as from the B2007 paper:
  G( ({Dt=TRUE} & X {Dt=FALSE}) -> {De=FALSE})  -> TRUE in 0.00 s
 A more natural encoding of the above:
  G( [Unload] -> {De=FALSE})  -> TRUE in 0.00 s
*/
VARIABLES
 De, Dt
INVARIANT
 Dt:BOOL & De:BOOL
INITIALISATION
 Dt := FALSE || De := FALSE
OPERATIONS
 Load = SELECT Dt=FALSE THEN
           Dt := TRUE
        END;
 Unload = SELECT Dt=TRUE & De=FALSE THEN
           Dt := FALSE || De := TRUE
          END;
 Discard = SELECT De = TRUE THEN
            De := FALSE
           END
END

