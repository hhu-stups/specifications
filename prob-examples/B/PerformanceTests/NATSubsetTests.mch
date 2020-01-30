MACHINE NATSubsetTests
DEFINITIONS 
  SET_PREF_MAXINT == 2147483647 
VARIABLES els
INVARIANT
 els<:INTEGER
INITIALISATION els := 1..100
OPERATIONS
  add(el) = PRE el:INTEGER & el /: els THEN els := els \/ {el} END;
  r <-- SubsetNAT = IF els <: NAT THEN r:= TRUE ELSE r:= FALSE END;
  r <-- SubsetNAT1 = IF els <: NAT1 THEN r:= TRUE ELSE r:= FALSE END;
  r <-- SubsetNATURAL = IF els <: NATURAL THEN r:= TRUE ELSE r:= FALSE END;
  r <-- SubsetNATURAL1 = IF els <: NATURAL1 THEN r:= TRUE ELSE r:= FALSE END;
  r <-- SubsetINT = IF els <: INT THEN r:= TRUE ELSE r:= FALSE END;
  r <-- SubsetINTEGER = IF els <: INTEGER THEN r:= TRUE ELSE r:= FALSE END;
  r <-- SubsetITSELF = IF els <: els THEN r:= TRUE ELSE r:= FALSE END;
  r <-- StrictSubsetITSELF = IF els <<: els THEN r:= TRUE ELSE r:= FALSE END;
  r <-- SSubsetNATE = IF els <: NAT & #x.(x:NAT & x/:els) THEN r:= TRUE ELSE r:= FALSE END;
  r <-- SSubsetNAT = IF els <<: NAT THEN r:= TRUE ELSE r:= FALSE END; /* this one & the one below take very long ! */
  r <-- SSubsetNAT1 = IF els <<: NAT1 THEN r:= TRUE ELSE r:= FALSE END;
  r <-- SSubsetNATURAL = IF els <<: NATURAL THEN r:= TRUE ELSE r:= FALSE END;
  r <-- SSubsetNATURAL1 = IF els <<: NATURAL1 THEN r:= TRUE ELSE r:= FALSE END;
  r <-- SSubsetINT = IF els <<: INT THEN r:= TRUE ELSE r:= FALSE END;
  r <-- SSubsetINTEGER = IF els <<: INTEGER THEN r:= TRUE ELSE r:= FALSE END
END

