MACHINE invert_test

SETS
	Name ; Code

VARIABLES db, nm, friend

DEFINITIONS
    scope_Name == 1..3;
    scope_Code == 4..5

INVARIANT
		db : Name +-> Code &
		nm : POW(Name) &
		friend: Name +-> Name 

INITIALISATION  
	db := {} || nm := {} || friend := {}
	
OPERATIONS

add(nn,cc) =
	PRE
		nn:Name & cc:Code  &
		nn /: dom(db) 
	THEN
		db := db \/ { nn |-> cc} || nm := nm \/ {nn}
	END;
	
NameTest(nn) = PRE nn:POW(Name) & nn=nm THEN skip END;

add_friend(nn,nn2) =
    PRE
       nn: Name & nn2: Name & nn : dom(db) & nn2: dom(db) &
       db(nn) = db(nn2) & {nn |-> nn2} /: friend
    THEN
       friend := friend \/ { nn |-> nn2}
    END;
	
cc <-- choose2(c) =
   PRE c:Code THEN
    ANY nn WHERE nn: Name & nn: db~([{c}])  /* does not work yet */
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
   
   
reflex = PRE friend = friend~ THEN skip END
END

