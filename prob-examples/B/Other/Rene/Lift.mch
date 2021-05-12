MACHINE Lift
ABSTRACT_VARIABLES  floor
INVARIANT  floor : 0..99 /* NAT */
INITIALISATION floor := 4
OPERATIONS
	inc = PRE floor<99 THEN floor := floor + 1 END ;
	dec = PRE floor>0 THEN floor := floor - 1 END;
	result  <-- ground =
	            IF floor=0 THEN
	             result := TRUE
	            ELSE
	             result := FALSE
	            END
END





