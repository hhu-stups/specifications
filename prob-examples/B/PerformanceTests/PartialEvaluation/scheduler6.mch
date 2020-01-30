MACHINE scheduler6

SETS
	PID 

/* 
 scope: 1..7:
  9.5 secs without pe ; 8.47 with pe

now 2nd April:
  8.69 secs without pe ; 8.94 with peb, 7.62 secs with pebc

 5232 states; 47848 transitions, 

*/

VARIABLES active, ready, waiting

DEFINITIONS
    scope_PID == 1..7

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

rr <-- nr_ready = rr:= card(ready);

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
	
readyp(rr) =
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

