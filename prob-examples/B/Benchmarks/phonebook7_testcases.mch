MACHINE phonebook7_testcases

SETS
	Name = {n1,n2,n3} ; Code = {c1,c2,c3}

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

cc <-- lookup(nn) =
	PRE
		nn : Name & nn : active 
	THEN
		cc:=db(nn)
	END;
   

add(nn,cc) =
	PRE
		nn:Name & cc:Code & nn /: active &
                
                /* for test case generation */
               ( active = {} or active /= {} ) &
               ( card(db)<2 or card(db)>=2 )
	THEN
		db := db \/ { nn |-> cc} || active := active \/ {nn} || activec := activec \/ {cc}
	END;

delete(nn,cc) =
        PRE
                nn:Name & cc:Code & nn: active & cc: activec & db(nn) = cc&
                
                /* for test case generation */
               ( card(db) = 0 or card(db)=1 or card(db)>=2 )
        THEN
               db := db - { nn |-> cc} || active := active - {nn} || activec := db[(active - {nn})]
        END
	
END

