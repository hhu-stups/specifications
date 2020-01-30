MACHINE Sets_Simple

SETS
  AA = {aa,bb,cc}
  
VARIABLES
  xx
  
INVARIANT
  xx: POW(AA)
  
INITIALISATION
  xx := {}
  
OPERATIONS
  add = ANY yy WHERE yy:AA THEN xx := xx \/ {yy} END;
  add_arg(yy) = PRE yy: AA THEN xx := xx \/ {yy} END;
  
  sub(ss) = PRE ss: POW(AA) & ss <: xx THEN skip END
END
  