MACHINE SELECT_CASE

SETS
   COLOURS = {red,green,blue,black}
   
VARIABLES
   col1
   
INVARIANT
   col1 : POW(COLOURS)
   
INITIALISATION
   col1 := {}
   
OPERATIONS
     add(col) = PRE col:COLOURS & col /: col1 THEN
        col1 := col1 \/ {col}
     END;
     del(col) = PRE col:COLOURS & col : col1 THEN
        col1 := col1 - {col}
     END;
     invert(xx) = PRE xx:COLOURS THEN
        CASE xx OF
          EITHER red THEN  col1 := col1 \/ {green}
          OR green,blue THEN col1 := col1 \/ {black}
          ELSE col1 := col1 \/ {blue}
          END
        END
      END;
      
     cc <-- col(xx) = PRE xx:COLOURS THEN
        CASE xx OF
          EITHER red THEN  cc := red
          OR green,blue THEN cc := green
          ELSE cc := black
          END
        END
      END;
      
     cc <-- Cardinality = SELECT col1={} THEN cc := 0
                WHEN card(col1)=1 THEN cc := 1
                WHEN card(col1)=2 THEN cc := 2
                WHEN card(col1)=3 THEN cc := 3
                ELSE cc := 4
              END
END