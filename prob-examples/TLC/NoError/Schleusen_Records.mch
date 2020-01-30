MACHINE Schleusen_Records

SETS
   GATE_STATE = {opened, closed};
   SECTORS = { Lock1,Lock2, River1,River2,River3}
CONSTANTS
   River, Locks, GATES
DEFINITIONS
   correct_level(ll) == (ll: SECTORS --> River &
        !rr.(rr:River => ll(rr) = rr) &
        !wl.(wl:Locks =>
             #dd.(dd:GATES & ((dd'left_sect = wl & ll(wl) = ll(dd'right_sect)) or
                              (dd'right_sect = wl & ll(wl) = ll(dd'left_sect)) )
                ) ) );
   /* the actual topology for animation : */
   TOPOLOGY == (
                 River = {River1,River2,River3} &
                 GATES = { rec(left_sect:River1,right_sect:Lock1),
                           rec(left_sect:Lock1, right_sect:River2),
                           rec(left_sect:River2, right_sect: Lock2),
                           rec(left_sect:Lock2, right_sect:River3) }
               );
   TOPOLOGY2 == (River = {River1,River2,River3} ) /* dauert lange damit */
PROPERTIES
   River <<: SECTORS & 
   Locks <<: SECTORS &
   River \/ Locks = SECTORS &
   River /\ Locks = {} &
   
   
   GATES : POW(struct(left_sect: SECTORS, right_sect: SECTORS)) &
   
   TOPOLOGY &
   
   !dd1.(dd1:GATES => (dd1'left_sect:River <=> dd1'right_sect:Locks)) &
   
   !wl1.(wl1:Locks => (#dd2.(dd2:GATES & dd2'left_sect = wl1)  &
                          #dd3.(dd3:GATES & dd3'right_sect = wl1) ))
VARIABLES
   wlevel, dstate
   
INVARIANT
   correct_level(wlevel) & dstate: GATES --> GATE_STATE &
   
   !dd2.(dd2:GATES & dstate(dd2)=opened => wlevel(dd2'left_sect) = wlevel(dd2'right_sect))
   
INITIALISATION
   wlevel : (correct_level(wlevel)) || dstate := %dd.(dd:GATES|closed)
   
OPERATIONS

    open(dd) = PRE dd: GATES & dstate(dd) = closed &
                   wlevel(dd'left_sect) = wlevel(dd'right_sect) THEN
      dstate(dd) := opened
    END;
    
    close(dd) = PRE dd: GATES & dstate(dd) = opened THEN
      dstate(dd) := closed
    END;
    
    flood_lock_right(lock,dl,dr) = PRE lock: Locks &
        dl: GATES & dl'right_sect = lock & dr:GATES & dr'left_sect = lock &
             dstate(dr)=closed &
             wlevel(dl'left_sect) /= wlevel(lock) THEN
           wlevel(lock) := wlevel(dl'left_sect)
    END;
    
    flood_lock_left(lock,dl,dr) = PRE lock: Locks &
        dl: GATES & dl'right_sect = lock & dr:GATES & dr'left_sect = lock &
             dstate(dl)=closed &
             wlevel(dr'right_sect) /= wlevel(lock) THEN
           wlevel(lock) := wlevel(dr'right_sect)
    END
END