MACHINE phonebook2

SETS
	Name ; Code

VARIABLES db,nm

DEFINITIONS
    scope_Name == 1..3;
    scope_Code == 4..5

INVARIANT
		db : Name +-> Code &
		nm : POW(Name)

INITIALISATION  
	db := {} || nm := {}
	
OPERATIONS

add(nn,cc) =
	PRE
		nn:Name & cc:Code  &
		nn /: dom(db) 
	THEN
		db := db \/ { nn |-> cc} || nm := nm \/ {nn}
	END;

add_wrong(nn,cc) =
	PRE
		nn:Name & cc:Code  &
		nn /: dom(db) 
	THEN
		db := db \/ { cc |-> nn} || nm := nm \/ {nn}
	END;


cc <-- lookup(nn) =
	PRE
	    nn:Name &
		nn : dom(db)
	THEN
		cc:=db(nn)
	END;

cc <-- lookup_wrong(nn) =
	PRE
		nn : Name
	THEN
		cc:=db(nn)
	END;


update(nn,cc) =
	PRE
		nn:Name & cc:Code  &
		nn : dom(db)
	THEN
		db(nn) := cc
	END;
	
cc <-- choose =
   ANY nn WHERE nn: Name & nn : dom(db)
   THEN
      cc := nn
   END;
   
cc <-- choose_not =
   ANY nn WHERE nn /: dom(db) & nn: Name
   THEN
      cc := nn
   END;
	
cc <-- choose2(c) =
   PRE c:Code THEN
    ANY nn WHERE nn: Name & nn: db~[{c}]  /* does work now; previously extra () */
    THEN
      cc := nn
    END
   END;
   
cc <-- choose3(c) =
   PRE c:Code & c: ran(db) THEN
      cc := db~(c)
   END;
   
reflexive(nn) = PRE nn = nn~ & nn: Name +-> Name THEN
   skip    END;
   
cc <-- check(nn,mm) =
    PRE
       nn:Name & mm:Name
    THEN
       IF not(nn=mm) THEN
          cc := nn
       ELSE
          cc := mm
       END
    END
   
END

