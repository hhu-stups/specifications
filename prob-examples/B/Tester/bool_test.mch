MACHINE pf_test

SETS
	Name 

VARIABLES nm

DEFINITIONS
    scope_Name == 1..2;

INVARIANT
		nm : POW(Name)

INITIALISATION  
	nm := {} 
OPERATIONS

	
/* set_nm(n) = PRE n: POW(Name) THEN nm := n END; */

 add(n) = PRE n: Name THEN nm := nm \/ {n} END;

 ee <-- nonempty = BEGIN ee := bool(nm /= {}) END;
 
 ee <-- empty = BEGIN ee := bool(nm = {}) END


  
END

