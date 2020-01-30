MACHINE symm_set

SETS PERSON /*{pers1, pers2, pers3}*/

PROPERTIES card(PERSON) = 2

VARIABLES member

INVARIANT member <: PERSON

INITIALISATION member := {}

OPERATIONS

add(pp) = 
	PRE pp : PERSON /*& pp /: member*/
	THEN member := member \/ {pp}
	END;

delete(pp) = 
	PRE pp : PERSON & pp : member
	THEN member := member - {pp}
	END
END

