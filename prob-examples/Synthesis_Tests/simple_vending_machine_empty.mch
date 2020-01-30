
MACHINE simple_vending_machine
ABSTRACT_VARIABLES
  coins,
  soda
/* PROMOTED OPERATIONS
  empty */
INVARIANT
    coins : INTEGER
  & soda : INTEGER
  & coins >= 0
  & soda >= 0
INITIALISATION
    BEGIN
         coins := 0
      ||
         soda := 3
    END
OPERATIONS
  sdfsd = 
    BEGIN
         coins := coins + -2
      ||
         soda := soda + -3
    END;
  
  empty = 
    PRE 
        coins : 1 .. 20
    THEN
         coins := coins
      ||
         soda := soda
    END
END
