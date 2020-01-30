MACHINE
    Nodes_Traversing
SEES Nodes
VARIABLES mySeq
INVARIANT mySeq : seq(NODES)
& !(ii,jj).(ii : 1..size(mySeq)-1 & jj : 2..size(mySeq) & jj = ii + 1
            => mySeq(ii) |-> mySeq(jj) : next)
INITIALISATION mySeq := []
OPERATIONS
    traverse =
        ANY p_mySeq
        WHERE
            p_mySeq : iseq(NODES)
            & !(ii,jj).(ii : 1..size(p_mySeq)-1
                & jj : 2..size(p_mySeq)
                & jj = ii + 1
                => p_mySeq(ii) |-> p_mySeq(jj) : next
              )
        THEN
            mySeq := p_mySeq
        END
END
