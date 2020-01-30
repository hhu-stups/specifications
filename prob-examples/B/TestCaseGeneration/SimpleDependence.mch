MACHINE SimpleDependence
VARIABLES x,y
INVARIANT
 x:INTEGER & y:INTEGER
INITIALISATION x,y := 0,0
OPERATIONS
 f = y := y + 3;
 g = x := y - 4;
 h = SELECT x = 5 THEN skip END
END

