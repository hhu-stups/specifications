MACHINE Dominos
CONSTANTS n, even, odd
PROPERTIES n=4 &
 even /\ odd = {} &
 even \/ odd = (1..n)*(1..n) &
 even = {x,y|x:1..n & y:1..n & (x+y) mod 2 = 0}
VARIABLES cov
INVARIANT cov : (1..n)<->(1..n) &
  card(cov /\ even) = card(cov /\ odd)
INITIALISATION cov := {}
OPERATIONS
 PlaceDominoH(x,y) = PRE x:1..(n-1) & y:1..n & (x,y) /: cov & (x+1,y) /: cov THEN cov := cov \/ {x|->y,x+1|->y} END;
 PlaceDominoV(x,y) = PRE x:1..n & y:1..(n-1) & (x,y) /: cov & (x,y+1) /: cov THEN cov := cov \/ {x|->y,x|->y+1} END;
 Goal = PRE cov = ((1..n)*(1..n)) \ {(1,1),(n,n)} THEN skip END
DEFINITIONS
 ANIMATION_FUNCTION == {r,c,i|r:1..n & c:1..n & i=bool((r,c):cov)}
END