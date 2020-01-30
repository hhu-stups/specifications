MACHINE Untitled
SETS
 ID
VARIABLES r1,r2
INVARIANT
 r1:ID-->ID & r2:ID-->ID
INITIALISATION r1 := id(ID) || r2 := id(ID)
OPERATIONS
 set = BEGIN r2 := {x,y | x:ID & y:ID & x /= y} END;
 violate(x) = PRE x:ID & r2(x) /=x THEN r2 := {} END
END

