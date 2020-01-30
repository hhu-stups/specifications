MACHINE           Paperround

VARIABLES         papers, magazines

INVARIANT         papers <: 1..163 & magazines <: papers & card(papers) <= 60

INITIALISATION    papers := {} || magazines := {}

OPERATIONS

addpaper(hh) =
  PRE hh : 1..163 & card(papers) < 60
  THEN papers := papers \/ {hh}
  END;

addmagazine(hh) =
  PRE hh : papers
  THEN magazines := magazines \/ {hh} 
  END;

remove(hh) =
  PRE hh : 1..163
  THEN papers := papers - {hh} || magazines := magazines - {hh}
  END

END
