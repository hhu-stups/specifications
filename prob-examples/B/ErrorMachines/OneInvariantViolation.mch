MACHINE OneInvariantViolation
VARIABLES xx
INVARIANT
 xx:1..100 & not(xx=20)
INITIALISATION xx:=1
OPERATIONS
  Inc = IF xx<100 THEN xx:= xx+1 END
END

