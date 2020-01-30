MACHINE WhileLoopInvariantError
VARIABLES xx
INVARIANT
 xx:NATURAL
INITIALISATION xx:=1
OPERATIONS
  Set(c) = PRE c:1..10 & xx<=c THEN
    WHILE xx < c DO
      xx := xx+1
    INVARIANT
      xx <= c & 
      xx:NATURAL &
      xx<10 /* this is wrong */
    VARIANT
      c-xx
    END
  END;
  r <-- Get = BEGIN r:= xx END
END

