MACHINE becomes_such
VARIABLES 
 counter
INVARIANT
 counter : NAT
INITIALISATION
 counter := 0
OPERATIONS
 inc = BEGIN counter : (counter - 1 = counter$0) END
END

