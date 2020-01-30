MACHINE InfCardChecks
SETS
 ID={aa,bb}
CONSTANTS s1, v, s, si, empty, infs
PROPERTIES
 s1 = %x.(x:seq1(0..1) & x:seq1(2..3)|x) &
 v = card(s1) & v=0 &
 
 s = %x.(x:seq(0..1) & x:seq(2..3)|x) &
 card(s) = 1 &

 si = %x.(x:seq(0..1) & x:iseq(0..1)|x) &
 card(si) = 5 &

 empty = %(x,y).(x:INTEGER & y:NATURAL1 & y<1|x+y) &
 card(empty) = 0 &

 infs = %x.(x:seq1(0..1)|first(x)+1) &
 infs([1,0,1,0,1]) = 2 &
 infs([0,0,1,0,1]) = 1
OPERATIONS
 res <-- FirstPlus1(p) = PRE p:seq1(0..1) & card(p)=5 THEN /* card(p)>5 does not work */
  res := infs(p)
 END
END

