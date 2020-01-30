MACHINE Swap

SETS
  Color = {red,green,blue}
  
VARIABLES
   cc1,cc2
 
 INVARIANT
   cc1: Color & cc2: Color
 
 INITIALISATION
  cc1 :: Color || cc2 := red
  
 OPERATIONS
 
 swap = BEGIN
   cc1  := cc2 || cc2 := cc1
   END
   
 END