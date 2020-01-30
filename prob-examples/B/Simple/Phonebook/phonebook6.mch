MACHINE phonebook6

SETS
	Name ; Code

VARIABLES db, active, activec

DEFINITIONS
    scope_Name == 1..2;
    scope_Code == 5..6

INVARIANT
		db : Name +-> Code & active:POW(Name) & activec:POW(Code) &
                dom(db) = active & ran(db) = activec
INITIALISATION  
	db := {} || active := {} || activec := {}
	
OPERATIONS

cc <-- lookup_wrong(nn) =
	PRE
		nn : Name & nn : active 
	THEN
		cc:=db(nn)
	END;
   

add(nn,cc) =
	PRE
		nn:Name & cc:Code & nn /: active 
	THEN
		db := db \/ { nn |-> cc} || active := active \/ {nn} || activec := activec \/ {cc}
	END;

delete_wrong(nn,cc) =
        PRE
                nn:Name & cc:Code
        THEN
               db := db - { nn |-> cc} || active := active - {nn} || activec := activec - {cc}
        END
	
END

