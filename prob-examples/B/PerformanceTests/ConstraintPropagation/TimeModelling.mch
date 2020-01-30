MACHINE TimeModelling
/* Test whether with ProB we can solve some simple constraints on task scheduling */
DEFINITIONS SET_PREF_MAXINT == 1024; SET_PREF_CLPFD == TRUE
SETS Tasks = {t1,t2,t3,t4}
CONSTANTS duration, start, end
PROPERTIES
 duration: Tasks --> NATURAL1 &
 start: Tasks --> NATURAL &
 end: Tasks --> NATURAL1 &
 duration(t1)=3 & duration(t2) = 2 & duration(t3) : 2..3 & duration(t4) = 2 &
 !t.(t:Tasks => end(t) = start(t)+duration(t)) &
 start(t2) >= end(t1) & start(t3) >= end(t1) & 
 start(t4) >= end(t2) & start(t4) >= end(t3) &
 start(t1) >= 1000 & end(t4) <= 1007 
VARIABLES time, active
INVARIANT time:NATURAL & active <: Tasks
INITIALISATION time:=999 || active := {}
OPERATIONS
  s,e <-- Get(yy) = PRE yy:Tasks THEN s,e:= start(yy),end(yy) END;
  
  /* just an operations to illustrate the solution to the PROPERTIES above in the state space */
  tick(a,r) = PRE a=start~[{time}] & r=end~[{time}] THEN
     time := time+1 || active := (active - r) \/ a END
END

