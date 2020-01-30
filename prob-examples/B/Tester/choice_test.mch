MACHINE choice_test

SETS

Code = {c1,c2,c3}

VARIABLES cc

INVARIANT

cc : Code


INITIALISATION 

cc := c1 


OPERATIONS


/* ONLY 1 CHOICE seems to be available here: */
       rcc <-- choicetest =    
        CHOICE
           rcc := c1
        OR
           rcc := c2
        OR
           rcc := c3
        END;
                
       rcc <-- choicetest2(c) =    
        PRE c: Code
        THEN
         CHOICE
           rcc := c1
         OR
           rcc := c
         END
        END;
        
       choicetest3(c) =    
        PRE c: Code
        THEN
         IF c=c1 THEN
           cc := c
         ELSE
           CHOICE
           cc := c1
          OR
            cc := c
          END
         END
        END 
END


