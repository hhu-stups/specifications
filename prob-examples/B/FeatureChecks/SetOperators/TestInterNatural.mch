MACHINE TestInterNatural
DEFINITIONS
SET_PREF_MAXINT == 10
VARIABLES xx
INVARIANT
 xx <: NATURAL &
  xx - NATURAL = {}  /* test that NATURAL is not expanded and 2**33 not removed */
ASSERTIONS
 xx - NATURAL = {}
 
INITIALISATION xx:={2**33}
OPERATIONS
  Add(yy) = PRE yy:NATURAL & yy /: xx THEN xx:= xx \/ {yy} END;
  r <-- GetxxMinusNATURAL = BEGIN r:= xx-NATURAL END;
  r <-- GetxxMinusNATURAL1 = BEGIN r:= xx-NATURAL1 END
END

