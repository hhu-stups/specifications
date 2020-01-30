MODEL
   Counter
VARIABLES cnt
INVARIANT cnt:NATURAL
INITIALISATION cnt:= 0
OPERATIONS
  inc = cnt := cnt+1;
  dec = PRE cnt>0 THEN cnt := cnt-1 END;
  reset = BEGIN cnt := 0 END
END
