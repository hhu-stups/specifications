MACHINE pf_test

SETS
	Name 

VARIABLES nm, f

DEFINITIONS
    scope_Name == 1..2;

INVARIANT
		nm : POW(Name) & f : Name +-> Name

INITIALISATION  
	nm := {} || f := {}
	
OPERATIONS

	
set_nm(n) = PRE n: POW(Name) THEN nm := n END;


set_nm2(n) = PRE n: POW(Name) & n=nm THEN nm := n END;
   
reflexive(nn) = PRE nn = nn~ & nn: Name --> Name THEN
   skip    END;
 
 add(n) = PRE n: Name THEN f := f \/ {n |-> n} END;
 
 total = PRE f : Name --> Name THEN skip END
  
END

