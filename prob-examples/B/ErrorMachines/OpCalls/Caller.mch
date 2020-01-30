MACHINE Caller
INCLUDES CounterPre
VARIABLES y
INVARIANT y:NATURAL
INITIALISATION y:=2
OPERATIONS
  up = inc || y:= y+1;
  down = PRE y>0 THEN dec || y := y-1 END  /* may call dec outside of its precondition */
END