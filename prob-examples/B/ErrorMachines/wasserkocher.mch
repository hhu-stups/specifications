MACHINE wasserkocher

SETS ZUSTAND = {an, aus}; POSITION = {offen, geschlossen}

CONSTANTS maximum

PROPERTIES maximum : NATURAL1

VARIABLES schalter, deckel, fuellhoehe

INVARIANT schalter : ZUSTAND & deckel : POSITION & fuellhoehe : NATURAL &
schalter = an => (deckel = geschlossen & fuellhoehe > 0 & fuellhoehe <= maximum
) 
  /* PROBLEM IN INVARIANT: there is no typing for the variables as the
    invariant is one big implication */
INITIALISATION schalter, deckel, fuellhoehe := aus, geschlossen, 0

OPERATIONS
	deckel_auf = 
		PRE deckel=geschlossen & schalter=aus 
		THEN deckel:=offen
		END;

	deckel_zu = 
		PRE deckel=offen
		THEN deckel:=geschlossen
		END; 

	schalter_an =
		PRE schalter=aus & fuellhoehe > 0 & fuellhoehe < maximum & deckel=geschlossen
		THEN schalter:=an
		END;

	schalter_aus = 
		PRE schalter=an
		THEN schalter:=aus
		END;

	fuellen(xx)=
		PRE xx:NATURAL1 & schalter=aus & fuellhoehe<maximum & deckel=offen
		THEN fuellhoehe := fuellhoehe+xx
		END;

	ausgiessen(yy) =
		PRE yy:NATURAL1 & schalter=aus & deckel=offen
		THEN fuellhoehe := max({fuellhoehe-yy,0})
		END

END