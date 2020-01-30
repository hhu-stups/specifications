MACHINE phonebook_40

SETS
	Name; Code 

VARIABLES db0,db1,db2,db3,db4,db5,db6,db7,db8,db9,
          ddbb0,ddbb1,ddbb2,ddbb3,ddbb4,ddbb5,ddbb6,ddbb7,ddbb8,ddbb9,
          
          dddbbb0,dddbbb1,dddbbb2,dddbbb3,dddbbb4,dddbbb5,dddbbb6,dddbbb7,dddbbb8,dddbbb9,
          ddddbbbb0,ddddbbbb1,ddddbbbb2,ddddbbbb3,ddddbbbb4,ddddbbbb5,ddddbbbb6,ddddbbbb7,ddddbbbb8,ddddbbbb9

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
		&
		dddbbb0 : Name +-> Code &
		dddbbb1 : Name +-> Code &
		dddbbb2 : Name +-> Code &
		dddbbb3 : Name +-> Code &
		dddbbb4 : Name +-> Code &
		dddbbb5 : Name +-> Code &
		dddbbb6 : Name +-> Code &
		dddbbb7 : Name +-> Code &
		dddbbb8 : Name +-> Code &
		dddbbb9 : Name +-> Code
		&
		ddddbbbb0 : Name +-> Code &
		ddddbbbb1 : Name +-> Code &
		ddddbbbb2 : Name +-> Code &
		ddddbbbb3 : Name +-> Code &
		ddddbbbb4 : Name +-> Code &
		ddddbbbb5 : Name +-> Code &
		ddddbbbb6 : Name +-> Code &
		ddddbbbb7 : Name +-> Code &
		ddddbbbb8 : Name +-> Code &
		ddddbbbb9 : Name +-> Code

INITIALISATION  

	db0,db1,db2,db3,db4,db5,db6,db7,db8,db9 := {},{},{},{},{},{},{},{},{},{}
	||
	ddbb0,ddbb1,ddbb2,ddbb3,ddbb4,ddbb5,ddbb6,ddbb7,ddbb8,ddbb9 := {},{},{},{},{},{},{},{},{},{}
	||
	dddbbb0,dddbbb1,dddbbb2,dddbbb3,dddbbb4,dddbbb5,dddbbb6,dddbbb7,dddbbb8,dddbbb9 := {},{},{},{},{},{},{},{},{},{}
	||
	ddddbbbb0,ddddbbbb1,ddddbbbb2,ddddbbbb3,ddddbbbb4,ddddbbbb5,ddddbbbb6,ddddbbbb7,ddddbbbb8,ddddbbbb9 := {},{},{},{},{},{},{},{},{},{}
	
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
    END;




/* ------------------------------- */
add_dddbbb0(nn,cc) =
	PRE
		nn:Name & cc:Code  &
		nn /: dom(dddbbb0) 
	THEN
		dddbbb0 := dddbbb0 \/ { nn |-> cc}
	END;

update_dddbbb0(nn,cc) =
	PRE
		nn:Name & cc:Code  &
		nn : dom(dddbbb0)
	THEN
		dddbbb0(nn) := cc
	END;

reset_dddbbb0 = 
    PRE
       dddbbb0: Name --> Code
    THEN
        dddbbb0 := {}
    END;
/* ------------------------------- */
add_dddbbb1(nn,cc) =
	PRE
		nn:Name & cc:Code  &
		nn /: dom(dddbbb1) 
	THEN
		dddbbb1 := dddbbb1 \/ { nn |-> cc}
	END;

update_dddbbb1(nn,cc) =
	PRE
		nn:Name & cc:Code  &
		nn : dom(dddbbb1)
	THEN
		dddbbb1(nn) := cc
	END;

reset_dddbbb1 = 
    PRE
       dddbbb1: Name --> Code
    THEN
        dddbbb1 := {}
    END;
/* ------------------------------- */
add_dddbbb2(nn,cc) =
	PRE
		nn:Name & cc:Code  &
		nn /: dom(dddbbb2) 
	THEN
		dddbbb2 := dddbbb2 \/ { nn |-> cc}
	END;

update_dddbbb2(nn,cc) =
	PRE
		nn:Name & cc:Code  &
		nn : dom(dddbbb2)
	THEN
		dddbbb2(nn) := cc
	END;

reset_dddbbb2 = 
    PRE
       dddbbb2: Name --> Code
    THEN
        dddbbb2 := {}
    END;
/* ------------------------------- */
add_dddbbb3(nn,cc) =
	PRE
		nn:Name & cc:Code  &
		nn /: dom(dddbbb3) 
	THEN
		dddbbb3 := dddbbb3 \/ { nn |-> cc}
	END;

update_dddbbb3(nn,cc) =
	PRE
		nn:Name & cc:Code  &
		nn : dom(dddbbb3)
	THEN
		dddbbb3(nn) := cc
	END;

reset_dddbbb3 = 
    PRE
       dddbbb3: Name --> Code
    THEN
        dddbbb3 := {}
    END;
