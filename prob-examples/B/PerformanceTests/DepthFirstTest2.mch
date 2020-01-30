MACHINE DepthFirstTest2
/* A benchmark that will not work well with a pure Breadth-First search and also a pure Depth-First search*/
CONSTANTS limit
PROPERTIES limit = 2**20
DEFINITIONS
 LIM == 3000;
 HEURISTIC_FUNCTION == LIM - counter
VARIABLES counter
INVARIANT
 counter : INTEGER & counter < LIM
INITIALISATION counter := 50
OPERATIONS

  r <-- DoNothing = BEGIN r := counter END;
  DecCounter = PRE counter>-30000 THEN 
    counter := counter - 1 END;
  IncCounter2 = PRE counter < limit THEN counter := counter+2 END;
  IncCounter10 = PRE counter < limit THEN counter := counter+10 END;
  IncCounter1 = PRE counter < limit THEN counter := counter+1 END;
  DecCounter2 = PRE counter>-30000 THEN 
    counter := counter - 2 END
END

