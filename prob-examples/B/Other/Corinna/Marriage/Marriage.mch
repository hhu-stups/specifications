MACHINE Marriage

EXTENDS Life

VARIABLES marriage

INVARIANT marriage : male >+> female

INITIALISATION marriage := {}

OPERATIONS
	wed(mm, ff) =
		PRE mm : male & mm /: dom(marriage)
		 & ff : female & ff /: ran(marrage)
		THEN marriage :=  marriage \/ {mm |-> ff}
		END ;

	part(mm, ff) =
		PRE mm : male & ff : female & mm |-> ff : marriage
		THEN marriage := marriage - {mm |-> ff}
		END ;

	pp <-- partner(nn) =
		PRE nn : PERSON & nn : dom(marriage) \/ ran(marriage)
		THEN
			IF nn : dom(marriage)
			THEN pp := marriage(nn)
			ELSE pp := marriage~(nn)
			END
		END
END

