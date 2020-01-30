MACHINE Time
CONSTANTS Time
PROPERTIES
 Time = %(b,n).(b=FALSE|n) \/ %(b,n).(b=TRUE|n+1) 
VARIABLES cnt
INVARIANT cnt:NATURAL
INITIALISATION cnt := 0
OPERATIONS
 Time_cnt(CLK) = PRE CLK:BOOL THEN
   cnt := Time(CLK,cnt)
 END;
 r <-- GetTime = r:=cnt
END