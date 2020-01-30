MACHINE           Body

VARIABLES         loopnn

INVARIANT         loopnn : NAT1

INITIALISATION    loopnn := 1

OPERATIONS

vv <-- value = vv := loopnn;

dd <-- body(ii,cc) = 
  PRE ii : NAT & cc : NAT
  THEN loopnn := loopnn + ii || dd := cc + 1
  END

END
