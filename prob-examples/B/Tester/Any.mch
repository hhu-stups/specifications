MACHINE Any

SETS
   COLOURS = {red,green,blue}
   
VARIABLES
   col1,col2,b,col
   
INVARIANT
   col1 : POW(COLOURS) &
   col2 : POW(COLOURS)  &
   !cc.(cc:col1 => cc/:col2) &
   !cc2.(cc2:col2 => cc2/:col1) & 
   b: BOOL & col: COLOURS
   
INITIALISATION
   col1 :: POW(COLOURS)||
   col2 := {green} ||
   b := TRUE ||
   col :: COLOURS
   
OPERATIONS
    
   add = ANY x WHERE x: COLOURS & x /: col1 THEN
     col1 := col1 \/ {x}
    END;
    
    setb = ANY v WHERE v: BOOL & ((v=TRUE) => (col1=col2)) THEN
      b := v
     END;

   swap = BEGIN
     col1 := col2 ||
     col2 := col1
    END;

    RemoveElement(x) =
     PRE x: COLOURS 
     THEN
       col1 := col1 - {x} ||
       col2 := col2 - {x}
     END;

    cc <-- Col12 = BEGIN cc := {xx|xx:POW(COLOURS) & (xx=col1 or xx=col2)} END
END