MACHINE
factorial_v2 // version for ProB

ABSTRACT_CONSTANTS
fact

PROPERTIES
 fact : INTEGER <-> INTEGER &
 fact = {0|->1} \/ %nn.(nn:NATURAL1|fact(nn - 1) * nn)
ASSERTIONS 
fact(0) = 1;
fact : NATURAL --> NATURAL;
!(nn).(nn : NATURAL1 => fact(nn) = fact(nn - 1) * nn)
OPERATIONS
    res <-- calcfact(nn)=
    PRE nn : NAT
    THEN
        res := fact(nn)
    END
END