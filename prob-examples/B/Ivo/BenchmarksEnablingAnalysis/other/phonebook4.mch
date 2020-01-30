MACHINE phonebook4

SETS
	Name ; Code

VARIABLES db

DEFINITIONS
    scope_Name == 1..2;
    scope_Code == 1..2

INVARIANT
		db : Name +-> Code
		
INITIALISATION  
	db := {} 
	
OPERATIONS

cc <-- lookup_wrong(nn) =
	PRE
		nn : Name
	THEN
		cc:=db(nn)
	END;
   

add_wrong(nn,cc) =
	PRE
		nn:Name & cc:Code 
	THEN
		db := db \/ { nn |-> cc}
	END
	
END

