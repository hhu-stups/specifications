MACHINE
   telefonbuch2

SETS Namen = {name1, name2, name3, name4, name5}

CONSTANTS NUMMERN

PROPERTIES  NUMMERN <: NATURAL1 & NUMMERN = {100,101,102,230,240,516}

VARIABLES 
	telefonbuch

INVARIANT
	 telefonbuch : Namen >+> NUMMERN


INITIALISATION 	telefonbuch := {name1 |-> 100, name2 |-> 101, name4 |-> 240}
		/* telefonbuch :: Namen >+> NUMMERN */

OPERATIONS 
	neukunde(name) = 
		PRE name : Namen & name /: dom(telefonbuch) 
		THEN ANY num WHERE num : NUMMERN & num /: ran(telefonbuch) THEN
			telefonbuch := telefonbuch \/ {name |-> num}
			END
		END

END