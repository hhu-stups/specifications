MACHINE SetAssignment

SETS
   COLOURS = {red,green}
   
VARIABLES
   col1
   
INVARIANT
   col1 : COLOURS --> COLOURS & (ran(col1) = dom(col1))
   
INITIALISATION
   col1 :: COLOURS --> COLOURS
   
OPERATIONS
     xx <-- Test(cc) =
      SELECT (cc: COLOURS --> COLOURS   & ran(cc) = dom(cc))
      THEN
        xx := (dom(cc) |-> ran(cc))
      END
      /*

     cc <-- Test =
      BEGIN
        cc : (cc: COLOURS --> COLOURS   & ran(cc) /= {})
      END
      
      ;
     ;
      
    cc <-- Map(xx) =
     PRE xx: COLOURS & xx: dom(col1)
     THEN
       cc := col1(xx)
     END ;
     
    ResetToPermutation =
    BEGIN
      col1 : (col1: COLOURS --> COLOURS & ran(col1) = dom(col1))
    END */
END