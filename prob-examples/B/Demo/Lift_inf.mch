MACHINE Lift_inf

ABSTRACT_VARIABLES  floor

INVARIANT  floor : 0..99 

INITIALISATION floor := 4

OPERATIONS

	inc = PRE floor<99 THEN floor := floor + 1 END ;
	
	dec = PRE floor /= 1 THEN floor := floor - 1 END 
	
END

