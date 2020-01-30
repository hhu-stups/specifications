MACHINE phonebook_10

SETS
	Name; Code 

VARIABLES db0,db1,db2,db3,db4,db5,db6,db7,db8,db9

DEFINITIONS
    scope_Name == 1..2;
    scope_Code == 7..8
    
INVARIANT
		db0 : Name +-> Code &
		db1 : Name +-> Code &
		db2 : Name +-> Code &
		db3 : Name +-> Code &
		db4 : Name +-> Code &
		db5 : Name +-> Code &
		db6 : Name +-> Code &
		db7 : Name +-> Code &
		db8 : Name +-> Code &
		db9 : Name +-> Code

INITIALISATION  
	db0,db1,db2,db3,db4,db5,db6,db7,db8,db9 := {},{},{},{},{},{},{},{},{},{}
	
OPERATIONS

/* ------------------------------- */
add_db0(nn,cc) =
	PRE
		nn:Name & cc:Code  &
		nn /: dom(db0) 
	THEN
		db0 := db0 \/ { nn |-> cc}
	END;

update_db0(nn,cc) =
	PRE
		nn:Name & cc:Code  &
		nn : dom(db0)
	THEN
		db0(nn) := cc
	END;

reset_db0 = 
    PRE
       db0: Name --> Code
    THEN
        db0 := {}
    END;
/* ------------------------------- */
add_db1(nn,cc) =
	PRE
		nn:Name & cc:Code  &
		nn /: dom(db1) 
	THEN
		db1 := db1 \/ { nn |-> cc}
	END;

update_db1(nn,cc) =
	PRE
		nn:Name & cc:Code  &
		nn : dom(db1)
	THEN
		db1(nn) := cc
	END;

reset_db1 = 
    PRE
       db1: Name --> Code
    THEN
        db1 := {}
    END;
/* ------------------------------- */
add_db2(nn,cc) =
	PRE
		nn:Name & cc:Code  &
		nn /: dom(db2) 
	THEN
		db2 := db2 \/ { nn |-> cc}
	END;

update_db2(nn,cc) =
	PRE
		nn:Name & cc:Code  &
		nn : dom(db2)
	THEN
		db2(nn) := cc
	END;

reset_db2 = 
    PRE
       db2: Name --> Code
    THEN
        db2 := {}
    END;
/* ------------------------------- */
add_db3(nn,cc) =
	PRE
		nn:Name & cc:Code  &
		nn /: dom(db3) 
	THEN
		db3 := db3 \/ { nn |-> cc}
	END;

update_db3(nn,cc) =
	PRE
		nn:Name & cc:Code  &
		nn : dom(db3)
	THEN
		db3(nn) := cc
	END;

reset_db3 = 
    PRE
       db3: Name --> Code
    THEN
        db3 := {}
    END;
/* ------------------------------- */
add_db4(nn,cc) =
	PRE
		nn:Name & cc:Code  &
		nn /: dom(db4) 
	THEN
		db4 := db4 \/ { nn |-> cc}
	END;

update_db4(nn,cc) =
	PRE
		nn:Name & cc:Code  &
		nn : dom(db4)
	THEN
		db4(nn) := cc
	END;

reset_db4 = 
    PRE
       db4: Name --> Code
    THEN
        db4 := {}
    END;
/* ------------------------------- */
add_db5(nn,cc) =
	PRE
		nn:Name & cc:Code  &
		nn /: dom(db5) 
	THEN
		db5 := db5 \/ { nn |-> cc}
	END;

update_db5(nn,cc) =
	PRE
		nn:Name & cc:Code  &
		nn : dom(db5)
	THEN
		db5(nn) := cc
	END;

reset_db5 = 
    PRE
       db5: Name --> Code
    THEN
        db5 := {}
    END;
/* ------------------------------- */
add_db6(nn,cc) =
	PRE
		nn:Name & cc:Code  &
		nn /: dom(db6) 
	THEN
		db6 := db6 \/ { nn |-> cc}
	END;

update_db6(nn,cc) =
	PRE
		nn:Name & cc:Code  &
		nn : dom(db6)
	THEN
		db6(nn) := cc
	END;

reset_db6 = 
    PRE
       db6: Name --> Code
    THEN
        db6 := {}
    END;
/* ------------------------------- */
add_db7(nn,cc) =
	PRE
		nn:Name & cc:Code  &
		nn /: dom(db7) 
	THEN
		db7 := db7 \/ { nn |-> cc}
	END;

update_db7(nn,cc) =
	PRE
		nn:Name & cc:Code  &
		nn : dom(db7)
	THEN
		db7(nn) := cc
	END;

reset_db7 = 
    PRE
       db7: Name --> Code
    THEN
        db7 := {}
    END;
/* ------------------------------- */
add_db8(nn,cc) =
	PRE
		nn:Name & cc:Code  &
		nn /: dom(db8) 
	THEN
		db8 := db8 \/ { nn |-> cc}
	END;

update_db8(nn,cc) =
	PRE
		nn:Name & cc:Code  &
		nn : dom(db8)
	THEN
		db8(nn) := cc
	END;

reset_db8 = 
    PRE
       db8: Name --> Code
    THEN
        db8 := {}
    END;
/* ------------------------------- */
add_db9(nn,cc) =
	PRE
		nn:Name & cc:Code  &
		nn /: dom(db9) 
	THEN
		db9 := db9 \/ { nn |-> cc}
	END;

update_db9(nn,cc) =
	PRE
		nn:Name & cc:Code  &
		nn : dom(db9)
	THEN
		db9(nn) := cc
	END;

reset_db9 = 
    PRE
       db9: Name --> Code
    THEN
        db9 := {}
    END
END


