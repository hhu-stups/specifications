MACHINE phonebook_80

SETS
	Name; Code 

VARIABLES db0,db1,db2,db3,db4,db5,db6,db7,db8,db9,
          ddbb0,ddbb1,ddbb2,ddbb3,ddbb4,ddbb5,ddbb6,ddbb7,ddbb8,ddbb9,
          
          dddbbb0,dddbbb1,dddbbb2,dddbbb3,dddbbb4,dddbbb5,dddbbb6,dddbbb7,dddbbb8,dddbbb9,
          ddddbbbb0,ddddbbbb1,ddddbbbb2,ddddbbbb3,ddddbbbb4,ddddbbbb5,
          ddddbbbb6,ddddbbbb7,ddddbbbb8,ddddbbbb9,

          dddddbbbbb0,dddddbbbbb1,dddddbbbbb2,dddddbbbbb3,dddddbbbbb4,dddddbbbbb5,dddddbbbbb6,dddddbbbbb7,dddddbbbbb8,dddddbbbbb9,
          ddddddbbbbbb0,ddddddbbbbbb1,ddddddbbbbbb2,ddddddbbbbbb3,ddddddbbbbbb4,ddddddbbbbbb5,ddddddbbbbbb6,ddddddbbbbbb7,ddddddbbbbbb8,ddddddbbbbbb9,
          
          dddddddbbbbbbb0,dddddddbbbbbbb1,dddddddbbbbbbb2,dddddddbbbbbbb3,dddddddbbbbbbb4,dddddddbbbbbbb5,dddddddbbbbbbb6,dddddddbbbbbbb7,dddddddbbbbbbb8,dddddddbbbbbbb9,
          ddddddddbbbbbbbb0,ddddddddbbbbbbbb1,ddddddddbbbbbbbb2,ddddddddbbbbbbbb3,ddddddddbbbbbbbb4,ddddddddbbbbbbbb5,ddddddddbbbbbbbb6,ddddddddbbbbbbbb7,ddddddddbbbbbbbb8,ddddddddbbbbbbbb9

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
		
		&
		
		
		dddddbbbbb0 : Name +-> Code &
		dddddbbbbb1 : Name +-> Code &
		dddddbbbbb2 : Name +-> Code &
		dddddbbbbb3 : Name +-> Code &
		dddddbbbbb4 : Name +-> Code &
		dddddbbbbb5 : Name +-> Code &
		dddddbbbbb6 : Name +-> Code &
		dddddbbbbb7 : Name +-> Code &
		dddddbbbbb8 : Name +-> Code &
		dddddbbbbb9 : Name +-> Code
		&
		ddddddbbbbbb0 : Name +-> Code &
		ddddddbbbbbb1 : Name +-> Code &
		ddddddbbbbbb2 : Name +-> Code &
		ddddddbbbbbb3 : Name +-> Code &
		ddddddbbbbbb4 : Name +-> Code &
		ddddddbbbbbb5 : Name +-> Code &
		ddddddbbbbbb6 : Name +-> Code &
		ddddddbbbbbb7 : Name +-> Code &
		ddddddbbbbbb8 : Name +-> Code &
		ddddddbbbbbb9 : Name +-> Code
		&
		dddddddbbbbbbb0 : Name +-> Code &
		dddddddbbbbbbb1 : Name +-> Code &
		dddddddbbbbbbb2 : Name +-> Code &
		dddddddbbbbbbb3 : Name +-> Code &
		dddddddbbbbbbb4 : Name +-> Code &
		dddddddbbbbbbb5 : Name +-> Code &
		dddddddbbbbbbb6 : Name +-> Code &
		dddddddbbbbbbb7 : Name +-> Code &
		dddddddbbbbbbb8 : Name +-> Code &
		dddddddbbbbbbb9 : Name +-> Code
		&
		ddddddddbbbbbbbb0 : Name +-> Code &
		ddddddddbbbbbbbb1 : Name +-> Code &
		ddddddddbbbbbbbb2 : Name +-> Code &
		ddddddddbbbbbbbb3 : Name +-> Code &
		ddddddddbbbbbbbb4 : Name +-> Code &
		ddddddddbbbbbbbb5 : Name +-> Code &
		ddddddddbbbbbbbb6 : Name +-> Code &
		ddddddddbbbbbbbb7 : Name +-> Code &
		ddddddddbbbbbbbb8 : Name +-> Code &
		ddddddddbbbbbbbb9 : Name +-> Code

