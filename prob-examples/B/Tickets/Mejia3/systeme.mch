MACHINE
	systeme

VARIABLES
	xx
,	yy

INVARIANT
	xx : 0..10
&	yy : 0..10
&	xx < yy

INITIALISATION
	xx := 0
||	yy := 1

OPERATIONS
	evenement =
	ANY
		xxp, xxs, yyp, yys
	WHERE
		xxp : 0..10
	&	xxs : 0..10
	&	yyp : 0..10
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
