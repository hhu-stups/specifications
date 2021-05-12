MACHINE ReificationCompTests
DEFINITIONS
   SET_PREF_MAXINT == 2147483647;
   SET_PREF_MININT == -2147483647;
   SET_PREF_CLPFD == TRUE
   // ; "LibraryIO.def"
SETS
 ID={aa,bb,cc}
CONSTANTS f
PROPERTIES // observe((f(1),f(2),f(3),f(4),f(5),f(6),f(7),f(8),f(9),f(10))) &
 f:1..10 --> 0..9999 &
 !i1.(i1:1..9 =>  (f(i1)<f(i1+1) or f(i1+1)=0)) &
 !i2.(i2:1..8 =>  (f(i2)<=f(i2+2)-100 or f(i2+2)=0)) &
 !i3.(i3:1..3  \/ 6..6 =>  (f(i3)<=f(i3+2)-200 or f(i3+2)<0)) &
 !i4.(i4:1..3  \/ 6..6 =>  (f(i4)>=f(i4+2)-200 or f(i4+2)<0)) &
 (f(5)=0 or f(6)=0 or f(7)=0) &
 SIGMA(x).(x:1..10|f(x)) = 9999 &
 SIGMA(x).(x:1..5|f(x)) = 1999 &
 (f(10) < 5000 or f(1)>100) &
 (f(9) < 2000 or f(1)>100) &
 (f(9) > 1998 or f(1)>100) &
 (f(9) < 1998 or f(8)<1202) &
 (f(9) < 1998 or f(8)>1200)  &
 (f(8) < 1200 or f(10)>4998)
OPERATIONS
  xx <-- Get(yy) = PRE yy:1..10 THEN xx:= f(yy) END;
  sum <-- SUM = BEGIN sum := SIGMA(x).(x:1..10|f(x))  END
END

/*
f(1) |-> f(2) |-> f(3) |-> f(4) |-> f(5) |-> f(6) |-> f(7) |-> f(8) |-> f(9) |-> f(10) =
 (161|->  358 |-> 361  |-> 558  |-> 561  |->  0   |->  0   |-> 200  |-> 204  |-> 7596)
*/
