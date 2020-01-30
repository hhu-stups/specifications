MACHINE Lambda

SETS
   COLOURS = {red,green,blue}
   
VARIABLES
   col1,col2,pf
   
INVARIANT
   col1 : POW(COLOURS) &
   col2 : POW(COLOURS) &
   pf : COLOURS +-> COLOURS
   
INITIALISATION
   col1 := {red} ||
   col2 := {green} ||
   pf := {}
   /*pf := {x1,x2|x1:COLOURS & x2: COLOURS}
   pf := {x1,x2|x1:COLOURS & x2: COLOURS & x2 = red}*/
   
OPERATIONS
   swap = BEGIN
     col1 := col2 ||
     col2 := col1
    END;
    
    Tester = BEGIN
     pf := {x1,x2|x1:COLOURS & x2: COLOURS}
    END;
    
    cc <-- TPF = BEGIN
      cc := {x1,x2|x1:COLOURS & x2: COLOURS & x2 = red}
      END;
    
    test = BEGIN 
   pf := %xx.(xx:COLOURS|red)
   END;
   
    cc <-- Applypf(xx) = PRE xx:COLOURS THEN  cc := pf(xx) END
    
    /*
   add(x) = PRE x : COLOURS & x /: col1 THEN
     col1 := col1 \/ {x}
    END;
    
    cc <-- LambdaPf = 
     BEGIN
      cc := %yy.(yy:COLOURS | pf(yy))
     END; 
    
    RemoveElement(x) =
     PRE x: COLOURS   & !xx.(xx: col1 => xx:col2) 
     THEN
       col1 := col1 - {x} ||
       col2 := col2 - {x}
     END
     */

/* a lambda with two variables does not seem to be allowed 
    cc <-- LambdaPf2 =  BEGIN
      cc := %z1,z2.(z1:COLOURS & z2:COLOURS | pf(z1)) END;
*/
    
     
END