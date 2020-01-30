MACHINE Schedular0

SETS
 PROC;
 STATE = {idle, ready, active}

VARIABLES proc, pst

INVARIANT
 proc: POW(PROC) &
 pst : proc --> STATE &
 card(pst~[{active}]) <= 1

INITIALISATION
 proc, pst := {},{}

OPERATIONS
  new(p) =
     PRE
	p:PROC-proc
     THEN
	pst(p) := idle || proc := proc \/ {p}
     END;
  readyp(p) =
     PRE
	pst(p) = idle
     THEN
	pst(p) := ready
     END;
  enter(p) =
     PRE
	pst(p) = ready &
	pst~[{active}] = {}
     THEN
	pst(p) := active
     END;
  leave(p) =
     PRE
	pst(p) = active
     THEN
	pst(p) := idle
     END

END