/* ------------------------------- */
add_dddbbb4(nn,cc) =
	PRE
		nn:Name & cc:Code  &
		nn /: dom(dddbbb4) 
	THEN
		dddbbb4 := dddbbb4 \/ { nn |-> cc}
	END;

update_dddbbb4(nn,cc) =
	PRE
		nn:Name & cc:Code  &
		nn : dom(dddbbb4)
	THEN
		dddbbb4(nn) := cc
	END;

reset_dddbbb4 = 
    PRE
       dddbbb4: Name --> Code
    THEN
        dddbbb4 := {}
    END;
/* ------------------------------- */
add_dddbbb5(nn,cc) =
	PRE
		nn:Name & cc:Code  &
		nn /: dom(dddbbb5) 
	THEN
		dddbbb5 := dddbbb5 \/ { nn |-> cc}
	END;

update_dddbbb5(nn,cc) =
	PRE
		nn:Name & cc:Code  &
		nn : dom(dddbbb5)
	THEN
		dddbbb5(nn) := cc
	END;

reset_dddbbb5 = 
    PRE
       dddbbb5: Name --> Code
    THEN
        dddbbb5 := {}
    END;
/* ------------------------------- */
add_dddbbb6(nn,cc) =
	PRE
		nn:Name & cc:Code  &
		nn /: dom(dddbbb6) 
	THEN
		dddbbb6 := dddbbb6 \/ { nn |-> cc}
	END;

update_dddbbb6(nn,cc) =
	PRE
		nn:Name & cc:Code  &
		nn : dom(dddbbb6)
	THEN
		dddbbb6(nn) := cc
	END;

reset_dddbbb6 = 
    PRE
       dddbbb6: Name --> Code
    THEN
        dddbbb6 := {}
    END;
/* ------------------------------- */
add_dddbbb7(nn,cc) =
	PRE
		nn:Name & cc:Code  &
		nn /: dom(dddbbb7) 
	THEN
		dddbbb7 := dddbbb7 \/ { nn |-> cc}
	END;

update_dddbbb7(nn,cc) =
	PRE
		nn:Name & cc:Code  &
		nn : dom(dddbbb7)
	THEN
		dddbbb7(nn) := cc
	END;

reset_dddbbb7 = 
    PRE
       dddbbb7: Name --> Code
    THEN
        dddbbb7 := {}
    END;
/* ------------------------------- */
add_dddbbb8(nn,cc) =
	PRE
		nn:Name & cc:Code  &
		nn /: dom(dddbbb8) 
	THEN
		dddbbb8 := dddbbb8 \/ { nn |-> cc}
	END;

update_dddbbb8(nn,cc) =
	PRE
		nn:Name & cc:Code  &
		nn : dom(dddbbb8)
	THEN
		dddbbb8(nn) := cc
	END;

reset_dddbbb8 = 
    PRE
       dddbbb8: Name --> Code
    THEN
        dddbbb8 := {}
    END;
/* ------------------------------- */
add_dddbbb9(nn,cc) =
	PRE
		nn:Name & cc:Code  &
		nn /: dom(dddbbb9) 
	THEN
		dddbbb9 := dddbbb9 \/ { nn |-> cc}
	END;

update_dddbbb9(nn,cc) =
	PRE
		nn:Name & cc:Code  &
		nn : dom(dddbbb9)
	THEN
		dddbbb9(nn) := cc
	END;

reset_dddbbb9 = 
    PRE
       dddbbb9: Name --> Code
    THEN
        dddbbb9 := {}
    END;
    

/* ------------------------------- */
add_ddddbbbb0(nn,cc) =
	PRE
		nn:Name & cc:Code  &
		nn /: dom(ddddbbbb0) 
	THEN
		ddddbbbb0 := ddddbbbb0 \/ { nn |-> cc}
	END;

update_ddddbbbb0(nn,cc) =
	PRE
		nn:Name & cc:Code  &
		nn : dom(ddddbbbb0)
	THEN
		ddddbbbb0(nn) := cc
	END;

reset_ddddbbbb0 = 
    PRE
       ddddbbbb0: Name --> Code
    THEN
        ddddbbbb0 := {}
    END;
/* ------------------------------- */
add_ddddbbbb1(nn,cc) =
	PRE
		nn:Name & cc:Code  &
		nn /: dom(ddddbbbb1) 
	THEN
		ddddbbbb1 := ddddbbbb1 \/ { nn |-> cc}
	END;

update_ddddbbbb1(nn,cc) =
	PRE
		nn:Name & cc:Code  &
		nn : dom(ddddbbbb1)
	THEN
		ddddbbbb1(nn) := cc
	END;

reset_ddddbbbb1 = 
    PRE
       ddddbbbb1: Name --> Code
    THEN
        ddddbbbb1 := {}
    END;
