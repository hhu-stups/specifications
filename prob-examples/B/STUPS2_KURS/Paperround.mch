MACHINE Paperround

SETS HOUSE

VARIABLES
  papers, magazines

INVARIANT
  papers <: HOUSE & magazines <: papers 

INITIALISATION
  papers := {} || magazines := {}

OPERATIONS

addpaper(pp) =
  PRE pp : HOUSE & pp /:papers 
  THEN papers := papers \/ {pp}
  END;

addmagazine(hh) =
  PRE hh : papers
  THEN magazines := magazines \/ {hh}
  END;

remove(hh) =
  PRE hh : HOUSE
  THEN papers := papers - {hh} || magazines := magazines - {hh}
  END

END