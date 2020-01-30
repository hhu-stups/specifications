MACHINE Simple
VARIABLES x , y
INVARIANT
 x: 0..10 & y:0..10
INITIALISATION x,y := 2,3
OPERATIONS
  Either10 = SELECT x=10 or y=10 THEN skip END;
  All10 = SELECT x=10 & y=10 THEN skip END;
  BothEIther10or0 = SELECT (x=10 & y=10) or (x=0 & y=0) THEN skip END
END

