MACHINE scheduler0

SETS
    PROC  ;
    STATE = {idle, ready, active }

VARIABLES proc, pst
DEFINITIONS
    scope_PROC == 1..6 ;
   /* scope_PROC2 == {p1,p2,p3}; */
    ASSERT_LTL0 == "G([new] => X e(del))";
    ASSERT_LTL1 == "G([del] => X e(new))";
    ASSERT_LTL2 == "G([enter] => X e(leave))";
    ASSERT_LTL3 == "G([leave] => X e(enter))"
INVARIANT  
    proc : POW(PROC) &
    pst : proc --> STATE &
    /* card({ q | q:proc & pst(q)=active }) <= 1  */
     card(pst~[{active}]) <=1
              
INITIALISATION  
    proc:={}  ||  pst := {} 
    
OPERATIONS

new(p) =
    PRE
        p : PROC - proc 
    THEN
        pst(p) := idle ||
        proc := proc \/ {p}
    END;

del(p) =
    PRE
        p : PROC & /* should really be p : proc; to avoid undefined pst(p) */
        pst(p) = idle
    THEN
        proc := proc-{p} ||
        pst := {p} <<| pst
    END;
    
ready(p) =
    PRE
        p : PROC & /* should really be p : proc; to avoid undefined pst(p) */
        pst(p) = idle 
    THEN
        pst(p) := ready
    END;
            
enter(p) =
    PRE
        p : PROC &
        pst(p) = ready  &
        /* { q | q:proc & pst(q)=active } = {}  */
        pst~[{active}] = {}  
    THEN
        pst(p) := active
    END;
            
leave(p) =
    PRE
        p : PROC &
        pst(p) = active 
    THEN
        pst(p) := idle
    END

END