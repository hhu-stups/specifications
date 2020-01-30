
MACHINE TestBecomeSuch
ABSTRACT_VARIABLES
  x
/* PROMOTED OPERATIONS
  dec */
INVARIANT
    /* @TestBecomeSuch:inv  */ x : NATURAL
INITIALISATION
    BEGIN
         x : (x > 0 & (x < 100 & x mod 20 = 0))
    END
OPERATIONS
  dec = 
    BEGIN 
         x : (x < x$0 & (x > 0 & x > x$0 - 4))
    END
END
