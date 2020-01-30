MACHINE phonebook7
/*
  prob: 7.72 secs  ; 3126 states, 40176 transitions
  peb:  7.54 secs
  pebc: 6.28 secs  ; 3126 states, 40176 transitions
*/

SETS
	Name  ; Code = {c1,c2,c3,c4}

VARIABLES db, active, activec

DEFINITIONS
    scope_Name == 1..5;
    scope_Code == 1..4

INVARIANT
		db : Name +-> Code & active:POW(Name) & activec:POW(Code) &
                dom(db) = active & ran(db) = activec
ASSERTIONS
  card(active) >= card(activec)
INITIALISATION  
	db := {} || active := {} || activec := {}
	
OPERATIONS
dd <-- getdom = dd:= dom(db);
cc <-- lookup(nn) =
	PRE
		nn : Name & nn : active 
	THEN
		cc:=db(nn)
	END;
   

add(nn,cc) =
	PRE
		nn:Name & cc:Code  & nn /: active 
	THEN
		db := db \/ { nn |-> cc} || active := active \/ {nn} || activec := activec \/ {cc}
	END;

delete(nn,cc) =
        PRE
                nn:Name & cc:Code & nn: active & cc: activec & db(nn) = cc
        THEN
               db := db - { nn |-> cc} || active := active - {nn} || activec := db[(active - {nn})] 
        END
	
END
