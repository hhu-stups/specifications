MACHINE DetTest
/* check behaviour of new deterministic / Andorra ProB kernel */

SETS
  Els = {aa,bb,cc,dd,ee,ff,gg}
  
VARIABLES
  ss
INVARIANT
  ss <: Els
INITIALISATION
  ss := {aa,bb,cc}
OPERATIONS
  not_applicable_op(tt,uu) =
     PRE tt:ss & uu:ss & tt /= uu & tt = aa & uu = aa THEN
                                        skip END
END