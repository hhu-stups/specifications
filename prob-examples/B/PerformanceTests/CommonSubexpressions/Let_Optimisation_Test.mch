MACHINE Let_Optimisation_Test
VARIABLES xx
INVARIANT
 xx:INTEGER &
 #y.(y=xx*xx & xx>0 & y<50) &
 #y.(y=xx*xx*xx & xx>1 & y<100 & y>0)
INITIALISATION xx:=2
OPERATIONS
  Double = BEGIN xx := xx*2 END
END

