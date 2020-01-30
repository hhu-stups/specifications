MACHINE UnionGeneralizedTest
DEFINITIONS
  MYRANGE == 1..4
CONSTANTS f
PROPERTIES
 f:MYRANGE --> MYRANGE &
 UNION(i).(i:MYRANGE|{f(i)}) = MYRANGE
OPERATIONS
  rr <-- Get(yy) = PRE yy:MYRANGE THEN rr:= f(yy) END;
  r1 <-- Un1 = r1 :=  %x.(x:MYRANGE|{f(x)});
  r1 <-- Un1b = r1 :=  %(x,y).(x:MYRANGE & y:MYRANGE & x+y:MYRANGE|{f(x+y)});
  r1 <-- Un1c = r1 :=  %(x,y,z).(x:MYRANGE & y:MYRANGE & z:MYRANGE & x+y+z:MYRANGE|{f(x+y+z)});
  r2 <-- Un2 = r2 :=  %x.(x:MYRANGE|{f(x)}) [{i|i:MYRANGE}];
  r3 <-- Un3 = r3 :=  union(%x.(x:MYRANGE|{f(x)}) [{i|i:MYRANGE}])
END