INITIALISATION  


	db0,db1,db2,db3,db4,db5,db6,db7,db8,db9 := {},{},{},{},{},{},{},{},{},{}
	||
	ddbb0,ddbb1,ddbb2,ddbb3,ddbb4,ddbb5,ddbb6,ddbb7,ddbb8,ddbb9 := {},{},{},{},{},{},{},{},{},{}
	||
	dddbbb0,dddbbb1,dddbbb2,dddbbb3,dddbbb4,dddbbb5,dddbbb6,dddbbb7,dddbbb8,dddbbb9 := {},{},{},{},{},{},{},{},{},{}
	||
	ddddbbbb0,ddddbbbb1,ddddbbbb2,ddddbbbb3,ddddbbbb4,ddddbbbb5,ddddbbbb6,ddddbbbb7,ddddbbbb8,ddddbbbb9 := {},{},{},{},{},{},{},{},{},{}
	
	||

	dddddbbbbb0,dddddbbbbb1,dddddbbbbb2,dddddbbbbb3,dddddbbbbb4,dddddbbbbb5,dddddbbbbb6,dddddbbbbb7,dddddbbbbb8,dddddbbbbb9 := {},{},{},{},{},{},{},{},{},{}
	||
	ddddddbbbbbb0,ddddddbbbbbb1,ddddddbbbbbb2,ddddddbbbbbb3,ddddddbbbbbb4,ddddddbbbbbb5,ddddddbbbbbb6,ddddddbbbbbb7,ddddddbbbbbb8,ddddddbbbbbb9 := {},{},{},{},{},{},{},{},{},{}
	||
	dddddddbbbbbbb0,dddddddbbbbbbb1,dddddddbbbbbbb2,dddddddbbbbbbb3,dddddddbbbbbbb4,dddddddbbbbbbb5,dddddddbbbbbbb6,dddddddbbbbbbb7,dddddddbbbbbbb8,dddddddbbbbbbb9 := {},{},{},{},{},{},{},{},{},{}
	||
	ddddddddbbbbbbbb0,ddddddddbbbbbbbb1,ddddddddbbbbbbbb2,ddddddddbbbbbbbb3,ddddddddbbbbbbbb4,ddddddddbbbbbbbb5,ddddddddbbbbbbbb6,ddddddddbbbbbbbb7,ddddddddbbbbbbbb8,ddddddddbbbbbbbb9 := {},{},{},{},{},{},{},{},{},{}
	
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
    END;



/* ------------------------------- */
add_dddddbbbbb0(nn,cc) =
	PRE
		nn:Name & cc:Code  &
		nn /: dom(dddddbbbbb0) 
	THEN
		dddddbbbbb0 := dddddbbbbb0 \/ { nn |-> cc}
	END;

update_dddddbbbbb0(nn,cc) =
	PRE
		nn:Name & cc:Code  &
		nn : dom(dddddbbbbb0)
	THEN
		dddddbbbbb0(nn) := cc
	END;

reset_dddddbbbbb0 = 
    PRE
       dddddbbbbb0: Name --> Code
    THEN
        dddddbbbbb0 := {}
    END;
/* ------------------------------- */
add_dddddbbbbb1(nn,cc) =
	PRE
		nn:Name & cc:Code  &
		nn /: dom(dddddbbbbb1) 
	THEN
		dddddbbbbb1 := dddddbbbbb1 \/ { nn |-> cc}
	END;

update_dddddbbbbb1(nn,cc) =
	PRE
		nn:Name & cc:Code  &
		nn : dom(dddddbbbbb1)
	THEN
		dddddbbbbb1(nn) := cc
	END;

reset_dddddbbbbb1 = 
    PRE
       dddddbbbbb1: Name --> Code
    THEN
        dddddbbbbb1 := {}
    END;
/* ------------------------------- */
add_dddddbbbbb2(nn,cc) =
	PRE
		nn:Name & cc:Code  &
		nn /: dom(dddddbbbbb2) 
	THEN
		dddddbbbbb2 := dddddbbbbb2 \/ { nn |-> cc}
	END;

update_dddddbbbbb2(nn,cc) =
	PRE
		nn:Name & cc:Code  &
		nn : dom(dddddbbbbb2)
	THEN
		dddddbbbbb2(nn) := cc
	END;

reset_dddddbbbbb2 = 
    PRE
       dddddbbbbb2: Name --> Code
    THEN
        dddddbbbbb2 := {}
    END;
