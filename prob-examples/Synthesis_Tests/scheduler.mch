MACHINE scheduler
SETS PID = {p1,p2,p3}
VARIABLES  active, ready, waiting
INVARIANT  active <: PID & ready <: PID & waiting <: PID
INITIALISATION active := {} || ready := {} || waiting := {}
OPERATIONS
s = BEGIN skip END
END
