MACHINE Peterson3
DEFINITIONS
 ASSERT_LTL == "WEF => GF [cs(0)]"
CONSTANTS N, PID
PROPERTIES
 N=3 & PID = 0..N-1
VARIABLES counter, step, pos
INVARIANT
   counter: NATURAL
 & step: PID --> PID
 & pos: PID --> PID
INITIALISATION counter := 0 || step := %x.(x:PID|0) || pos := %x.(x:PID|0)
OPERATIONS
cs(j) = PRE j:PID THEN counter := counter+1 END;
reset(j) = PRE j:PID THEN pos(j) := 0 || counter := counter-1 END;
update(j,p,i) = PRE j:PID & p:PID & i:1..2 THEN 
      IF i=1 THEN pos(p) := j ELSE step(j) := p END END;
idle(p,j) = PRE j:PID & p:PID & (step(j) /= p or (!(k).(k:PID\{p} => pos(k)<j))) 
            THEN skip END

END
