MACHINE phonebook3

SETS
	Name; Code 

DEFINITIONS
	scope_Name == 1..3 ;
	scope_Code == 4..6

VARIABLES db, nm, codes

INVARIANT
		db : Name +-> Code &
		nm : POW(Name)  /* nm <: Name */
		& codes : POW(Code) &
		ran(db) = codes

INITIALISATION  
/*
	db := {} || nm := {} || codes = {}
*/

	db, nm, codes := {}, {}, {}
	
OPERATIONS

/*
add(nn,cc) =
	PRE
		nn:Name & cc:Code  &
		nn /: dom(db) 
	THEN
		db := db \/ { nn |-> cc} || nm := nm \/ {nn} || codes := codes \/ {cc}
	END;

*/


add(nn,cc) =
  PRE
	nn:Name & cc:Code 
  THEN

	SELECT		
		nn:Name 
	THEN
		db := db \/ { nn |-> cc}
	WHEN
		cc:Code
	THEN
		nm := nm
	WHEN
		cc:Code	
	THEN
		db, nm, codes := db \/ { nn |-> cc}, nm \/ {nn}, codes \/ {cc}
	ELSE
		nm := {nn} 
	END
  END;


cc <-- lookup(nn) =
	PRE
		nn : dom(db)
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
   ANY nn WHERE nn : dom(db)
   THEN
      cc := nn
   END;

cc <-- choose_err(nn) =
   PRE
        nn : Name
   THEN
      SELECT nn:dom(db)
      THEN
         cc := nn
      END
   END;
   
cc <-- choose_not =
   ANY nn WHERE nn: Name & nn /: dom(db)
   THEN
      cc := nn
   END;
   
   
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


