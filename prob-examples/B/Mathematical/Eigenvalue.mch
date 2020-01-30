MACHINE Eigenvalue
DEFINITIONS
  vector == (1..dim --> INTEGER);
  matrix == (1..dim --> vector);
  mulmatvectrow(m,v,i) == (SIGMA(j).(j:1..dim|m(i)(j)*v(j)));
  mulmatvect(m,v) == (%i.(i:1..dim| mulmatvectrow(m,v,i)));
  mulvect(lambda,ve) == (ve ; %z.(z:INTEGER|z*lambda));
  zerovect == (%z.(z:1..dim|0));
  GOAL == (found=TRUE)
CONSTANTS dim
PROPERTIES
  dim:NATURAL1 & dim=2
VARIABLES m, found
INVARIANT
 m:matrix & found:BOOL
INITIALISATION m :: matrix || found := FALSE
OPERATIONS
  res <-- MulVect(vec,lambda) = PRE vec:vector & lambda:INTEGER THEN
    res := mulvect(lambda,vec)
  END;
  res <-- MulMatVect(vec) = PRE vec:vector THEN
    res := mulmatvect(m,vec)
  END;
  FindEigenvalue(eval,evect,res) = PRE eval:INTEGER & evect:vector & evect /= zerovect & res:vector &
        res = mulvect(eval,evect) & res = mulmatvect(m,evect) THEN
    found := TRUE
  END
END