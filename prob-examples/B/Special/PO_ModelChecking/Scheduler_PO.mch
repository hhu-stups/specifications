MODEL Scheduler
SETS PID
VARIABLES active,ready,waiting
INVARIANT (active : POW(PID)) & (ready : POW(PID)) & (waiting : POW(PID)) & (active <: PID) & (ready <: PID) & (waiting <: PID) & ((ready /\ waiting) = {}) & ((active /\ (ready \/ waiting)) = {}) & (card(active) <= 1) & ((active = {}) => (ready = {}))

DEFINITIONS
 /* Simplified POs computed with the automatic provers */
SIMPLIFIED_INV_OP_swap2 == (((ready - {pp}) /\ (waiting \/ active)) = {}) & (({pp} /\ ((ready - {pp}) \/ (waiting \/ active))) = {}) & (({pp} = {}) => ((ready - {pp}) = {}));
SIMPLIFIED_INV_OP_new == ((ready /\ (waiting \/ {pp})) = {}) & ((active /\ (ready \/ (waiting \/ {pp}))) = {});
SIMPLIFIED_INV_OP_ready1 == (({rr} /\ (ready \/ (waiting - {rr}))) = {});
SIMPLIFIED_INV_OP_ready2 == (((ready \/ {rr}) /\ (waiting - {rr})) = {}) & ((active /\ ((ready \/ {rr}) \/ (waiting - {rr}))) = {});
SIMPLIFIED_INV_OP_del == ((ready /\ (waiting - {pp})) = {}) & ((active /\ (ready \/ (waiting - {pp}))) = {});
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