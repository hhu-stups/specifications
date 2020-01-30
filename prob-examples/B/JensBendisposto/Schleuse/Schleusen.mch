
MACHINE Schleusen

SETS
   GATE_STATE = {opened, closed};
   SECTORS = { lock1,lock2, River1,River2,River3};
   GATES = {gate1,gate2,gate3,gate4}
CONSTANTS
   River, Locks, left_sector, right_sector
DEFINITIONS
   correct_level(ll) == (ll: SECTORS --> River &
        !rr.(rr:River => ll(rr) = rr) &
        !lock.(lock:Locks => (ll(lock)= ll(right_sector(left_sector~(lock))) or
                               ll(lock)= ll(left_sector(right_sector~(lock))) )));
   
   /* the actual topology for animation : */
   TOPOLOGY == (
                 River = {River1,River2,River3} &
  				 left_sector(gate1) = River1 & right_sector(gate1) = lock1 &
 				 left_sector(gate2) = lock1 & right_sector(gate2) = River2 & 
   				 left_sector(gate3) = River2 & right_sector(gate3) = lock2 &
   				 left_sector(gate4) = lock2 & right_sector(gate4) = River3 
               );
   TOPOLOGY2 == (River = {River1,River2,River3} ) /* dauert lange damit */
PROPERTIES
   River <<: SECTORS & 
   Locks <<: SECTORS &
   River \/ Locks = SECTORS &
   River /\ Locks = {} &
   
   left_sector: GATES >-> SECTORS & right_sector: GATES >-> SECTORS &
   
   TOPOLOGY &
   
   !dd1.(dd1:GATES => (left_sector(dd1):River <=> right_sector(dd1):Locks)) &
   
   Locks <: ran(left_sector) & Locks <: ran(right_sector) 
VARIABLES
   wlevel, dstate
   
INVARIANT
   correct_level(wlevel) & dstate: GATES --> GATE_STATE &
   
   !dd2.(dd2:GATES & dstate(dd2)=opened => wlevel(left_sector(dd2)) = wlevel(right_sector(dd2)))
   
INITIALISATION
   wlevel : (correct_level(wlevel)) || dstate := %dd.(dd:GATES|closed)
   
OPERATIONS

    open(dd) = PRE dd: GATES & dstate(dd) = closed &
                   wlevel(left_sector(dd)) = wlevel(right_sector(dd)) THEN
      dstate(dd) := opened
    END;
    
    close(dd) = PRE dd: GATES & dstate(dd) = opened THEN
      dstate(dd) := closed
    END;
    
    flood_lock_right(lock) = PRE lock: Locks &
             dstate(right_sector~(lock))=closed &
             wlevel(right_sector(left_sector~(lock))) /= wlevel(lock) THEN
           wlevel(lock) := wlevel(right_sector(left_sector~(lock)))
    END;
    flood_lock_left(lock) = PRE lock: Locks &
             dstate(left_sector~(lock))=closed &
             wlevel(left_sector(right_sector~(lock))) /= wlevel(lock) THEN
           wlevel(lock) := wlevel(left_sector(right_sector~(lock)))
    END
END