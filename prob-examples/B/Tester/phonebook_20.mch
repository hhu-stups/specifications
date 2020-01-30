MACHINE phonebook_20

SETS
	Name; Code 

VARIABLES db0,db1,db2,db3,db4,db5,db6,db7,db8,db9,
          ddbb0,ddbb1,ddbb2,ddbb3,ddbb4,ddbb5,ddbb6,ddbb7,ddbb8,ddbb9

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
		&
		ddbb0 : Name +-> Code &
		ddbb1 : Name +-> Code &
		ddbb2 : Name +-> Code &
		ddbb3 : Name +-> Code &
		ddbb4 : Name +-> Code &
		ddbb5 : Name +-> Code &
		ddbb6 : Name +-> Code &
		ddbb7 : Name +-> Code &
		ddbb8 : Name +-> Code &
		ddbb9 : Name +-> Code

INITIALISATION  
	db0,db1,db2,db3,db4,db5,db6,db7,db8,db9 := {},{},{},{},{},{},{},{},{},{}
	||
	ddbb0,ddbb1,ddbb2,ddbb3,ddbb4,ddbb5,ddbb6,ddbb7,ddbb8,ddbb9 := {},{},{},{},{},{},{},{},{},{}
	
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
    END;
    

/* ------------------------------- */
add_ddbb0(nn,cc) =
	PRE
		nn:Name & cc:Code  &
		nn /: dom(ddbb0) 
	THEN
		ddbb0 := ddbb0 \/ { nn |-> cc}
	END;

update_ddbb0(nn,cc) =
	PRE
		nn:Name & cc:Code  &
		nn : dom(ddbb0)
	THEN
		ddbb0(nn) := cc
	END;

reset_ddbb0 = 
    PRE
       ddbb0: Name --> Code
    THEN
        ddbb0 := {}
    END;
/* ------------------------------- */
add_ddbb1(nn,cc) =
	PRE
		nn:Name & cc:Code  &
		nn /: dom(ddbb1) 
	THEN
		ddbb1 := ddbb1 \/ { nn |-> cc}
	END;

update_ddbb1(nn,cc) =
	PRE
		nn:Name & cc:Code  &
		nn : dom(ddbb1)
	THEN
		ddbb1(nn) := cc
	END;

reset_ddbb1 = 
    PRE
       ddbb1: Name --> Code
    THEN
        ddbb1 := {}
    END;
/* ------------------------------- */
add_ddbb2(nn,cc) =
	PRE
		nn:Name & cc:Code  &
		nn /: dom(ddbb2) 
	THEN
		ddbb2 := ddbb2 \/ { nn |-> cc}
	END;

update_ddbb2(nn,cc) =
	PRE
		nn:Name & cc:Code  &
		nn : dom(ddbb2)
	THEN
		ddbb2(nn) := cc
	END;

reset_ddbb2 = 
    PRE
       ddbb2: Name --> Code
    THEN
        ddbb2 := {}
    END;
/* ------------------------------- */
add_ddbb3(nn,cc) =
	PRE
		nn:Name & cc:Code  &
		nn /: dom(ddbb3) 
	THEN
		ddbb3 := ddbb3 \/ { nn |-> cc}
	END;

update_ddbb3(nn,cc) =
	PRE
		nn:Name & cc:Code  &
		nn : dom(ddbb3)
	THEN
		ddbb3(nn) := cc
	END;

reset_ddbb3 = 
    PRE
       ddbb3: Name --> Code
    THEN
        ddbb3 := {}
    END;
/* ------------------------------- */
add_ddbb4(nn,cc) =
	PRE
		nn:Name & cc:Code  &
		nn /: dom(ddbb4) 
	THEN
		ddbb4 := ddbb4 \/ { nn |-> cc}
	END;

update_ddbb4(nn,cc) =
	PRE
		nn:Name & cc:Code  &
		nn : dom(ddbb4)
	THEN
		ddbb4(nn) := cc
	END;

reset_ddbb4 = 
    PRE
       ddbb4: Name --> Code
    THEN
        ddbb4 := {}
    END;
/* ------------------------------- */
add_ddbb5(nn,cc) =
	PRE
		nn:Name & cc:Code  &
		nn /: dom(ddbb5) 
	THEN
		ddbb5 := ddbb5 \/ { nn |-> cc}
	END;

update_ddbb5(nn,cc) =
	PRE
		nn:Name & cc:Code  &
		nn : dom(ddbb5)
	THEN
		ddbb5(nn) := cc
	END;

reset_ddbb5 = 
    PRE
       ddbb5: Name --> Code
    THEN
        ddbb5 := {}
    END;
/* ------------------------------- */
add_ddbb6(nn,cc) =
	PRE
		nn:Name & cc:Code  &
		nn /: dom(ddbb6) 
	THEN
		ddbb6 := ddbb6 \/ { nn |-> cc}
	END;

update_ddbb6(nn,cc) =
	PRE
		nn:Name & cc:Code  &
		nn : dom(ddbb6)
	THEN
		ddbb6(nn) := cc
	END;

reset_ddbb6 = 
    PRE
       ddbb6: Name --> Code
    THEN
        ddbb6 := {}
    END;
/* ------------------------------- */
add_ddbb7(nn,cc) =
	PRE
		nn:Name & cc:Code  &
		nn /: dom(ddbb7) 
	THEN
		ddbb7 := ddbb7 \/ { nn |-> cc}
	END;

update_ddbb7(nn,cc) =
	PRE
		nn:Name & cc:Code  &
		nn : dom(ddbb7)
	THEN
		ddbb7(nn) := cc
	END;

reset_ddbb7 = 
    PRE
       ddbb7: Name --> Code
    THEN
        ddbb7 := {}
    END;
/* ------------------------------- */
add_ddbb8(nn,cc) =
	PRE
		nn:Name & cc:Code  &
		nn /: dom(ddbb8) 
	THEN
		ddbb8 := ddbb8 \/ { nn |-> cc}
	END;

update_ddbb8(nn,cc) =
	PRE
		nn:Name & cc:Code  &
		nn : dom(ddbb8)
	THEN
		ddbb8(nn) := cc
	END;

reset_ddbb8 = 
    PRE
       ddbb8: Name --> Code
    THEN
        ddbb8 := {}
    END;
/* ------------------------------- */
add_ddbb9(nn,cc) =
	PRE
		nn:Name & cc:Code  &
		nn /: dom(ddbb9) 
	THEN
		ddbb9 := ddbb9 \/ { nn |-> cc}
	END;

update_ddbb9(nn,cc) =
	PRE
		nn:Name & cc:Code  &
		nn : dom(ddbb9)
	THEN
		ddbb9(nn) := cc
	END;

reset_ddbb9 = 
    PRE
       ddbb9: Name --> Code
    THEN
        ddbb9 := {}
    END
END


