MACHINE
factorial_v3 // version for ProB with IF-THEN-ELSE

ABSTRACT_CONSTANTS
fact

PROPERTIES
 fact : NATURAL --> INTEGER &
 fact =    %nn.(nn:NATURAL|IF nn=0 THEN 1 ELSE fact(nn - 1) * nn END)
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