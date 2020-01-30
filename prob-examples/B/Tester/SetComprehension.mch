MACHINE SetComprehension

SETS
   COLOURS = {red,green,blue}
   
VARIABLES
   col1,col2
   
INVARIANT
   col1 : POW(COLOURS) &
   col2 : POW(COLOURS) &
   col1 /= col2 &
   col1 /= {}
   
INITIALISATION
   col1 := {red} ||
   col2 := {green}
   
OPERATIONS

   cc <-- NonElements =
    BEGIN
     cc := {xx | xx: COLOURS & xx /: col1 & xx /: col2}
    END;
    
   swap = BEGIN
     col1 := col2 ||
     col2 := col1
    END;
    
   
   add(x) = PRE x : COLOURS & x /: col1 THEN
     col1 := col1 \/ {x}
    END;
    
   
    
   cc <-- BothEl =
    BEGIN
     cc := {xx | xx: COLOURS & xx : col1 & xx : col2}
    END;
    
   cc <-- EitherEl =
    BEGIN
     cc := {xx | xx: COLOURS & (xx : col1 or xx : col2)}
    END;
    
   cc <-- Relation =
     BEGIN
       cc := {rr,tt| rr:COLOURS & tt:COLOURS & rr:col1 & tt:col2}
     END;
    
   cc <-- Relation2 =
     BEGIN
       cc := {rr,tt| rr:COLOURS & tt:COLOURS & (rr,tt): col1 * col2}
     END;
    
    Toggle =
     BEGIN
       col1 := {xx | xx: COLOURS & xx:col2} ||
       col2 := {xx | xx: COLOURS & xx:col1}
     END;
     
    RemoveElement(x) =
     PRE x: COLOURS
     THEN
       col1 := {xx | xx: COLOURS & xx: col1 & xx /= x} ||
       col2 := {xx | xx: COLOURS & xx: col2 & xx /= x}
     END;
     
     
    cc <-- Col1 =
     BEGIN
       cc := { xx | xx : POW(COLOURS) & xx <: col1 }
       /* this seems to pose problems to ZAP Z animator */
     END
END