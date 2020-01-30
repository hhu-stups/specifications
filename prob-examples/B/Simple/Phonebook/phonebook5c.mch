MACHINE phonebook5c

SETS
	Name ; Code

VARIABLES db, activec

DEFINITIONS
    scope_Name == 1..2;
    scope_Code == 4..5

INVARIANT
		db : Name +-> Code & activec:POW(Code) &
                ran(db) = activec
INITIALISATION  
	db := {} || activec := {}
	
OPERATIONS


add(nn,cc) =
	PRE
		nn:Name & cc:Code & nn /: dom(db) 
	THEN
		db := db \/ { nn |-> cc} || activec := activec \/ {cc}
	END;

delete_wrong(nn,cc) =
        PRE
                nn:Name & cc:Code
        THEN
               db := db - { nn |-> cc} || activec := activec - {cc} 
        END
	
END

