
MACHINE Tweek
ABSTRACT_VARIABLES
  a
/* PROMOTED OPERATIONS
  add,
  suppr */
INVARIANT
    a : 0 .. 5
INITIALISATION
         a := 3
OPERATIONS
  add = 
    SELECT
        a < 5
    THEN 
         a := a + 1
    END;
  
  suppr = 
    SELECT
        a > 0
    THEN 
         a := a - 1
    END;
    
    add_unsafe = skip
END