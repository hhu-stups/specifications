MACHINE Y1(T_, init)

CONSTRAINTS
    init : T_

VARIABLES
    vy1
    
INVARIANT
    vy1 : T_

INITIALISATION
    vy1:=init

OPERATIONS

    opy1 = BEGIN skip END

END