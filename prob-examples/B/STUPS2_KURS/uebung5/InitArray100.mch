MODEL InitArray100

/*
SETS ELEM 
*/
DEFINITIONS
 SET_PREF_MAXINT==10

SEES ArrayElem

CONSTANTS len

PROPERTIES len : NAT & len = 5

VARIABLES initarray

INVARIANT initarray : 1..len --> ELEMENTS 

INITIALISATION initarray :: 1..len --> ELEMENTS

OPERATIONS
	set(pos, el) = 
		PRE pos : 1..len & el : ELEMENTS
		THEN initarray := initarray <+ {pos |-> el}
		END; 

	arr <-- get = 
		arr := initarray;
        sz <-- getsize = sz := size(initarray)

END
