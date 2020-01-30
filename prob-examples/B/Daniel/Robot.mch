/* Example taken from:
   J. Groslambert. Verification of LTL on B Event Systems. In B2007
*/

MACHINE
  Robot

/* LTL - Formulas:
  a) Unload only when output is free
     G(({Dt=TRUE} & X{Dt=FALSE}) -> {De=FALSE})
  b) When output is not free, it is inevitably free
     G({Dt=TRUE} -> (F{Dt=FALSE}))
  c) If after a certain time, there is always at least one 
     piece on the system, then both platforms are infinitely
     often busy
     FG{Dt=TRUE or De=TRUE} -> GF{Dt=TRUE & De=TRUE}
*/

VARIABLES
  De,Dt
INVARIANT
  Dt:BOOL & De:BOOL
INITIALISATION
  Dt := FALSE || De := FALSE
OPERATIONS
  Load = SELECT Dt = FALSE
         THEN Dt := TRUE
         END;
  Unload = SELECT Dt = TRUE
                & De = FALSE
           THEN Dt := FALSE
             || De := TRUE
           END;
  Discard = SELECT De = TRUE
            THEN De := FALSE
            END
END
