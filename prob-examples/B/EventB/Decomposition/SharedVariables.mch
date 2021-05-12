MACHINE SharedVariables
VARIABLES
 b, r, s
INVARIANT
  b:NATURAL &
  r: {0,1} &
  s: {0,1}
INITIALISATION
 b,r,s := 0,0,0
OPERATIONS
  Update_b_r(nb,nr) = PRE nb:NATURAL & nr:{0,1} THEN
     b,r := nb,nr
  END;
  Update_s(ns) = PRE ns:{0,1} THEN
     s := ns
  END
END
