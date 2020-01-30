MACHINE SimpleBakery
CONSTANTS N
PROPERTIES
 N : INTEGER
 & N > 1
DEFINITIONS
 Thread == 1 .. N;

 SBInit == num = %t.(t : Thread| 0)
	 & tstate = %t.(t : Thread| "noncs")
	 & waitingFor = %t.(t : Thread| {});

 SBTypeOK == num : Thread --> NATURAL
	 & tstate : Thread --> {"noncs", "waiting", "cs", "exiting"}
	 & waitingFor : Thread --> POW(Thread);

 GoTo(t,loc1,loc2) == tstate(t) = loc1
	 & tstate_n = tstate <+ {t |-> loc2};

 max(t) == %i.(i : Thread| 1);
 maxNum(t) == max(t)(N);
 SBSetNum(t) == GoTo(t, "noncs", "waiting")
	 & num_n = num <+ {t |-> 1 + maxNum(t)}
	 & waitingFor_n = waitingFor <+ {t |-> (Thread - {t})};

 SBWaitFor(t,i) == tstate(t) = "waiting"
	 & i : waitingFor(t)
	 & (num(i) = 0 or num(t) < num(i))
	 & waitingFor_n = waitingFor <+ {t |-> (waitingFor(t) - {i})}
	 & tstate_n = (%t_.( t_ = 0 & waitingFor_n(t) = {} | tstate <+ {t |-> "cs"} )\/%t_.( t_ = 0 & not(waitingFor_n(t) = {}) | tstate ))(0)
	 & TRUE = TRUE;

 SBExitCS(t) == GoTo(t, "cs", "exiting")
	 & TRUE = TRUE;

 SBFinish(t) == GoTo(t, "exiting", "noncs")
	 & num_n = num <+ {t |-> 0}
	 & TRUE = TRUE;

VARIABLES num, tstate, waitingFor
INVARIANT
 num : POW(INTEGER*INTEGER)
 & tstate : POW(INTEGER*STRING)
 & waitingFor : POW(INTEGER*POW(INTEGER))
 & SBTypeOK
INITIALISATION
 num, tstate, waitingFor:(SBInit)
OPERATIONS
 SBSetNum_Op(t) = ANY num_n, tstate_n, waitingFor_n
	WHERE t : Thread & 
	 SBSetNum(t)
	THEN num, tstate, waitingFor := num_n, tstate_n, waitingFor_n END;

 SBWaitFor_Op(t, i) = ANY tstate_n, waitingFor_n
	WHERE t : Thread & i : Thread - {t} & 
	 SBWaitFor(t, i)
	THEN tstate, waitingFor := tstate_n, waitingFor_n END;

 SBExitCS_Op(t) = ANY tstate_n
	WHERE t : Thread & 
	 SBExitCS(t)
	THEN tstate := tstate_n END;

 SBFinish_Op(t) = ANY num_n, tstate_n
	WHERE t : Thread & 
	 SBFinish(t)
	THEN num, tstate := num_n, tstate_n END
END
/* Created Wed Jan 11 15:49:29 CET 2012 by TLA2B */