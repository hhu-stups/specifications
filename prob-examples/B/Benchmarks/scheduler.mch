MACHINE scheduler

SETS
	PID  = {process1,process2,process3} 

VARIABLES active, ready, waiting

DEFINITIONS
    scope_PID == 1..3;

      /* LTL Formulas: */
      ASSERT_LTL0 == "G ({card(active)<2})";
      ASSERT_LTL1 == "G ({card(active)>0} => e(swap))";
      ASSERT_LTL2 == "GF (not e(swap) => G ({card(active)>0} => F {card(active)=0}))";
      ASSERT_LTL3_FAIL == "G {waiting /= {}}";
      ASSERT_CTL == "AG ( EX[swap]true => {active /= {}})";
      ASSERT_CTL2 == "AG ( (EX[new]true)  or (EX[del]true) or (EX[swap]true) )";
      ASSERT_CTL3_FALSE == "AG ( (EX[new]true)  or (EX[del]true) )";
      ASSERT_CTL4 == "AF {card(waiting)>0}";
      ASSERT_CTL5 == "AG( {card(active)>0} => EG e(swap))"
INVARIANT  /* active : POW(PID) & ready : POW(PID) & waiting: POW(PID) & */ /* the types */
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
		waiting := waiting - {pp}
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

