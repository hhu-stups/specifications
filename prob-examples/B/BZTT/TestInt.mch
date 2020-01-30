MACHINE TestInt
/* Some tests to see whether BZ-TT is capable of solving integer constraints */
/* Thus far it seems to work very well indeed */
VARIABLES x,y,V
INVARIANT x:0..1024 & y:0..1024 & V:POW(0..1024)
INITIALISATION x,y,V := 0,0,{}
OPERATIONS
 Solve1(x1,y1) = PRE x1:0..1024 & y1:0..1024 & x1*100 = y1 & y1-x1=990 THEN
   x,y := x1,y1
 END;
 Solve2(x1) =PRE x1:0..1024 & x1*x1=100 THEN x:=x1 END;
 Solve3(x1,S) = PRE x1:0..1024 & S:POW(0..1024) & card(S)=1 & x1:S THEN
    x,V := x1,S
 END;
 Solve4(S) = PRE S:POW(0..1024) & card(S)=2 & x:S & x/:S THEN
    V := S
 END;
 Solve5(x1,y1) = PRE x1:0..10000 & y1:0..10000 & 
        (x1:0..5000 or y1:9000..9090) &
        (x1:5001..10000 or y1:9010..9100) &
        (x1=2222 or y1:1..8900) &
        (x1>2222 or y1=9080)
 THEN x,y := x1,y1 END;
 Solve6(x1,y1,z1) = PRE x1:0..100000 & y1:9900..9999 & z1:0..100000 &
        y1+x1 = z1 & x1+x1+x1 = y1 THEN
  x,y := x1,y1
 END /* the following sends BZ-TT type checker into a loop: */
 ;
 Solve7(f) = PRE f:0..20 --> 0..1 & !x.(x:0..19 => f(x) /= f(x+1)) THEN
   x := f(2)
 END /* */
END
