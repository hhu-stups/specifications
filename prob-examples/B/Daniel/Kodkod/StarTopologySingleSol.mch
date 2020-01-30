MACHINE StarTopologySingleSol
DEFINITIONS Mx == 21; NODES == 1..Mx
/* A variation of StarTopology with a < constraint instead of /= to ensure single solution */
/*
Timings on MacBook Pro 3.06 GHz, ProB 1.3.3-final3
Mx  ProB
 7   0.01 sec
 9   0.01 sec
11   0.02 sec
15   0.02 sec
21   0.04 sec
31   0.10 sec (but times out after first sol found)
*/
CONSTANTS nxt, root
PROPERTIES
  root = 1 &
  nxt: NODES --> NODES &
  nxt(root) = root &
  !x.(x:NODES-{root} => (nxt(x)=root or nxt(nxt(x))=root)) &
  !x.(x:NODES-{Mx} => ( nxt(x)/=root => !y.(y:NODES & y>x => (nxt(y)/=root & nxt(x)<nxt(y))))) & 
  card(nxt~[{root}]) = 1+ card(NODES-{Mx})/2 
ASSERTIONS 
  !x.(x:NODES-{Mx} & nxt(x)/=root => !y.(y:NODES & y>x => (nxt(y)/=root & nxt(x)<nxt(y)))) ; /* much less efficient than the equivalent forall above as it will delay on nxt being instantiated */
  !x.(x:NODES-{Mx} & nxt(x)/=root => (nxt(x+1)/=root & nxt(x)/=nxt(x+1))) ;
  !x.(x:NODES-{Mx} & nxt(x)/=root => !y.(y:NODES & y>x => (nxt(y)/=root & nxt(x)/=nxt(y)))) ;
  card(nxt~[{root}]) = 1+card(NODES-{Mx})/2
OPERATIONS
  r <-- Next(yy) = PRE yy:NODES THEN r:= nxt(yy) END;
  r <-- CardPred(yy) = PRE yy:NODES THEN r := card(nxt~[{yy}]) END
END

