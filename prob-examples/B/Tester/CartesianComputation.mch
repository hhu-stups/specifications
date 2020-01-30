MACHINE CartesianComputation
SETS
 ID={aa,bb,cc}
CONSTANTS a,b
PROPERTIES
 a<:ID & b<:ID & a /= b & a /= {} & b/={}
VARIABLES xx
INVARIANT
 xx:POW(ID*ID)
INITIALISATION xx:=a*b
OPERATIONS
  Seta(yy) = PRE yy:POW(ID) THEN xx:= a*yy END;
  Setb(yy) = PRE yy:POW(ID) THEN xx:= b*yy END;
  Get(x,y) = PRE (x,y) : xx THEN skip END
END

