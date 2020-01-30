MACHINE StarTopology
DEFINITIONS Mx == 11; NODES == 1..Mx
/*
Timings on MacBook Pro 3.06 GHz, ProB 1.3.3-final3
Mx  ProB forall1   ProB forall2
 9   0.03 sec    
11   0.29 sec      0.02 sec
13   3.04 sec      0.02 sec
15  40.11 sec      0.02 sec
*/
CONSTANTS nxt, root
PROPERTIES
  root = 1 &
  nxt: NODES --> NODES &
  nxt(root) = root &
  !x.(x:NODES-{root} => (nxt(x)=root or nxt(nxt(x))=root)) &
  !x.(x:NODES-{Mx} & nxt(x)/=root => !y.(y:NODES & y>x => (nxt(y)/=root & nxt(x)<nxt(y)))) & /* forall 1 */
  card(nxt~[{root}]) = 1+ card(NODES-{Mx})/2 
ASSERTIONS 
  !x.(x:NODES-{Mx} & nxt(x)/=root => (nxt(x+1)/=root & nxt(x)/=nxt(x+1))) ;
  !x.(x:NODES-{Mx} & nxt(x)/=root => !y.(y:NODES & y>x => (nxt(y)/=root & nxt(x)/=nxt(y)))) ; /* forall 1 */
  !x.(x:NODES-{Mx} => (nxt(x)/=root => !y.(y:NODES & y>x => (nxt(y)/=root & nxt(x)<nxt(y))))); /* forall 2 ; currently much more efficient as no delaying on nxt */
  card(nxt~[{root}]) = 1+card(NODES-{Mx})/2
OPERATIONS
  r <-- Next(yy) = PRE yy:NODES THEN r:= nxt(yy) END;
  r <-- CardPred(yy) = PRE yy:NODES THEN r := card(nxt~[{yy}]) END
END

