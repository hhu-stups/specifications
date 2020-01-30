MACHINE SimpleDeadlockPO
VARIABLES X,Y,Z,A
INVARIANT
 A:POW(0..100) & X:0..100 & Y:0..100 & Z:0..100
INITIALISATION
 X,Y,Z,A := 0,0,0,{2,32}
OPERATIONS
 SolveDeadlockPO(x,y,z) = PRE x>=0 &
   not(x:{0,1,2} & z/=0 & y:A) & not(x>2 & y:A) & not(y/:A) THEN
  X,Y,Z := x,y,z
 END
END
