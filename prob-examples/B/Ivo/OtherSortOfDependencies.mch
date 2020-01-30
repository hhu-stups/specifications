MACHINE SleepSetsStudyCase

VARIABLES x,y

CONSTANTS S

PROPERTIES
 S={0,1,2,3}
INVARIANT
 x : S & y : S
INITIALISATION 
 x,y := 0,0 
OPERATIONS
  Op_x = PRE x+y<3 & x < 2 THEN x:= (x+1) mod 3 END;
  Op_y = PRE x+y<3 & y < 2 THEN y:= (y+1) mod 3 END
END
