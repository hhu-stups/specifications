MACHINE PID_DEADLOCK_PO
SETS
	PID = {p1,p2,p3,p4,p5,p6,p7}
VARIABLES r
INVARIANT r <: PID
INITIALISATION
 r := {}
OPERATIONS
 SolveDeadlock(ready,active,waiting) = PRE 
	active <: PID &
	ready <: PID &
	waiting <: PID &
	card(active) <= 1
	&
	ready /\ waiting = {}
	&
	active /\ waiting = {}
	&
	ready /\ active = {}
	&
	(active = {} => ready = {})
	&
	not(
	  #(pp).(pp : PID & pp /: ((ready \/ waiting) \/ active))
	)
	&
	not(
	  waiting /= {}
	)
	&
	not(
	  active /= {}
	)
	&
	not(
	  waiting /= {}
	)
 THEN
  r := ready
END
END
