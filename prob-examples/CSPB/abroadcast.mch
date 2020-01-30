MACHINE abroadcast

/*  Atomic broadcast protocol, Michael Butler

Any node can broadcast a message.
Each message is delivered to each node.
Each message is delivered in the same order at each node,
though not necessarily in order in which they are broadcast.
Messages are only broadcast once.
A crashed node does not broadcast or deliver (receive) messages.

*/

SETS Node = {n1,n2}  ; Message = {m1,m2}

VARIABLES
    order, deliv, bcast, correct

INVARIANT

    order : iseq(Message) &     /* (global) order of delivery of messages */
    deliv : Node <-> Message &  /* deliv(p,m) means m has been delivered to p */
    bcast : POW(Message) &      /* messages that have been broadcast */
    correct : POW(Node)         /* nodes that have crashed */

INITIALISATION
    order, deliv, bcast, correct := <>, {}, {}, Node

OPERATIONS

Broadcast(nn,mm) =
    PRE 
        nn:correct & 
        mm:Message &
        mm/:bcast
    THEN
        bcast := bcast \/ {mm}
    END ;


Queue(mm) = 
    PRE
        mm:Message &
        mm:(bcast-ran(order))
    THEN
        order := order<-mm 
    END ;

/* Select the lowest order message for node nn  */
/* that has not yet been delivered to nn:       */
Deliver(nn,mm) = 
    PRE nn:correct & mm:Message THEN
    ANY ii WHERE 
        ii:NATURAL &
        order |>> deliv[{nn}] /={} &
        ii = min(dom(order |>> deliv[{nn}])) &
        mm = order(ii)
    THEN
        deliv := deliv \/ { nn |-> mm }
    END END  ;

Crash(nn) =
    PRE nn:correct
    THEN correct := correct - {nn}
    END ;

Crashed(nn) =
    PRE nn:Node THEN
    SELECT nn/:correct THEN skip END
    END


END

        
       
