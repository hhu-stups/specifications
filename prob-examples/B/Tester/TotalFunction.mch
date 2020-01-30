MACHINE TotalFun

SETS
  FACE = {ftop,fbot,fleft}
  
VARIABLES
  cube
  
INVARIANT
  cube: FACE
  
INITIALISATION
 cube := ftop

OPERATIONS  
  cc <-- Rot = 
    BEGIN
     ANY rot WHERE  
                  rot = {fbot |-> fbot} /* { fbot |-> ftop, ftop |-> fbot} */
                  &
                  rot: FACE +-> FACE
             THEN
         cc := rot
      END
   END
 END