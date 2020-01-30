MACHINE IncrementalStatePackingTestWithCst
DEFINITIONS SET_PREF_MAX_OPERATIONS == 10
SETS
 ID={aa,bb,cc}
CONSTANTS myset
PROPERTIES myset = (1..1000 \/ 2000..3000) \ {2001}
VARIABLES xx,yy,zz,ii
INVARIANT
 xx:ID & yy:ID & zz <: NATURAL & ii : 1..100
INITIALISATION xx:=aa || yy := bb || zz := (1..1000 \/ 2000..3000) \ {2001} || ii := 1
OPERATIONS
  SetX(vv) = PRE vv:ID THEN xx:= vv END;
  SetY(vv) = PRE vv:ID THEN yy:= vv END;
  IncrI = PRE ii<100 THEN ii:=ii+1 END
ASSERTIONS
 zz=myset
END

