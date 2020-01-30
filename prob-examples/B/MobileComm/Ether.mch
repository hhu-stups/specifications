MACHINE Ether
SETS 
 TYPE={DATA};
 PACKETS={p1,p2}; NODES = {n1,n2,n3,n4} /* only for animation*/
DEFINITIONS
  FT_TYPE == (from:NODES & to:NODES & from/=to);
  FTE_TYPE == (FT_TYPE & packet:PACKETS & type:TYPE)
CONSTANTS link
PROPERTIES
  link: NODES <->NODES &
  link=link~ &  id(NODES) /\ link = {} & /* symmetric and non-ref lexive */
  /* for animation: n1--n2--n3--n4: */
  link = {n1|->n2, n2|->n1, n2|->n3, n3|->n2, n3|->n4, n4|->n3}
VARIABLES onAir
INVARIANT onAir: (NODES*NODES)+-> (PACKETS*TYPE) &
dom(onAir): NODES >+> NODES /* A node cannot send more than one packet at a time*/
ASSERTIONS
(dom(onAir))~: NODES >+> NODES  /* A node cannot receive more than one packet at a time */
INITIALISATION onAir := {}
OPERATIONS
putIntoEther(from,to,packet,type)=
 PRE (FTE_TYPE & from|->to:link & /* A link between to and from exists */
   from/:dom(dom(onAir)) & /* the sender  is not already sending */
   from/:ran(dom(onAir)) & /* or receiving */
   to/:dom(dom(onAir)) & /* the receiver  is not already sending */
   to/:ran(dom(onAir)) & /* or receiving */
   from|->to/:dom(onAir) & /* for b4free proof */
   link[{from}] /\ dom(dom(onAir)) = {} & /* neighbors of the sender are not sending */
   link[{from}] /\ ran(dom(onAir)) = {} & /* or receiving */
   link[{to}] /\ dom(dom(onAir)) = {} /* Neighbors of the receiver are not sending*/
   ) 
 THEN onAir:=onAir \/ {(from|->to)|->(packet|->type)}
END;

res <-- canSend(from,to)=PRE FT_TYPE THEN IF (from|->to:link &
   from/:dom(dom(onAir)) & 
   from/:ran(dom(onAir)) & 
   to/:dom(dom(onAir)) &
   to/:ran(dom(onAir)) & 
   from|->to/:dom(onAir) & 
   link[{from}] /\ dom(dom(onAir)) = {} & 
   link[{from}] /\ ran(dom(onAir)) = {} & 
   link[{to}] /\ dom(dom(onAir)) = {} 
   ) THEN res:=1 ELSE res:=0 END END;

removeFromEther(from,to)=
 PRE (FT_TYPE & (from|->to):dom(onAir))
 THEN onAir:= {from|->to} <<| onAir 
END;

 
route<--getRoute(from,to)=PRE FT_TYPE THEN 
 ANY r WHERE r:iseq1(NODES) & first(r)=from & last(r)=to  &  !(i).((i:NATURAL1 & i <= size(r)-1) => (r(i)|->r(i+1):link))
  THEN route:=r END
END

END