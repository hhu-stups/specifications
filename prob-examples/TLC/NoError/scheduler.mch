MACHINE scheduler

SETS
	PID /* = {process1,process2,process3} */

VARIABLES active, ready, waiting

DEFINITIONS
    scope_PID == 1..3;
    ASSERT_LTL == "G([new]=> X e(del))";        /* This formula is true */
    ASSERT_LTL_1 == "G([swap]=> X not(e(swap)))"  /* This formula is false */

INVARIANT  active : POW(PID) & ready : POW(PID) & waiting: POW(PID) & /* the types */
           /* and now the rest of the invariant */
           active <: PID &
           ready <: PID   &
           waiting <: PID &
           (ready /\ waiting) = {} &
           active /\ (ready \/ waiting) = {} &
           card(active) <= 1 &
           ((active = {})  => (ready = {}))
              
INITIALISATION  
	active := {} || ready := {} || waiting := {}
	
OPERATIONS

new(pp) =
	SELECT
		pp : PID  &
		pp /: active &
		pp /: (ready \/ waiting) 
	THEN
		waiting := (waiting \/ { pp })
	END;

del(pp) =
	SELECT
		pp : waiting 
	THEN
		waiting := waiting - { pp }
	END;
	
ready(rr) =
        SELECT
                rr : waiting
        THEN
                waiting := (waiting - {rr}) ||
                IF (active = {}) THEN
                   active := {rr}
                ELSE
                   ready := ready \/ {rr} 
                END
        END; 
        	
swap =
        SELECT
                active /= {}
        THEN
                waiting := (waiting \/ active) ||
                IF (ready = {}) THEN
                   active := {}
                ELSE
                   ANY pp WHERE pp : ready
                   THEN
                       active := {pp} ||
                       ready := ready - {pp} 
                   END
                END
        END       
END

