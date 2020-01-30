MACHINE TestPFBecomeSuch
DEFINITIONS 	tc   == (0..2040000)  /* 2040000 */
SETS
    td_i =
	{	c_dn
	, 	cu
	, 	cd
	}

CONCRETE_CONSTANTS tbi, td

PROPERTIES 
    tbi   = 1..3000 /* 3000 */
 &
    td =
	{	cu
	, 	cd
	}
VARIABLES PLB
INVARIANT PLB : ((tbi * (tc)) * td) * (1 .. 2) +-> (tbi * (tc)) * td
INITIALISATION
PLB :: ((tbi * (tc)) * td) * (1 .. 2) +-> (tbi * (tc)) * td
OPERATIONS
 r <-- App(x) = PRE x: ((tbi * (tc)) * td) * (1 .. 2) & x:dom(PLB) THEN r:= PLB(x) END
END
