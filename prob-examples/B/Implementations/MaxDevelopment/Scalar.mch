MODEL
   Scalar(initval)
CONSTRAINTS initval:NAT
VARIABLES z
INVARIANT z:NAT
INITIALISATION z:=initval
OPERATIONS
  modify(v) = PRE v:NAT THEN z:=v END;
  v <-- value = v:=z
END