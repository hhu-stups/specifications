REFINEMENT Schleusen_CSP

REFINES Schleusen

CSP_CONTROLLER Schleusen_CSP2


DEFINITIONS
   initial_level(ll) == (ll: SECTORS --> River &
        !rr.(rr:River => ll(rr) = rr) &
        !lock.(lock:Locks => (ll(lock)= ll(right_sector(left_sector~(lock))) )));
VARIABLES wlevel, dstate
   
INITIALISATION
   wlevel : (initial_level(wlevel)) || dstate := %dd.(dd:GATES|closed)
   
OPERATIONS

    open(dd) = PRE dd: GATES & dstate(dd) = closed  THEN
      dstate(dd) := opened
    END;
    
    close(dd) = PRE dd: GATES & dstate(dd) = opened THEN
      dstate(dd) := closed
    END;
    
    flood_lock_right(lock) = PRE lock: Locks /*&
             wlevel(right_sector(left_sector~(lock))) /= wlevel(lock)*/ THEN
           wlevel(lock) := wlevel(right_sector(left_sector~(lock)))
    END;
    flood_lock_left(lock) = PRE lock: Locks /* &
             wlevel(left_sector(right_sector~(lock))) /= wlevel(lock)*/ THEN
           wlevel(lock) := wlevel(left_sector(right_sector~(lock)))
    END
END