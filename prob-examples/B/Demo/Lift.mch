MACHINE Lift

ABSTRACT_VARIABLES  floor

INVARIANT  floor : 0..99 /* NAT */

ASSERTIONS floor>=0
INITIALISATION floor := 4

OPERATIONS

	inc = PRE floor<99 THEN floor := floor + 1 END ;
	
	dec = BEGIN floor := floor - 1 END;
	/* 
	result  <-- ground = BEGIN result := bool(floor=0) END
	dec = PRE floor>0 THEN floor := floor - 1 END ;  */
	
	result  <-- ground = 
	            IF floor=0 THEN
	             result := TRUE
	            ELSE
	             result := FALSE
	            END
	
END




