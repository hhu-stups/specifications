IMPLEMENTATION Schedular1

REFINES Schedular0

VARIABLES
 proc,idleset,readyq,activep,activef

INVARIANT
 idleset : POW(PROC) &
 readyq : seq(PROC) &
 activep : PROC &
 activef : BOOL

INITIALISATION
 proc := {} || readyq := [] ||
 activep :: PROC || activef := FALSE ||
 idleset := {}

OPERATIONS

  new(p) =
     PRE
	p:PROC-proc
     THEN
	idleset := idleset \/ {p} || proc := proc \/ {p}
     END;
  readyp(p) =
     PRE
	p:idleset
     THEN
	readyq := readyq <- p ||
	idleset := idleset - {p}
     END;
  enter(p) =
     PRE
	readyq /= [] &
	p = first(readyq) /*&
        activef = FALSE */
     THEN
	activep := p ||
	readyq := tail(readyq) ||
	activef := TRUE
     END;
  leave(p) =
     PRE
	activef = TRUE &
	p = activep
     THEN
	idleset := idleset \/ {p} ||
	activef := FALSE
     END

END

