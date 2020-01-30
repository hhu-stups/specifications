MACHINE TestDifficultSetDifference
SETS
 ID={aa,bb,cc,dd,ee,ff,gg,hh,ii,jj}
VARIABLES xx
INVARIANT
 xx <: ID
INITIALISATION xx:={aa,cc,ee,gg,ii}
OPERATIONS
  r <-- Getxx = BEGIN r:= xx END;
  Unsat(r2) = PRE r2 - xx = xx THEN skip END;
  Add(yy,r2) = PRE r2 - {yy} = xx THEN xx := r2 END
END

