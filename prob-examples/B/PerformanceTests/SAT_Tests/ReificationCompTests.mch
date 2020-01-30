MACHINE ReificationCompTests
DEFINITIONS
   SET_PREF_MAXINT == 2147483647;
   SET_PREF_MININT == -2147483647;
   SET_PREF_CLPFD == TRUE
SETS
 ID={aa,bb,cc}
CONSTANTS f
PROPERTIES
 f:1..10 --> 0..9999 &
 !i.(i:1..9 =>  (f(i)<f(i+1) or f(i+1)=0)) &
 !i.(i:1..8 =>  (f(i)<=f(i+2)-100 or f(i+2)=0)) &
 !i.(i:1..3 \/ 6..6 =>  (f(i)<=f(i+2)-200 or f(i+2)<0)) &
 !i.(i:1..3  \/ 6..6 =>  (f(i)>=f(i+2)-200 or f(i+2)<0)) &
 (f(5)=0 or f(6)=0 or f(7)=0) &
 SIGMA(x).(x:1..10|f(x)) = 9999 & 
 SIGMA(x).(x:1..5|f(x)) = 1999 & 
 (f(10) < 5000 or f(1)>100) & 
 (f(9) < 2000 or f(1)>100) &  
 (f(9) > 1998 or f(1)>100) &   
 (f(9) < 1998 or f(8)<1202) &    
 (f(9) < 1998 or f(8)>1200) &    
 (f(8) < 1200 or f(10)>4998)
OPERATIONS
  xx <-- Get(yy) = PRE yy:1..10 THEN xx:= f(yy) END;
  sum <-- SUM = BEGIN sum := SIGMA(x).(x:1..10|f(x))  END
END

