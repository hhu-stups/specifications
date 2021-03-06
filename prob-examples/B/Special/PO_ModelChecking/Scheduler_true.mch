MODEL Scheduler
SETS PID
PROPERTIES card(PID)=6
VARIABLES active,ready,waiting
INVARIANT
 active : POW(PID) &
 ready : POW(PID) &
 waiting : POW(PID) &
 active <: PID &
 ready <: PID & waiting <: PID &
 ((ready /\ waiting) = {}) &
 ((active /\ (ready \/ waiting)) = {}) &
 (card(active) <= 1) &
 ((active = {}) => (ready = {}))

DEFINITIONS
 /* Extreme case all INVARIANTs set to TRUE; as a benchmark about best possible reduction */
SIMPLIFIED_INV_OP_swap2 == (TRUE=TRUE);
SIMPLIFIED_INV_OP_new == (TRUE=TRUE);
SIMPLIFIED_INV_OP_ready1 == (TRUE=TRUE);
SIMPLIFIED_INV_OP_ready2 == (TRUE=TRUE);
SIMPLIFIED_INV_OP_del == (TRUE=TRUE); 
SET_PREF_SHOW_EVENTB_ANY_VALUES==TRUE 
INITIALISATION active := ({}) || ready := ({}) || waiting := ({})
OPERATIONS
 new = ANY pp WHERE (pp : PID) & (pp /: active) & (pp /: (ready \/ waiting)) THEN waiting := ((waiting)\/({pp})) END ;
 del = ANY pp WHERE (pp : waiting) THEN waiting := ((waiting)\({pp})) END ;
 ready1 = ANY rr WHERE (rr : waiting) & (active = {}) THEN waiting := ((waiting)\({rr})) || active := ({rr}) END ;
 ready2 = ANY rr WHERE (rr : waiting) & (active /= {}) THEN ready := ((ready)\/({rr})) || waiting := ((waiting)\({rr})) END ;
 swap1 = SELECT (active /= {}) & (ready = {}) THEN active := ({}) || waiting := ((waiting)\/(active)) END ;
 swap2 = ANY pp WHERE (active /= {}) & (ready /= {}) & (pp : ready) THEN waiting := ((waiting)\/(active)) || active := ({pp}) || ready := ((ready)\({pp})) END 
END