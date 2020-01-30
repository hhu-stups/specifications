MACHINE TestBecomesElementOf
DEFINITIONS 	tc   == (0..2040000)  /*  [0, 2040] m, precision: 10^-3 m */
SETS
    td_i =
	{	cd_n
	, 	cu
	, 	cd
	}

CONCRETE_CONSTANTS tbid, td

PROPERTIES 
    tbid   = 1..3000 
 &
    td =
	{	cu
	, 	cd
	}
VARIABLES pls
INVARIANT 
  pls <: tbid  * tc * td
INITIALISATION
     pls :: POW(tbid * tc * td)
OPERATIONS
 r <-- App(x,y) = PRE (x,y) : tbid*tc & (x,y):dom(pls) THEN
    r:= pls(x,y)  /* potentially not well defined: pls not guaranteed to be a function */
 END
END