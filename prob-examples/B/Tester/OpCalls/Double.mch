MACHINE Double
VARIABLES xx
INVARIANT
 xx:NAT
INITIALISATION xx:=1
OPERATIONS
  Double = PRE xx < MAXINT/2 THEN xx := xx+xx END;
  Add(vv) = PRE vv:1..10 & xx+vv <= MAXINT THEN xx:=xx+vv END
END

