MACHINE ANNA
VARIABLES x,y,delta
INVARIANT
 x:0..9 & y:0..9 & x>=y & delta:0..9 & x = y+delta &
  (x*1000+y*100+y*10+x*1)-(y*1000+x*100+x*10+y*1) = 891*delta
INITIALISATION x,y,delta := 0,0,0
OPERATIONS
  IncX = PRE x<9 THEN
    x:= x+1 || delta := delta+1
  END;
  IncXY = PRE x<9 THEN
    x:= x+1 || y := y+1
  END
END

