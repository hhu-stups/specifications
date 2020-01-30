MACHINE SubsetChecksSimple

VARIABLES xx
INVARIANT
 xx <: NATURAL
INITIALISATION xx:={}
OPERATIONS
  Set(yy) = PRE yy:NATURAL THEN xx:= xx \/ {yy} END;
  r <-- Check123 = 
     IF xx <: {1,2,3} THEN
       r := TRUE ELSE r:= FALSE
     END;
  r <-- Check(a,b,c) = PRE {a,b,c} <: 0..9 & a<b & b<c THEN 
  /* Times out for MAXINT == 1200 ! ; to do: propagate interval info for subset checks ?*/
     IF xx <: {a,b,c} THEN
       r := TRUE ELSE r:= FALSE
     END
  END
END