/* ------------------------------- */
add_dddddbbbbb3(nn,cc) =
	PRE
		nn:Name & cc:Code  &
		nn /: dom(dddddbbbbb3) 
	THEN
		dddddbbbbb3 := dddddbbbbb3 \/ { nn |-> cc}
	END;

update_dddddbbbbb3(nn,cc) =
	PRE
		nn:Name & cc:Code  &
		nn : dom(dddddbbbbb3)
	THEN
		dddddbbbbb3(nn) := cc
	END;

reset_dddddbbbbb3 = 
    PRE
       dddddbbbbb3: Name --> Code
    THEN
        dddddbbbbb3 := {}
    END;
/* ------------------------------- */
add_dddddbbbbb4(nn,cc) =
	PRE
		nn:Name & cc:Code  &
		nn /: dom(dddddbbbbb4) 
	THEN
		dddddbbbbb4 := dddddbbbbb4 \/ { nn |-> cc}
	END;

update_dddddbbbbb4(nn,cc) =
	PRE
		nn:Name & cc:Code  &
		nn : dom(dddddbbbbb4)
	THEN
		dddddbbbbb4(nn) := cc
	END;

reset_dddddbbbbb4 = 
    PRE
       dddddbbbbb4: Name --> Code
    THEN
        dddddbbbbb4 := {}
    END;
/* ------------------------------- */
add_dddddbbbbb5(nn,cc) =
	PRE
		nn:Name & cc:Code  &
		nn /: dom(dddddbbbbb5) 
	THEN
		dddddbbbbb5 := dddddbbbbb5 \/ { nn |-> cc}
	END;

update_dddddbbbbb5(nn,cc) =
	PRE
		nn:Name & cc:Code  &
		nn : dom(dddddbbbbb5)
	THEN
		dddddbbbbb5(nn) := cc
	END;

reset_dddddbbbbb5 = 
    PRE
       dddddbbbbb5: Name --> Code
    THEN
        dddddbbbbb5 := {}
    END;
/* ------------------------------- */
add_dddddbbbbb6(nn,cc) =
	PRE
		nn:Name & cc:Code  &
		nn /: dom(dddddbbbbb6) 
	THEN
		dddddbbbbb6 := dddddbbbbb6 \/ { nn |-> cc}
	END;

update_dddddbbbbb6(nn,cc) =
	PRE
		nn:Name & cc:Code  &
		nn : dom(dddddbbbbb6)
	THEN
		dddddbbbbb6(nn) := cc
	END;

reset_dddddbbbbb6 = 
    PRE
       dddddbbbbb6: Name --> Code
    THEN
        dddddbbbbb6 := {}
    END;
/* ------------------------------- */
add_dddddbbbbb7(nn,cc) =
	PRE
		nn:Name & cc:Code  &
		nn /: dom(dddddbbbbb7) 
	THEN
		dddddbbbbb7 := dddddbbbbb7 \/ { nn |-> cc}
	END;

update_dddddbbbbb7(nn,cc) =
	PRE
		nn:Name & cc:Code  &
		nn : dom(dddddbbbbb7)
	THEN
		dddddbbbbb7(nn) := cc
	END;

reset_dddddbbbbb7 = 
    PRE
       dddddbbbbb7: Name --> Code
    THEN
        dddddbbbbb7 := {}
    END;
/* ------------------------------- */
add_dddddbbbbb8(nn,cc) =
	PRE
		nn:Name & cc:Code  &
		nn /: dom(dddddbbbbb8) 
	THEN
		dddddbbbbb8 := dddddbbbbb8 \/ { nn |-> cc}
	END;

update_dddddbbbbb8(nn,cc) =
	PRE
		nn:Name & cc:Code  &
		nn : dom(dddddbbbbb8)
	THEN
		dddddbbbbb8(nn) := cc
	END;

reset_dddddbbbbb8 = 
    PRE
       dddddbbbbb8: Name --> Code
    THEN
        dddddbbbbb8 := {}
    END;
/* ------------------------------- */
add_dddddbbbbb9(nn,cc) =
	PRE
		nn:Name & cc:Code  &
		nn /: dom(dddddbbbbb9) 
	THEN
		dddddbbbbb9 := dddddbbbbb9 \/ { nn |-> cc}
	END;

update_dddddbbbbb9(nn,cc) =
	PRE
		nn:Name & cc:Code  &
		nn : dom(dddddbbbbb9)
	THEN
		dddddbbbbb9(nn) := cc
	END;

reset_dddddbbbbb9 = 
    PRE
       dddddbbbbb9: Name --> Code
    THEN
        dddddbbbbb9 := {}
    END;
    

