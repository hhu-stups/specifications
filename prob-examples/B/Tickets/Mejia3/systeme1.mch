MACHINE
	systeme1

VARIABLES
	xx1
,	yy1

INVARIANT
	xx1 : 0..10
&	yy1 : 0..10

INITIALISATION
	xx1 := 0
||	yy1 := 1

OPERATIONS
	out1, out2 <-- operation1 =
	PRE
		out1 : 0..10
	&	out2 : 0..10 /* this pre condition poses a problem to ProB: for ProB out1,out2 are not yet defined in the PREcondition; AtelierB does not seem to complain ! */
	THEN
		ANY
			xx1p, yy1p
		WHERE
			xx1p : 0..10
		&	yy1p : 0..10
		THEN
			xx1, yy1, out1, out2 := xx1p, yy1p, xx1p, yy1p
		END
	END
END
