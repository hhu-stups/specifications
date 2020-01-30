MACHINE Lift
CONCRETE_VARIABLES  floor
INVARIANT  floor : 0..99 /* NAT */
INITIALISATION floor := 4
OPERATIONS 
	inc = PRE floor<99 THEN floor := floor + 1 END ;	
	dec = BEGIN floor := floor - 1 END 
END