/* ------------------------------- */
add_ddddddbbbbbb0(nn,cc) =
	PRE
		nn:Name & cc:Code  &
		nn /: dom(ddddddbbbbbb0) 
	THEN
		ddddddbbbbbb0 := ddddddbbbbbb0 \/ { nn |-> cc}
	END;

update_ddddddbbbbbb0(nn,cc) =
	PRE
		nn:Name & cc:Code  &
		nn : dom(ddddddbbbbbb0)
	THEN
		ddddddbbbbbb0(nn) := cc
	END;

reset_ddddddbbbbbb0 = 
    PRE
       ddddddbbbbbb0: Name --> Code
    THEN
        ddddddbbbbbb0 := {}
    END;
/* ------------------------------- */
add_ddddddbbbbbb1(nn,cc) =
	PRE
		nn:Name & cc:Code  &
		nn /: dom(ddddddbbbbbb1) 
	THEN
		ddddddbbbbbb1 := ddddddbbbbbb1 \/ { nn |-> cc}
	END;

update_ddddddbbbbbb1(nn,cc) =
	PRE
		nn:Name & cc:Code  &
		nn : dom(ddddddbbbbbb1)
	THEN
		ddddddbbbbbb1(nn) := cc
	END;

reset_ddddddbbbbbb1 = 
    PRE
       ddddddbbbbbb1: Name --> Code
    THEN
        ddddddbbbbbb1 := {}
    END;
/* ------------------------------- */
add_ddddddbbbbbb2(nn,cc) =
	PRE
		nn:Name & cc:Code  &
		nn /: dom(ddddddbbbbbb2) 
	THEN
		ddddddbbbbbb2 := ddddddbbbbbb2 \/ { nn |-> cc}
	END;

update_ddddddbbbbbb2(nn,cc) =
	PRE
		nn:Name & cc:Code  &
		nn : dom(ddddddbbbbbb2)
	THEN
		ddddddbbbbbb2(nn) := cc
	END;

reset_ddddddbbbbbb2 = 
    PRE
       ddddddbbbbbb2: Name --> Code
    THEN
        ddddddbbbbbb2 := {}
    END;
/* ------------------------------- */
add_ddddddbbbbbb3(nn,cc) =
	PRE
		nn:Name & cc:Code  &
		nn /: dom(ddddddbbbbbb3) 
	THEN
		ddddddbbbbbb3 := ddddddbbbbbb3 \/ { nn |-> cc}
	END;

update_ddddddbbbbbb3(nn,cc) =
	PRE
		nn:Name & cc:Code  &
		nn : dom(ddddddbbbbbb3)
	THEN
		ddddddbbbbbb3(nn) := cc
	END;

reset_ddddddbbbbbb3 = 
    PRE
       ddddddbbbbbb3: Name --> Code
    THEN
        ddddddbbbbbb3 := {}
    END;
/* ------------------------------- */
add_ddddddbbbbbb4(nn,cc) =
	PRE
		nn:Name & cc:Code  &
		nn /: dom(ddddddbbbbbb4) 
	THEN
		ddddddbbbbbb4 := ddddddbbbbbb4 \/ { nn |-> cc}
	END;

update_ddddddbbbbbb4(nn,cc) =
	PRE
		nn:Name & cc:Code  &
		nn : dom(ddddddbbbbbb4)
	THEN
		ddddddbbbbbb4(nn) := cc
	END;

reset_ddddddbbbbbb4 = 
    PRE
       ddddddbbbbbb4: Name --> Code
    THEN
        ddddddbbbbbb4 := {}
    END;
/* ------------------------------- */
add_ddddddbbbbbb5(nn,cc) =
	PRE
		nn:Name & cc:Code  &
		nn /: dom(ddddddbbbbbb5) 
	THEN
		ddddddbbbbbb5 := ddddddbbbbbb5 \/ { nn |-> cc}
	END;

update_ddddddbbbbbb5(nn,cc) =
	PRE
		nn:Name & cc:Code  &
		nn : dom(ddddddbbbbbb5)
	THEN
		ddddddbbbbbb5(nn) := cc
	END;

reset_ddddddbbbbbb5 = 
    PRE
       ddddddbbbbbb5: Name --> Code
    THEN
        ddddddbbbbbb5 := {}
    END;
