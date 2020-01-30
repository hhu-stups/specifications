MACHINE scheduler

SETS
	PID 

/* LTL Formulas:
  G (e(del) => {card(ready \\/ waiting)>0})  TRUE
  G ({card(ready \/ waiting)>0} => e(del))    FALSE
  G ({card(active)>0} => (e(swap) U {card(active)=0}))  FALSE
  G ({card(active)>0} => ((G e(swap)) | (e(swap) U {card(active)=0})))  TRUE
  CTL Formulas:
  AG {active={} or ready = {} or waiting ={}} FALSE
  AG EX {active = {}} FALSE
  AG EF {active = {}} TRUE
*/

VARIABLES active, ready, waiting

DEFINITIONS
    scope_PID == 1..3;
    ASSERT_LTL == "G (e(del) => {card(ready \/ waiting)>0}) ";
    ASSERT_CTL1 == "AG EF {active = {}}" ; ASSERT_CTL2 == "EG {active = {}}" ;
    ASSERT_CTL3 == "AG({card(ready)>1} => EF {card(active)>0})"

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

