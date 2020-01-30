MACHINE Dining_With_Protocol_in_B


SETS
 Phil;
 Forks
DEFINITIONS
 scope_Philxx == 1..5;
 scope_Forksxx == 1..5
CONSTANTS lFork,rFork
PROPERTIES
 lFork: Phil >->> Forks &
 rFork: Phil >->> Forks &
 !pp.(pp:Phil => lFork(pp) /= rFork(pp))
VARIABLES taken
INVARIANT
 taken: Forks +-> Phil &
 !xx.(xx:dom(taken) => (lFork(taken(xx)) = xx or rFork(taken(xx)) = xx))
INITIALISATION taken:={}
OPERATIONS
  TakeLeftFork(p,f) = PRE p:Phil & f:Forks & f/:dom(taken) & lFork(p)=f & p /: ran(taken) THEN
    taken(f) := p
  END;
  TakeRightFork(p,f) = PRE p:Phil & f:Forks & f/:dom(taken) & rFork(p)=f & p: ran(taken) THEN
    taken(f) := p
  END;
  DropForks(p,f1,f2) = PRE p:Phil & f1:Forks & f1:dom(taken) & taken(f1)=p & f1 /= f2 & f2:dom(taken) & taken(f2)=p THEN
    taken := {f1,f2} <<| taken
  END
END

