MODEL
   AbsInternCst
SETS
   PLANES = {P1,P2}
CONSTANTS
   planes, plane
PROPERTIES
   planes <: PLANES &
   planes = {P1,P2} &
   plane : PLANES & 
   {{}} <: POW(planes \/ {plane})
END