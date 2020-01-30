MODEL
   Scalar0
VARIABLES z
INVARIANT z:NAT
INITIALISATION z:=0
OPERATIONS
  modify(v) = PRE v:NAT THEN z:=v END;
  v <-- value = v:=z
END