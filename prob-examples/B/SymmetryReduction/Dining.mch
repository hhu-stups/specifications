MACHINE Dining
/* CSP_CONTROLLER Dining */
/* To use Dining.csp to guide this B machine:
  1. be sure you are in normal (and not beginner) mode 
    (otherwise change mode in Preferences->User Mode)
  2. Use the menu command: File -> Open Special -> Use Default CSP File
*/

SETS
 Phil  /* comment in for CSP: = {p1,p2,p3,p4} */ ;
 Forks
DEFINITIONS
 scope_Phil == 1..4;
 scope_Forks == 1..4
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

