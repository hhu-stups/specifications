MACHINE phonebook

SETS
	Name; Code 

VARIABLES db0, db1, db2, db, db3, db4, db5

DEFINITIONS
    scope_Name == 1..3;
    scope_Code == 6..9;
    
    GOAL == (card(db)=3)
    
INVARIANT
		db0: Name +-> Code & db1: Name +-> Code & db2: Name +-> Code & 
                db : Name +-> Code & db3: Name +-> Code & db4: Name +-> Code & db5: Name +-> Code
		
ASSERTIONS
        card(dom(db)) = card(ran(db))

INITIALISATION  
	db0 := {} || db1 := {} || db2 := {} ||
        db := {} ||
        db3 := {} || db4 := {} || db5 := {}
	
OPERATIONS

add(nn,cc) =
	PRE
		nn:Name & cc:Code  &
		nn /: dom(db) & nn = nn & cc = cc & nn=nn & cc=cc & nn=nn & cc=cc
	THEN
		db := db \/ { nn |-> cc}
	END;
	
delete(nn,cc) =
    PRE
       nn:Name & cc:Code & (nn|->cc):db
    THEN
       db := db - {nn |-> cc}
    END;

cc <-- lookup(nn) =
	PRE
		nn : dom(db) & nn:Name & nn=nn & nn=nn & nn=nn & nn=nn
	THEN
		cc:=db(nn)
	END;

cc <-- db_size = BEGIN cc := card(db) END;

update(nn,cc) =
	PRE
		nn:Name & cc:Code  & nn=nn & cc=cc & cc=cc & nn=nn &
		nn : dom(db)
	THEN
		db(nn) := cc
	END;

reset = 
    PRE
       db: Name --> Code
    THEN
        db := {}
    END
END


