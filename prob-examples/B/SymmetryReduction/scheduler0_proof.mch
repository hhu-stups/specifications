MACHINE scheduler0_proof

SETS
    PROC  ;
    STATE = {idle, ready, active }

VARIABLES proc, pst, new_enabled, del_ready_enabled, enter_enabled, leave_enabled
DEFINITIONS
    INV == (
      proc : POW(PROC) &
      pst : proc --> STATE &
      card(pst~[{active}]) <=1 &
     
     new_enabled: POW(PROC) & del_ready_enabled: POW(PROC) &
     enter_enabled: POW(PROC) & leave_enabled: POW(PROC) &
     !p.(p: PROC => (p:new_enabled <=>  p : PROC - proc)) &
     !p.(p: PROC => (p:del_ready_enabled <=> pst(p) = idle)) &
     !p.(p: PROC => (p:enter_enabled <=> pst(p) = ready)) &
     !p.(p: PROC => (p:leave_enabled <=> pst(p) = active))
     )
INVARIANT  
    INV
              
INITIALISATION  
    proc,pst,new_enabled,del_ready_enabled,enter_enabled,leave_enabled : (INV)
    
OPERATIONS
 Permute = ANY myperm WHERE myperm: PROC >->> PROC THEN
                 proc := myperm[proc] ||
                 pst := (myperm ; pst) ||
                 new_enabled := myperm[new_enabled] ||
                 del_ready_enabled := myperm[del_ready_enabled] ||
                 enter_enabled := myperm[enter_enabled] ||
                 leave_enabled := myperm[leave_enabled]
               END

END