/* ------------------------------- */
add_ddddbbbb2(nn,cc) =
	PRE
		nn:Name & cc:Code  &
		nn /: dom(ddddbbbb2) 
	THEN
		ddddbbbb2 := ddddbbbb2 \/ { nn |-> cc}
	END;

update_ddddbbbb2(nn,cc) =
	PRE
		nn:Name & cc:Code  &
		nn : dom(ddddbbbb2)
	THEN
		ddddbbbb2(nn) := cc
	END;

reset_ddddbbbb2 = 
    PRE
       ddddbbbb2: Name --> Code
    THEN
        ddddbbbb2 := {}
    END;
/* ------------------------------- */
add_ddddbbbb3(nn,cc) =
	PRE
		nn:Name & cc:Code  &
		nn /: dom(ddddbbbb3) 
	THEN
		ddddbbbb3 := ddddbbbb3 \/ { nn |-> cc}
	END;

update_ddddbbbb3(nn,cc) =
	PRE
		nn:Name & cc:Code  &
		nn : dom(ddddbbbb3)
	THEN
		ddddbbbb3(nn) := cc
	END;

reset_ddddbbbb3 = 
    PRE
       ddddbbbb3: Name --> Code
    THEN
        ddddbbbb3 := {}
    END;
/* ------------------------------- */
add_ddddbbbb4(nn,cc) =
	PRE
		nn:Name & cc:Code  &
		nn /: dom(ddddbbbb4) 
	THEN
		ddddbbbb4 := ddddbbbb4 \/ { nn |-> cc}
	END;

update_ddddbbbb4(nn,cc) =
	PRE
		nn:Name & cc:Code  &
		nn : dom(ddddbbbb4)
	THEN
		ddddbbbb4(nn) := cc
	END;

reset_ddddbbbb4 = 
    PRE
       ddddbbbb4: Name --> Code
    THEN
        ddddbbbb4 := {}
    END;
/* ------------------------------- */
add_ddddbbbb5(nn,cc) =
	PRE
		nn:Name & cc:Code  &
		nn /: dom(ddddbbbb5) 
	THEN
		ddddbbbb5 := ddddbbbb5 \/ { nn |-> cc}
	END;

update_ddddbbbb5(nn,cc) =
	PRE
		nn:Name & cc:Code  &
		nn : dom(ddddbbbb5)
	THEN
		ddddbbbb5(nn) := cc
	END;

reset_ddddbbbb5 = 
    PRE
       ddddbbbb5: Name --> Code
    THEN
        ddddbbbb5 := {}
    END;
/* ------------------------------- */
add_ddddbbbb6(nn,cc) =
	PRE
		nn:Name & cc:Code  &
		nn /: dom(ddddbbbb6) 
	THEN
		ddddbbbb6 := ddddbbbb6 \/ { nn |-> cc}
	END;

update_ddddbbbb6(nn,cc) =
	PRE
		nn:Name & cc:Code  &
		nn : dom(ddddbbbb6)
	THEN
		ddddbbbb6(nn) := cc
	END;

reset_ddddbbbb6 = 
    PRE
       ddddbbbb6: Name --> Code
    THEN
        ddddbbbb6 := {}
    END;
/* ------------------------------- */
add_ddddbbbb7(nn,cc) =
	PRE
		nn:Name & cc:Code  &
		nn /: dom(ddddbbbb7) 
	THEN
		ddddbbbb7 := ddddbbbb7 \/ { nn |-> cc}
	END;

update_ddddbbbb7(nn,cc) =
	PRE
		nn:Name & cc:Code  &
		nn : dom(ddddbbbb7)
	THEN
		ddddbbbb7(nn) := cc
	END;

reset_ddddbbbb7 = 
    PRE
       ddddbbbb7: Name --> Code
    THEN
        ddddbbbb7 := {}
    END;
/* ------------------------------- */
add_ddddbbbb8(nn,cc) =
	PRE
		nn:Name & cc:Code  &
		nn /: dom(ddddbbbb8) 
	THEN
		ddddbbbb8 := ddddbbbb8 \/ { nn |-> cc}
	END;

update_ddddbbbb8(nn,cc) =
	PRE
		nn:Name & cc:Code  &
		nn : dom(ddddbbbb8)
	THEN
		ddddbbbb8(nn) := cc
	END;

reset_ddddbbbb8 = 
    PRE
       ddddbbbb8: Name --> Code
    THEN
        ddddbbbb8 := {}
    END;
/* ------------------------------- */
add_ddddbbbb9(nn,cc) =
	PRE
		nn:Name & cc:Code  &
		nn /: dom(ddddbbbb9) 
	THEN
		ddddbbbb9 := ddddbbbb9 \/ { nn |-> cc}
	END;

update_ddddbbbb9(nn,cc) =
	PRE
		nn:Name & cc:Code  &
		nn : dom(ddddbbbb9)
	THEN
		ddddbbbb9(nn) := cc
	END;

reset_ddddbbbb9 = 
    PRE
       ddddbbbb9: Name --> Code
    THEN
        ddddbbbb9 := {}
    END
END


