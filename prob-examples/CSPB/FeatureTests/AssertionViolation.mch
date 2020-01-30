MACHINE AssertionViolation
CONSTANTS a
PROPERTIES
  a:2..3
ASSERTIONS 
 /*@label thmfalse */ a <3 // wrong
VARIABLES xx
INVARIANT
 xx:NATURAL
INITIALISATION xx:=a
OPERATIONS
  Inc = BEGIN xx:=xx+1 END
END

