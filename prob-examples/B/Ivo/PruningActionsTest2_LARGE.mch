MACHINE PruningActionsTest2
SETS
 ID={aa,bb}
VARIABLES xx,yy,zz
INVARIANT
 xx:INTEGER & yy:NATURAL & yy <10000 & zz:INTEGER
INITIALISATION xx:=0 || yy:=0 || zz:= -1
OPERATIONS
  Inc_xx = PRE yy>0 & xx <2000 THEN xx:= xx+1 END;
  Inc_yy = PRE yy < 3000 THEN yy:= yy+1 END;
  Inc_zz = PRE zz <4000 THEN zz := zz+1 END
END
