MACHINE phonebook7_err

SETS
	Name  ; Code /* = {c1,c2,c3} */

VARIABLES db, active, activec

DEFINITIONS
    scope_Name == 1..3;
    scope_Code == 5..6

INVARIANT
		db : Name +-> Code & active:POW(Name) & activec:POW(Code) &
                dom(db) = active & ran(db) = activec
INITIALISATION  
	db := {} || active := {} || activec := {}
	
OPERATIONS

cc <-- lookup(nn) =
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

delete(nn,cc) =
        PRE
                nn:Name & cc:Code & nn: active & cc: activec /* MISSING: & db(nn) = cc  */
        THEN
               db := db - { nn |-> cc} || active := dom(db - { nn |-> cc}) || activec := db[(active - {nn})]
        END
	
END
