MACHINE
factorial

ABSTRACT_CONSTANTS
fact

PROPERTIES
fact : NATURAL --> NATURAL &
fact(0) = 1 &
!(nn).(nn : NATURAL1 => fact(nn) = fact(nn - 1) * nn)

OPERATIONS
    res <-- calcfact(nn)=
    PRE nn : NAT
    THEN
        res := fact(nn)
    END
END