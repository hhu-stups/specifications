MACHINE CycleDetections
VARIABLES xx,yy
INVARIANT
 xx:INTEGER & yy:NAT & yy <1
INITIALISATION xx:=0 || yy:=0 
OPERATIONS
  Inc_xx = PRE xx = 0 THEN xx:= xx+1 END;
  Set_xx = PRE xx = 1 THEN xx:= 2 END;
  Dec_xx = PRE xx = 2 THEN xx:= xx-2 END;
  Inc_yy = BEGIN yy := yy+1 END
END


