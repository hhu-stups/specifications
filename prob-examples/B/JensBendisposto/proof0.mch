MACHINE proof
DEFINITIONS
 HYPOTHESES ==  (x:INTEGER);
 IMPLICIT == (x>=minint) & (x<=maxint);
 PROOFGOAL == (x*x<101);
 GOAL2 == (IMPLICIT & HYPOTHESES & not(PROOFGOAL));
 GOAL == #x.(x:INTEGER & (x>=minint) & (x<=maxint) & not(x*x<101))
VARIABLES
 minint,maxint
INVARIANT
 minint:INTEGER &
 maxint:INTEGER
INITIALISATION
 minint,maxint:=-1,3
 OPERATIONS
  /* disprove(x)=PRE GOAL THEN skip END; */
  extend = BEGIN minint,maxint:=minint-1,maxint+1 END
END
