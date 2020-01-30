MACHINE MarkovSimple
/*
>>>> x = vmul(M(1),[x,y]) & y = vmul(M(2),[x,y]) & x+y=350 & x>0 & y>0
  TRUE
  

( x=200 &
       y=150 )

>>>> MM = [ [ 500, 400], [500, 600] ] &  x = vmul(MM(1),[x,y]) & y = vmul(MM(2),[x,y]) & x+y:1001..1010 & x>0 & y>0
  TRUE
  

( MM={(1|->{(1|->500),(2|->400)}),(2|->{(1|->500),(2|->600)})} &
       x=448 &
       y=560 )

*/
CONSTANTS M, TM, M2, TM2
PROPERTIES
  M = [ [ 700, 400 ], [300, 600 ] ] &
 TM = [ [ 700, 300 ], [400, 600 ] ] &
  M2 = [[610,520],[390,480]] &
  TM2 = [[610,390],[520,480]]
DEFINITIONS
 /* multiply two vectors : */
  vmul(v1,v2) == SIGMA(i).(i:dom(v1)|v1(i)*v2(i)) / 1000;
  transpose(M) == %i.(i:dom(M(1))| %j.(j:dom(M)|M(j)(i)));
 /* multiply two matrices */
  mmul(m1,m2) == mtmul(m1,transpose(m2));
  mtmul(m1,tm2) == [ [vmul(m1(1),tm2(1)), vmul(m1(1),tm2(2))], 
                    [vmul(m1(2),tm2(1)), vmul(m1(2),tm2(2))] ]
ASSERTIONS
 transpose(M) = TM;
 transpose(M2) = TM2;
  mmul(M,M) = M2
VARIABLES x1, x2
INVARIANT
 x1:NATURAL & x2:NATURAL
INITIALISATION x1,x2 := 500,600
OPERATIONS
  Iterate(n1,n2) = SELECT n1= vmul(M(1),[x1,x2])  & n2= vmul(M(2),[x1,x2]) THEN
   x1,x2 := n1,n2
  END
END

