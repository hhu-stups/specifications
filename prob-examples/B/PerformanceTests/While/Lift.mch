MACHINE Lift

VARIABLES  lfloor

INVARIANT  lfloor : 0..100

INITIALISATION lfloor := 0

OPERATIONS

	inc = PRE lfloor<100 THEN lfloor := lfloor + 1 END ;

	dec = PRE lfloor>0 THEN lfloor := lfloor - 1 END

END
