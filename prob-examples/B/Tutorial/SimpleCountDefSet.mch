MACHINE SimpleCountDefSet
SETS ID /*= {id1,id2,id3,id4} 
DEFINITIONS  scope_ID == 10*/
PROPERTIES card(ID) = 5 
VARIABLES s
INVARIANT s <: ID & card(s)<10
INITIALISATION s := {}
OPERATIONS
  Add(x) = PRE x:ID & x/:s THEN s := s\/{x} END;
  Remove(x) = PRE x:s THEN s:= s - {x} END
END