/* ------------------------------- */
add_ddddddbbbbbb6(nn,cc) =
	PRE
		nn:Name & cc:Code  &
		nn /: dom(ddddddbbbbbb6) 
	THEN
		ddddddbbbbbb6 := ddddddbbbbbb6 \/ { nn |-> cc}
	END;

update_ddddddbbbbbb6(nn,cc) =
	PRE
		nn:Name & cc:Code  &
		nn : dom(ddddddbbbbbb6)
	THEN
		ddddddbbbbbb6(nn) := cc
	END;

reset_ddddddbbbbbb6 = 
    PRE
       ddddddbbbbbb6: Name --> Code
    THEN
        ddddddbbbbbb6 := {}
    END;
/* ------------------------------- */
add_ddddddbbbbbb7(nn,cc) =
	PRE
		nn:Name & cc:Code  &
		nn /: dom(ddddddbbbbbb7) 
	THEN
		ddddddbbbbbb7 := ddddddbbbbbb7 \/ { nn |-> cc}
	END;

update_ddddddbbbbbb7(nn,cc) =
	PRE
		nn:Name & cc:Code  &
		nn : dom(ddddddbbbbbb7)
	THEN
		ddddddbbbbbb7(nn) := cc
	END;

reset_ddddddbbbbbb7 = 
    PRE
       ddddddbbbbbb7: Name --> Code
    THEN
        ddddddbbbbbb7 := {}
    END;
/* ------------------------------- */
add_ddddddbbbbbb8(nn,cc) =
	PRE
		nn:Name & cc:Code  &
		nn /: dom(ddddddbbbbbb8) 
	THEN
		ddddddbbbbbb8 := ddddddbbbbbb8 \/ { nn |-> cc}
	END;

update_ddddddbbbbbb8(nn,cc) =
	PRE
		nn:Name & cc:Code  &
		nn : dom(ddddddbbbbbb8)
	THEN
		ddddddbbbbbb8(nn) := cc
	END;

reset_ddddddbbbbbb8 = 
    PRE
       ddddddbbbbbb8: Name --> Code
    THEN
        ddddddbbbbbb8 := {}
    END;
/* ------------------------------- */
add_ddddddbbbbbb9(nn,cc) =
	PRE
		nn:Name & cc:Code  &
		nn /: dom(ddddddbbbbbb9) 
	THEN
		ddddddbbbbbb9 := ddddddbbbbbb9 \/ { nn |-> cc}
	END;

update_ddddddbbbbbb9(nn,cc) =
	PRE
		nn:Name & cc:Code  &
		nn : dom(ddddddbbbbbb9)
	THEN
		ddddddbbbbbb9(nn) := cc
	END;

reset_ddddddbbbbbb9 = 
    PRE
       ddddddbbbbbb9: Name --> Code
    THEN
        ddddddbbbbbb9 := {}
    END;




/* ------------------------------- */
add_dddddddbbbbbbb0(nn,cc) =
	PRE
		nn:Name & cc:Code  &
		nn /: dom(dddddddbbbbbbb0) 
	THEN
		dddddddbbbbbbb0 := dddddddbbbbbbb0 \/ { nn |-> cc}
	END;

update_dddddddbbbbbbb0(nn,cc) =
	PRE
		nn:Name & cc:Code  &
		nn : dom(dddddddbbbbbbb0)
	THEN
		dddddddbbbbbbb0(nn) := cc
	END;

reset_dddddddbbbbbbb0 = 
    PRE
       dddddddbbbbbbb0: Name --> Code
    THEN
        dddddddbbbbbbb0 := {}
    END;
/* ------------------------------- */
add_dddddddbbbbbbb1(nn,cc) =
	PRE
		nn:Name & cc:Code  &
		nn /: dom(dddddddbbbbbbb1) 
	THEN
		dddddddbbbbbbb1 := dddddddbbbbbbb1 \/ { nn |-> cc}
	END;

update_dddddddbbbbbbb1(nn,cc) =
	PRE
		nn:Name & cc:Code  &
		nn : dom(dddddddbbbbbbb1)
	THEN
		dddddddbbbbbbb1(nn) := cc
	END;

reset_dddddddbbbbbbb1 = 
    PRE
       dddddddbbbbbbb1: Name --> Code
    THEN
        dddddddbbbbbbb1 := {}
    END;
/* ------------------------------- */
add_dddddddbbbbbbb2(nn,cc) =
	PRE
		nn:Name & cc:Code  &
		nn /: dom(dddddddbbbbbbb2) 
	THEN
		dddddddbbbbbbb2 := dddddddbbbbbbb2 \/ { nn |-> cc}
	END;

