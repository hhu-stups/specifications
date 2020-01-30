MACHINE NoDeadlock
/* to check if the deadlock CBC check detects quickly that this machine cannot deadlock */
CONSTANTS f
PROPERTIES
 f:1..20 --> BOOL &
 (not(#c.(c=1)) => 1>2)
 /* & (not(#c.(c = 1/0)) => 1>2) */ /* should raise WD error and it does */
 & not(#c.(c=c+1))
VARIABLES xx
INVARIANT
 xx:1..20
INITIALISATION xx::1..20
OPERATIONS
  Set(c) = PRE c=card(f) THEN xx:= c END
END

