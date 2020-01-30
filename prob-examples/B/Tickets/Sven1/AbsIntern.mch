MODEL
   AbsIntern
SETS
   PLANES = {P1,P2}
VARIABLES
   planes
INVARIANT
   planes <: PLANES 
INITIALISATION
   planes := {P1,P2}
OPERATIONS
  runway_to_taxiway(plane) = 
   PRE
      plane : PLANES & 
      POW(planes) <: POW(planes \/ {plane})
   THEN
      skip
   END
 ;
  runway_to_taxiway2(plane) = 
   PRE
      plane = P1 &
      plane : PLANES & 
      POW(planes) <: POW(planes \/ {plane})
   THEN
      skip
   END
END