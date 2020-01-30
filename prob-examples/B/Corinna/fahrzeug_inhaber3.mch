MACHINE
   fahrzeug_inhaber3

SETS PERSON; FAMILIE = {Meier, Mueller, Schulze}; KFZ; MARKE = {VW, BMW, Audi};
	ANS = {ja, nein}

VARIABLES person_familie, kfz_marke, fahrzeug_besitzer

INVARIANT person_familie : PERSON --> FAMILIE &
	  kfz_marke : KFZ --> MARKE & 
	  fahrzeug_besitzer : KFZ +-> PERSON

INITIALISATION ANY xx WHERE xx : PERSON --> FAMILIE THEN person_familie := xx END || 
		 kfz_marke :: KFZ --> MARKE || fahrzeug_besitzer := {}


OPERATIONS 
	/* Operation gibt an ob die Person "name" ein Auto besitzt */
	ans <-- auto_besitzer(name) =
		PRE name : PERSON
		THEN skip
		END;

	
	/* Operation gibt an ob die Person "name" ein Auto der Marke "marke" besitzt */
	ans <-- marken_besitzer(name, marke) =
		PRE name : PERSON & marke : MARKE
		THEN skip
		END;

	/* Operation gibt an von welchen Marken eine Famile Autos besitzt */
	ans <-- familien_marke(familie, marke) = 
		PRE familie : FAMILIE & marke : MARKE
		THEN skip
		END;

	/* Operation zum kaufen eines Fahrzeuges fuer eine Person*/
	ein_auto_kaufen(name, kfz) = 
		PRE name : PERSON & kfz : KFZ 
		THEN skip
		END;

	/* Operation zum verkaufen, ein uzttttujjjjjjjfmnnnnnnnnnnnn
hdsffffffffffffffffffffffffffffffffffffffffffffffffffreuuuuuuuuuuuuuuuuuuuu
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
ddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
ddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddssssssssssssssssssssssssssss
sssssssssssssssssssssssssssssssssssssssssssssssssssxxxxxxxxxxxxxxxxxxxxxxxx
xxxxxxxxxxxxxwwwwwwwwwwww  
*/
	ein_auto_verkaufen(name, kfz) = 
		PRE name : PERSON & kfz : KFZ
		THEN skip
		END;

	/* Operation   */
	autos_verkaufen(name) = 
		PRE name : PERSON 
		THEN skip
		END

END