update_dddddddbbbbbbb2(nn,cc) =
	PRE
		nn:Name & cc:Code  &
		nn : dom(dddddddbbbbbbb2)
	THEN
		dddddddbbbbbbb2(nn) := cc
	END;

reset_dddddddbbbbbbb2 = 
    PRE
       dddddddbbbbbbb2: Name --> Code
    THEN
        dddddddbbbbbbb2 := {}
    END;
/* ------------------------------- */
add_dddddddbbbbbbb3(nn,cc) =
	PRE
		nn:Name & cc:Code  &
		nn /: dom(dddddddbbbbbbb3) 
	THEN
		dddddddbbbbbbb3 := dddddddbbbbbbb3 \/ { nn |-> cc}
	END;

update_dddddddbbbbbbb3(nn,cc) =
	PRE
		nn:Name & cc:Code  &
		nn : dom(dddddddbbbbbbb3)
	THEN
		dddddddbbbbbbb3(nn) := cc
	END;

reset_dddddddbbbbbbb3 = 
    PRE
       dddddddbbbbbbb3: Name --> Code
    THEN
        dddddddbbbbbbb3 := {}
    END;
/* ------------------------------- */
add_dddddddbbbbbbb4(nn,cc) =
	PRE
		nn:Name & cc:Code  &
		nn /: dom(dddddddbbbbbbb4) 
	THEN
		dddddddbbbbbbb4 := dddddddbbbbbbb4 \/ { nn |-> cc}
	END;

update_dddddddbbbbbbb4(nn,cc) =
	PRE
		nn:Name & cc:Code  &
		nn : dom(dddddddbbbbbbb4)
	THEN
		dddddddbbbbbbb4(nn) := cc
	END;

reset_dddddddbbbbbbb4 = 
    PRE
       dddddddbbbbbbb4: Name --> Code
    THEN
        dddddddbbbbbbb4 := {}
    END;
/* ------------------------------- */
add_dddddddbbbbbbb5(nn,cc) =
	PRE
		nn:Name & cc:Code  &
		nn /: dom(dddddddbbbbbbb5) 
	THEN
		dddddddbbbbbbb5 := dddddddbbbbbbb5 \/ { nn |-> cc}
	END;

update_dddddddbbbbbbb5(nn,cc) =
	PRE
		nn:Name & cc:Code  &
		nn : dom(dddddddbbbbbbb5)
	THEN
		dddddddbbbbbbb5(nn) := cc
	END;

reset_dddddddbbbbbbb5 = 
    PRE
       dddddddbbbbbbb5: Name --> Code
    THEN
        dddddddbbbbbbb5 := {}
    END;
/* ------------------------------- */
add_dddddddbbbbbbb6(nn,cc) =
	PRE
		nn:Name & cc:Code  &
		nn /: dom(dddddddbbbbbbb6) 
	THEN
		dddddddbbbbbbb6 := dddddddbbbbbbb6 \/ { nn |-> cc}
	END;

update_dddddddbbbbbbb6(nn,cc) =
	PRE
		nn:Name & cc:Code  &
		nn : dom(dddddddbbbbbbb6)
	THEN
		dddddddbbbbbbb6(nn) := cc
	END;

reset_dddddddbbbbbbb6 = 
    PRE
       dddddddbbbbbbb6: Name --> Code
    THEN
        dddddddbbbbbbb6 := {}
    END;
/* ------------------------------- */
add_dddddddbbbbbbb7(nn,cc) =
	PRE
		nn:Name & cc:Code  &
		nn /: dom(dddddddbbbbbbb7) 
	THEN
		dddddddbbbbbbb7 := dddddddbbbbbbb7 \/ { nn |-> cc}
	END;

update_dddddddbbbbbbb7(nn,cc) =
	PRE
		nn:Name & cc:Code  &
		nn : dom(dddddddbbbbbbb7)
	THEN
		dddddddbbbbbbb7(nn) := cc
	END;

reset_dddddddbbbbbbb7 = 
    PRE
       dddddddbbbbbbb7: Name --> Code
    THEN
        dddddddbbbbbbb7 := {}
    END;
/* ------------------------------- */
add_dddddddbbbbbbb8(nn,cc) =
	PRE
		nn:Name & cc:Code  &
		nn /: dom(dddddddbbbbbbb8) 
	THEN
		dddddddbbbbbbb8 := dddddddbbbbbbb8 \/ { nn |-> cc}
	END;

