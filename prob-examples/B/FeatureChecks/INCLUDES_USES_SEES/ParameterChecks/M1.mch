MACHINE M1(P,p)
CONSTRAINTS
  p:NAT
SETS
 ENUM={aa,bb};
 DEFERRED
CONSTANTS iv
PROPERTIES
 iv:ENUM
INCLUDES M2(P,p+3)
PROMOTES Set2
VARIABLES xx
INVARIANT
 xx:ENUM
INITIALISATION xx:=iv
OPERATIONS
  Set(yy2) = PRE yy2:ENUM THEN xx:= yy2 END;
  q <-- queryVar(yy3) = PRE yy3:ENUM THEN q <-- query1 END;
  q <-- queryCst(yy3) = PRE yy3:ENUM THEN q <-- query2 END
END

