MACHINE PartialOrder_Test
VARIABLES t1,y, t2,x
INVARIANT
  x:INTEGER & y:INTEGER &
  (t1=TRUE or t2=TRUE) => y=0
INITIALISATION t1,y := FALSE,0 || t2,x := FALSE,0
OPERATIONS
  t1 =  IF t1=FALSE THEN y := y+1 END;
  t2 =  BEGIN  t1,y := TRUE,0 END;

  t3 =  BEGIN x := x +1 END;
  t4 =  BEGIN t2 := TRUE END
END

