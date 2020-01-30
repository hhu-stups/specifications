MODEL
   SubstSetIn
VARIABLES x,y
INVARIANT x:NAT & y:NAT
INITIALISATION
 x:: 1..3 || y:: 1..3
OPERATIONS
 test = BEGIN x,y :: {1}*{2} END;
 test2 = BEGIN x,y :: {1|->2} END
END