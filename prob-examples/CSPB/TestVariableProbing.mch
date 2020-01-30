MACHINE TestVariableProbing
SETS
 PERSONS={peter,paul,mary}
CONSTANTS maxage
PROPERTIES maxage = 120
VARIABLES likes, age, nrpersons
INVARIANT
 likes : PERSONS <-> PERSONS &
 age : PERSONS +-> 0..maxage &
 nrpersons  = card(dom(age))
INITIALISATION likes,age,nrpersons := {},{},0
OPERATIONS
  AddPerson(p,a) = PRE p/: dom(age) & a:{0,10,20,30} THEN
    age(p) := a || nrpersons := nrpersons+1
  END;
  AddFriend(p,q) = PRE p|->q /: likes & p:dom(age) & q:dom(age) THEN
     likes := likes \/ {p|->q}
  END
END

