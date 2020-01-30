MACHINE
   PhilRing
/* CSP_CONTROLLER Dining */
SETS
 Phil /* ={p1,p2,p3,p4} */;
 Forks  /* = {f1,f2,f3,f4} */
DEFINITIONS
 scope_Philx == 1..4;
 scope_Forksx == 1..4
CONSTANTS lFork,rFork
PROPERTIES             /* f1/=f2 & */
 lFork: Phil >->> Forks &
 rFork: Phil >->> Forks &
 card(Forks) = card(Phil)&
 !pp.(pp:Phil => lFork(pp) /= rFork(pp))  & 
 !ss.((ss: POW(Phil) & ss<<:Phil)& card(ss)>0 => 
	   rFork~[lFork[ss]] /= ss)
ASSERTIONS
 !ss.((ss: POW(Phil) & ss<<:Phil)& card(ss)>0 => 
	lFork~[rFork[ss]] /= ss)
VARIABLES taken
INVARIANT
 taken: Forks +-> Phil &
 !xx.(xx:dom(taken) => (lFork(taken(xx)) = xx or rFork(taken(xx)) = xx))
INITIALISATION taken:={}
OPERATIONS
  TakeLeftFork(p,f) = PRE p:Phil & f:Forks & f/:dom(taken) & lFork(p)=f THEN
    taken(f) := p
  END;
  TakeRightFork(p,f) = PRE p:Phil & f:Forks & f/:dom(taken) & rFork(p)=f THEN
    taken(f) := p
  END;
  DropFork(p,f) = PRE p:Phil & f:Forks & f:dom(taken) & taken(f)=p THEN
    taken := {f} <<| taken
  END
END
