MACHINE ForAll

SETS
   COLOURS = {red,green,blue}
   
VARIABLES
   col1,col2
   
INVARIANT
   col1 : POW(COLOURS) &
   col2 : POW(COLOURS)  &
   !(cc).(cc:col1 => cc/:col2) &
   !cc2.(cc2:col2 => cc2/:col1) 
   
INITIALISATION
   col1 := {red} ||
   col2 := {green}
   
OPERATIONS
   swap = BEGIN
     col1 := col2 ||
     col2 := col1
    END;
    
   add(x) = PRE x : COLOURS & x /: col1 THEN
     col1 := col1 \/ {x}
    END;
    
    AnyTwoCol1OneInCol2 = 
    PRE !(x,y).(x: COLOURS & y: COLOURS & x/=y & x: col1 & y: col1 => (x: col2 or y:col2)) THEN
      skip
    END;
     
    TotalCoverage =
      PRE !x.(x: COLOURS => (x: col1 or x:col2)) THEN
        skip
      END;
      
    TotalCoverage2 =
      PRE {xcs| xcs:COLOURS & not(xcs:col1 or xcs: col2)} = {} THEN
        skip
      END;
      
    
     NotTotalCoverage = 
      PRE not(!x2.(x2:COLOURS => (x2:col1 or x2:col2))) THEN
        skip
      END; 
     
   
    NonEmpty = 
      PRE #x3.(x3: COLOURS & (x3: col1 or x3:col2)) THEN
        skip
      END; 

    RemoveElement(x) =
     PRE x: COLOURS   & !xx.(xx: col1 => xx:col2) 
     THEN
       col1 := col1 - {x} ||
       col2 := col2 - {x}
     END 
END