update_dddddddbbbbbbb8(nn,cc) =
	PRE
		nn:Name & cc:Code  &
		nn : dom(dddddddbbbbbbb8)
	THEN
		dddddddbbbbbbb8(nn) := cc
	END;

reset_dddddddbbbbbbb8 = 
    PRE
       dddddddbbbbbbb8: Name --> Code
    THEN
        dddddddbbbbbbb8 := {}
    END;
/* ------------------------------- */
add_dddddddbbbbbbb9(nn,cc) =
	PRE
		nn:Name & cc:Code  &
		nn /: dom(dddddddbbbbbbb9) 
	THEN
		dddddddbbbbbbb9 := dddddddbbbbbbb9 \/ { nn |-> cc}
	END;

update_dddddddbbbbbbb9(nn,cc) =
	PRE
		nn:Name & cc:Code  &
		nn : dom(dddddddbbbbbbb9)
	THEN
		dddddddbbbbbbb9(nn) := cc
	END;

reset_dddddddbbbbbbb9 = 
    PRE
       dddddddbbbbbbb9: Name --> Code
    THEN
        dddddddbbbbbbb9 := {}
    END;
    

/* ------------------------------- */
add_ddddddddbbbbbbbb0(nn,cc) =
	PRE
		nn:Name & cc:Code  &
		nn /: dom(ddddddddbbbbbbbb0) 
	THEN
		ddddddddbbbbbbbb0 := ddddddddbbbbbbbb0 \/ { nn |-> cc}
	END;

update_ddddddddbbbbbbbb0(nn,cc) =
	PRE
		nn:Name & cc:Code  &
		nn : dom(ddddddddbbbbbbbb0)
	THEN
		ddddddddbbbbbbbb0(nn) := cc
	END;

reset_ddddddddbbbbbbbb0 = 
    PRE
       ddddddddbbbbbbbb0: Name --> Code
    THEN
        ddddddddbbbbbbbb0 := {}
    END;
/* ------------------------------- */
add_ddddddddbbbbbbbb1(nn,cc) =
	PRE
		nn:Name & cc:Code  &
		nn /: dom(ddddddddbbbbbbbb1) 
	THEN
		ddddddddbbbbbbbb1 := ddddddddbbbbbbbb1 \/ { nn |-> cc}
	END;

update_ddddddddbbbbbbbb1(nn,cc) =
	PRE
		nn:Name & cc:Code  &
		nn : dom(ddddddddbbbbbbbb1)
	THEN
		ddddddddbbbbbbbb1(nn) := cc
	END;

reset_ddddddddbbbbbbbb1 = 
    PRE
       ddddddddbbbbbbbb1: Name --> Code
    THEN
        ddddddddbbbbbbbb1 := {}
    END;
/* ------------------------------- */
add_ddddddddbbbbbbbb2(nn,cc) =
	PRE
		nn:Name & cc:Code  &
		nn /: dom(ddddddddbbbbbbbb2) 
	THEN
		ddddddddbbbbbbbb2 := ddddddddbbbbbbbb2 \/ { nn |-> cc}
	END;

update_ddddddddbbbbbbbb2(nn,cc) =
	PRE
		nn:Name & cc:Code  &
		nn : dom(ddddddddbbbbbbbb2)
	THEN
		ddddddddbbbbbbbb2(nn) := cc
	END;

reset_ddddddddbbbbbbbb2 = 
    PRE
       ddddddddbbbbbbbb2: Name --> Code
    THEN
        ddddddddbbbbbbbb2 := {}
    END;
/* ------------------------------- */
add_ddddddddbbbbbbbb3(nn,cc) =
	PRE
		nn:Name & cc:Code  &
		nn /: dom(ddddddddbbbbbbbb3) 
	THEN
		ddddddddbbbbbbbb3 := ddddddddbbbbbbbb3 \/ { nn |-> cc}
	END;

update_ddddddddbbbbbbbb3(nn,cc) =
	PRE
		nn:Name & cc:Code  &
		nn : dom(ddddddddbbbbbbbb3)
	THEN
		ddddddddbbbbbbbb3(nn) := cc
	END;

reset_ddddddddbbbbbbbb3 = 
    PRE
       ddddddddbbbbbbbb3: Name --> Code
    THEN
        ddddddddbbbbbbbb3 := {}
    END;
/* ------------------------------- */
add_ddddddddbbbbbbbb4(nn,cc) =
	PRE
		nn:Name & cc:Code  &
		nn /: dom(ddddddddbbbbbbbb4) 
	THEN
		ddddddddbbbbbbbb4 := ddddddddbbbbbbbb4 \/ { nn |-> cc}
	END;

