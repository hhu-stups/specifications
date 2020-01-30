MACHINE CycleDetections
VARIABLES xx,yy,zz
INVARIANT
 xx:INTEGER & yy:INTEGER & yy <10 & zz:INTEGER
INITIALISATION xx:=0 || yy:=0 || zz:= -1 
OPERATIONS
  Inc_xx = PRE xx = 0 THEN xx:= xx+1 END;
  Set_xx = PRE xx = 1 THEN xx:= 2 END;
  Dec_xx = PRE xx = 2 THEN xx:= xx-2 END;
  Inc_yy = PRE yy < 9 THEN yy := yy+1 END;
  Inc_zz = PRE xx = 2 & yy = 2 & zz = -1 THEN zz := zz+1 END 
END