MACHINE PetsSimple

SETS  PETTYPE = {snake, dog, cat}; PEOPLE = {bob, helen, george, anne}

VARIABLES owners, owns

INVARIANT  owners <: PEOPLE & owns: owners --> POW(PETTYPE) 

INITIALISATION owns := {bob |-> {cat, snake}} || owners := {bob}

/* 
DEFINITIONS invariant == ()

INITIALISATION owns,owners:(invariant & owners = {bob}) */

OPERATIONS

buyPet(oo, pp) = PRE oo: owners & pp: PETTYPE & pp /: owns(oo) 
THEN owns(oo) := owns(oo) \/ {pp} END;

pp <-- getPets(oo) = PRE oo: owners & owns(oo) /= {}
THEN pp := owns(oo) END;

addOwner(oo) = PRE oo : PEOPLE & oo /: owners
THEN owners := owners \/ {oo} || owns := owns \/ {oo |-> {}}END;

removeOwner(oo) = PRE oo : owners
THEN owners := owners - {oo} || owns:= owns - {oo |-> owns(oo)} END;

petDie(oo, pp) = PRE oo : owners & pp : PETTYPE & pp : owns(oo)
THEN owns(oo):= owns(oo) - {pp} END

END