update_ddddddddbbbbbbbb4(nn,cc) =
	PRE
		nn:Name & cc:Code  &
		nn : dom(ddddddddbbbbbbbb4)
	THEN
		ddddddddbbbbbbbb4(nn) := cc
	END;

reset_ddddddddbbbbbbbb4 = 
    PRE
       ddddddddbbbbbbbb4: Name --> Code
    THEN
        ddddddddbbbbbbbb4 := {}
    END;
/* ------------------------------- */
add_ddddddddbbbbbbbb5(nn,cc) =
	PRE
		nn:Name & cc:Code  &
		nn /: dom(ddddddddbbbbbbbb5) 
	THEN
		ddddddddbbbbbbbb5 := ddddddddbbbbbbbb5 \/ { nn |-> cc}
	END;

update_ddddddddbbbbbbbb5(nn,cc) =
	PRE
		nn:Name & cc:Code  &
		nn : dom(ddddddddbbbbbbbb5)
	THEN
		ddddddddbbbbbbbb5(nn) := cc
	END;

reset_ddddddddbbbbbbbb5 = 
    PRE
       ddddddddbbbbbbbb5: Name --> Code
    THEN
        ddddddddbbbbbbbb5 := {}
    END;
/* ------------------------------- */
add_ddddddddbbbbbbbb6(nn,cc) =
	PRE
		nn:Name & cc:Code  &
		nn /: dom(ddddddddbbbbbbbb6) 
	THEN
		ddddddddbbbbbbbb6 := ddddddddbbbbbbbb6 \/ { nn |-> cc}
	END;

update_ddddddddbbbbbbbb6(nn,cc) =
	PRE
		nn:Name & cc:Code  &
		nn : dom(ddddddddbbbbbbbb6)
	THEN
		ddddddddbbbbbbbb6(nn) := cc
	END;

reset_ddddddddbbbbbbbb6 = 
    PRE
       ddddddddbbbbbbbb6: Name --> Code
    THEN
        ddddddddbbbbbbbb6 := {}
    END;
/* ------------------------------- */
add_ddddddddbbbbbbbb7(nn,cc) =
	PRE
		nn:Name & cc:Code  &
		nn /: dom(ddddddddbbbbbbbb7) 
	THEN
		ddddddddbbbbbbbb7 := ddddddddbbbbbbbb7 \/ { nn |-> cc}
	END;

update_ddddddddbbbbbbbb7(nn,cc) =
	PRE
		nn:Name & cc:Code  &
		nn : dom(ddddddddbbbbbbbb7)
	THEN
		ddddddddbbbbbbbb7(nn) := cc
	END;

reset_ddddddddbbbbbbbb7 = 
    PRE
       ddddddddbbbbbbbb7: Name --> Code
    THEN
        ddddddddbbbbbbbb7 := {}
    END;
/* ------------------------------- */
add_ddddddddbbbbbbbb8(nn,cc) =
	PRE
		nn:Name & cc:Code  &
		nn /: dom(ddddddddbbbbbbbb8) 
	THEN
		ddddddddbbbbbbbb8 := ddddddddbbbbbbbb8 \/ { nn |-> cc}
	END;

update_ddddddddbbbbbbbb8(nn,cc) =
	PRE
		nn:Name & cc:Code  &
		nn : dom(ddddddddbbbbbbbb8)
	THEN
		ddddddddbbbbbbbb8(nn) := cc
	END;

reset_ddddddddbbbbbbbb8 = 
    PRE
       ddddddddbbbbbbbb8: Name --> Code
    THEN
        ddddddddbbbbbbbb8 := {}
    END;
/* ------------------------------- */
add_ddddddddbbbbbbbb9(nn,cc) =
	PRE
		nn:Name & cc:Code  &
		nn /: dom(ddddddddbbbbbbbb9) 
	THEN
		ddddddddbbbbbbbb9 := ddddddddbbbbbbbb9 \/ { nn |-> cc}
	END;

update_ddddddddbbbbbbbb9(nn,cc) =
	PRE
		nn:Name & cc:Code  &
		nn : dom(ddddddddbbbbbbbb9)
	THEN
		ddddddddbbbbbbbb9(nn) := cc
	END;

reset_ddddddddbbbbbbbb9 = 
    PRE
       ddddddddbbbbbbbb9: Name --> Code
    THEN
        ddddddddbbbbbbbb9 := {}
    END
END


