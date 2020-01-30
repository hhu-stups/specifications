MACHINE spec

SETS 
    USER = {u1,u2,u3};  
    CALL = {c1,c2} 

VARIABLES 
    call, caller, callee, open, hold, pcmsg, permit
   
INVARIANT
    
    call : POW(CALL) &
    caller : call --> USER &
    callee : call --> USER &
    open  : POW(call) &
    hold  : POW(call) &
    pcmsg  : POW(call) &
    permit : POW(USER) &

    !c.(c:(call-pcmsg)  => caller(c):permit & callee(c):permit)  &
    !c.(c:pcmsg => (caller(c)/:permit or callee(c)/:permit) )  &

    open = call - (hold\/pcmsg) 

    
INITIALISATION

    call := {}  ||
    caller := {}  ||
    callee := {}  ||
    open := {}  ||
    hold := {}  ||
    pcmsg := {}  ||
    permit := USER

OPERATIONS


Start(u,v) = PRE u:USER & v:USER THEN
    ANY  c  WHERE
        c:(CALL-call)  &
        u : permit &
        v : permit &
        u /= v
    THEN
        call := call \/ {c} ||
        caller(c) := u  ||
        callee(c) := v  ||
        open := open \/ {c}
    END END  ;

    
Hold(c) = PRE c:call THEN
    SELECT
        c : (call-hold)
    THEN
        hold := hold \/ {c}  ||
        open := open - {c}
    END  END  ;


Unhold(c) = PRE c:call THEN
    SELECT
        c:hold
    THEN
        hold := hold - {c}  ||
        open := open \/ ({c}-pcmsg)
    END  END  ;


UnPermit(u) = PRE u:USER THEN
    SELECT
        u : permit
    THEN
        LET cs BE 
            cs = { c | c:call & caller(c)=u }  \/
                 { c | c:call & callee(c)=u } 
        IN
        permit := permit-{u}  ||
        pcmsg := pcmsg \/ cs  ||
        open := open - cs 
    END END  END  ;


Permit(u) = PRE u:USER THEN
    SELECT
        u : (USER-permit)
    THEN
        LET cs BE
            cs = { c | c:call & caller(c)=u & callee(c):permit }  \/
                 { c | c:call & callee(c)=u & caller(c):permit } 
        IN
        permit := permit \/ {u}  ||
        pcmsg := pcmsg - cs  ||
        open := open \/ (cs-hold) 
    END END  END  ;


End(c) = PRE c:call THEN
    SELECT
        c:call
    THEN
        call := call - {c}  ||
        caller := {c} <<| caller  ||
        callee := {c} <<| callee  ||
        open := open - {c} ||
        hold := hold - {c} ||
        pcmsg := pcmsg - {c}
    END  END

END
