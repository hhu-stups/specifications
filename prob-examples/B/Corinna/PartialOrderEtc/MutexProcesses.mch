MACHINE MutexProcesses
/* For this machine the symmetry reduction already seems to achieve most/all of what
   one could achieve with partial order reduction */
SETS
 PID;
 STATE = {init,work,request,critical}
VARIABLES pid_state
INVARIANT
 pid_state: PID --> STATE & card(pid_state~[{critical}]) < 2
INITIALISATION pid_state:=%pp.(pp:PID|init)
OPERATIONS
  Start(p) = PRE p:PID & pid_state(p)=init THEN
     pid_state(p) := work
  END;
  Request(p) = PRE p:PID & pid_state(p)=work THEN
     pid_state(p) := request
  END;
  Enter_Critical_Section(p) = PRE p:PID & pid_state(p)=request & pid_state~[{critical}] = {} THEN
     pid_state(p) := critical
  END;
  Leave_Critical_Section(p) = PRE p:PID & pid_state(p)=critical THEN
     pid_state(p) := work
  END
END

