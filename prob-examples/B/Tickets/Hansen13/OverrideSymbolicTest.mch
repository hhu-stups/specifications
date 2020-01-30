MACHINE OverrideSymbolicTest
/* Test that override substitution works with infinite functions */
VARIABLES x, f
INVARIANT
    x : BOOL &
    f : INTEGER <-> BOOL
INITIALISATION
    x:(x = TRUE) || f := INTEGER*{FALSE}
OPERATIONS
   UpdateF(y) = PRE y:0..4 THEN f(y) := TRUE END;
   OverrideF(z) = PRE z:0..4 THEN f := f <+ {z|-> TRUE} END;
 /*  r <-- GetF5 = BEGIN r := 0..5 <| f END; raises exception */
   r <-- GetF5 = BEGIN r := ([0,1,2,3,4,5]; f) END;
   b <-- GetF(v) = PRE v:0..5 THEN b := f(v) END
END

