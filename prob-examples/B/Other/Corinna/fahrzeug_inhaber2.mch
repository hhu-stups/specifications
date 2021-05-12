MACHINE
   fahrzeug_inhaber2

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
		THEN IF name : ran(fahrzeug_besitzer)
			THEN ans := ja
			ELSE ans := nein
			END
		END;

	
	/* Operation gibt an ob die Person "name" ein Auto der Marke "marke" besitzt */
	ans <-- marken_besitzer(name, marke) =
		PRE name : PERSON & marke : MARKE
		THEN IF /*name : dom(fahrzeug_besitzer~; kfz_marke |> {marke})*/
			(ran({name} <| (fahrzeug_besitzer~)) /\ dom(kfz_marke |> {marke})) /={} 
			/* marke : (fahrzeug_besitzer~;kfz_marke)[{name}]*/
			THEN ans := ja
			ELSE ans := nein
			END
		END;

	/* Operation gibt an von welchen Marken eine Famile Autos besitzt */
	ans <-- familien_marke(familie, marke) = 
		PRE familie : FAMILIE & marke : MARKE
		THEN IF marke : (person_familie~;fahrzeug_besitzer~;kfz_marke)[{familie}]
			THEN ans := ja
			ELSE ans := nein
			END
		END;

	/* Operation zum kaufen eines Fahrzeuges fuer eine Person*/
	ein_auto_kaufen(name, kfz) = 
		PRE name : PERSON & kfz : KFZ & (kfz|->name) /: fahrzeug_besitzer & kfz /: dom(fahrzeug_besitzer)
		THEN fahrzeug_besitzer := fahrzeug_besitzer \/ {kfz|-> name}
		END;

	/* Operation zum verkaufen, eineadfadfs */
	ein_auto_verkaufen(name, kfz) = 
		PRE name : PERSON & kfz : KFZ & (kfz |-> name) : fahrzeug_besitzer 
						/*(kfz|->name) : fahrzeug_besitzer in ProB*/
		THEN fahrzeug_besitzer := fahrzeug_besitzer - {kfz |-> name} 
		END; 

	/* Operation */
	autos_verkaufen(name) = 
		PRE name : PERSON & name : ran(fahrzeug_besitzer)
		THEN fahrzeug_besitzer := fahrzeug_besitzer |>> {name}
		END

END