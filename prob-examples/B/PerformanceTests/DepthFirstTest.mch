MACHINE DepthFirstTest
/* A benchmark that will not work well with a pure Breadth-First search */
CONSTANTS limit
PROPERTIES limit = 2**20
DEFINITIONS
 LIM == 3000;
 HEURISTIC_FUNCTION == LIM - counter
VARIABLES counter
INVARIANT
 counter : NATURAL1 & counter < LIM
INITIALISATION counter := 50
OPERATIONS
  IncCounter = PRE counter < limit THEN counter := counter+2 END;
  r <-- DoNothing = BEGIN r := counter END;
  DecCounter = PRE counter>1 THEN 
    counter := counter - 1 END;
  IncCounter10 = PRE counter < limit THEN counter := counter+10 END;
  DecCounter2 = PRE counter>2 THEN 
    counter := counter - 2 END;
   IncCounter2 = PRE counter < limit THEN counter := counter+1 END
END

