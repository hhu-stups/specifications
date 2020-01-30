MACHINE phonebook5

SETS
	Name = {peter,paul} ; Code

VARIABLES db, active

DEFINITIONS
    scope_Name == 1..2;
    scope_Code == 4..5

INVARIANT
		db : Name +-> Code & active:POW(Name) &
                dom(db) = active
INITIALISATION  
	db := {} || active := {}
	
OPERATIONS   

add(nn,cc) =
	PRE
		nn:Name & cc:Code & nn /: active 
	THEN
		db := db \/ { nn |-> cc} || active := active \/ {nn}
	END;

delete_wrong(nn,cc) =
        PRE
                nn:Name & cc:Code
        THEN
               db := db - { nn |-> cc} || active := active - {nn} 
        END
	
END

