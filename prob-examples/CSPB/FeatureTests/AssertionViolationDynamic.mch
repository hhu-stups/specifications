MACHINE AssertionViolationDynamic
CONSTANTS a
PROPERTIES
  a:2..3
ASSERTIONS 
 /*@label thmfalse */ xx <= a+2 // wrong
VARIABLES xx
INVARIANT
 xx:NATURAL
INITIALISATION xx:=a
OPERATIONS
  Inc = BEGIN xx:=xx+1 END
END

