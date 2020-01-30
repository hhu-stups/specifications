MACHINE
	systeme2

VARIABLES
	xx
,	yy

INVARIANT
	xx : 0..10
&	yy : 0..10

INITIALISATION
	xx := 0
||	yy := 1

OPERATIONS
	operation2 (xxp, yyp) =
	PRE
		xxp : 0..10
	&	yyp : 0..10		
	THEN
		ANY
			xxs, yys	
		WHERE
			xxs : 0..10
		&	yys : 0..10
		&	(	xxp < yyp
			=>
				xxs = xxp
			&	yys = yyp
			)
		&	(	not (xxp < yyp)
			=>
				xxs = xx
			&	yys = yy
			)
		THEN
			xx := xxs
		||	yy := yys
		END
	END
END
