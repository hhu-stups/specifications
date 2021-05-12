MACHINE Lift_inf

ABSTRACT_VARIABLES  curfloor

INVARIANT  curfloor : 0..99

INITIALISATION curfloor := 4

OPERATIONS

	inc = PRE curfloor<99 THEN curfloor := curfloor + 1 END ;

	dec = PRE curfloor /= 1 THEN curfloor := curfloor - 1 END

END

