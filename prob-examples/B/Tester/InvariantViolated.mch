MACHINE InvariantViolated
VARIABLES xx
INVARIANT
 xx:1..10 & xx /= 2
INITIALISATION xx:=1
OPERATIONS
  Inc = PRE xx<10 THEN xx:=xx+1 END
END

