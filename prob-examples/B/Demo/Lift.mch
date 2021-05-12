MACHINE Lift

ABSTRACT_VARIABLES  curfloor

INVARIANT  curfloor : 0..99 /* NAT */

ASSERTIONS curfloor>=0
INITIALISATION curfloor := 4

OPERATIONS

	inc = PRE curfloor<99 THEN curfloor := curfloor + 1 END ;

	dec = BEGIN curfloor := curfloor - 1 END;
	/*
	result  <-- ground = BEGIN result := bool(curfloor=0) END
	dec = PRE curfloor>0 THEN curfloor := curfloor - 1 END ;  */

	result  <-- ground =
	            IF curfloor=0 THEN
	             result := TRUE
	            ELSE
	             result := FALSE
	            END

END




