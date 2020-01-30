MACHINE BreadthFirstTest
/* A benchmark that will not work well with a pure Depth-First search */
CONSTANTS limit
PROPERTIES limit = 2**32
VARIABLES counter
INVARIANT
 counter : NATURAL1
INITIALISATION counter := 50
OPERATIONS
  IncCounter = PRE counter < limit THEN counter := counter+1 END;
  r <-- DoNothing = BEGIN r := counter END;
  SillyDecCounter = PRE counter>0 THEN /* error in precondition; will lead to invariant violation */
    counter := counter - 1 END;
   IncCounter2 = PRE counter < limit THEN counter := counter+2 END
END

