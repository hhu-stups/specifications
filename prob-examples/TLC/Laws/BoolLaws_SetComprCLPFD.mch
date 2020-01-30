MACHINE BoolLaws_SetComprCLPFD
/* Boolean Laws expressed using set comprehensions with constrained integer variables*/
CONSTANTS
   TT,FF
DEFINITIONS
 pt == (p>1); P == 0..3;
 qt == (q>1); Q == 0..3;
 rt == (r>1); R == 0..3;
 PQRCart == (P*Q*R); PQ == P*Q;
 PQRPred == (p:P & q:Q & r:R & (p>q or q>p) & (p>r or r>p));
 PQR == {p,q,r|PQRPred};
 tr == (TT=TT);
 fail == (TT=FF);
 SET_PREF_CLPFD == TRUE
PROPERTIES
   FF:BOOL & FF=FALSE & TT:BOOL & TT=TRUE &

   /* Associativity rules */
   {p,q,r| p:P & q:Q & r:R & ((pt or qt) or rt)}  =  {p,q,r| p:P & q:Q & r:R & (pt or (qt or rt))} &
   {p,q,r| p:P & q:Q & r:R & ((pt & qt) & rt)} =  {p,q,r| p:P & q:Q & r:R & (pt & (qt & rt))} &


   /* Commutativity rules */
   {p,q| p:P & q:Q & (pt & qt)}   = {p,q|p:P & q:Q & (qt & pt)} &
   {p,q| p:P & q:Q & (pt or qt)}  = {p,q|p:P & q:Q & (qt or pt)} &
   {p,q| p:P & q:Q & (pt <=> qt)} = {p,q|p:P & q:Q & (qt <=> pt)} &


   /* Distributivity rules */
   {p,q,r| PQRPred  &  (pt or (qt & rt))} = {p,q,r| PQRPred &  (pt or qt) & (pt or rt) } &
   {p,q,r| PQRPred &  (pt & (qt or rt))} = {p,q,r| PQRPred & ( (pt & qt) or (pt & rt) ) } &

   /* De Morgan's rules */ 
   {p,q| p:P & q:Q & not(pt or qt)}   =  {p,q|p:P & q:Q & not(pt) & not(qt)} &
   {p,q| p:P & q:Q & not(pt  & qt)}   =  {p,q|p:P & q:Q & ( not(pt) or not(qt))} &
   
 /* some unamed rules about => and <=> */
  {p,q| p:P & q:Q &    ( (pt => qt) <=> (not(pt) or qt) ) } = PQ &
  {p| p:P &    ( pt <=> pt )} = P &
  {p,q,r| PQRPred &  (((pt => qt) & (qt => rt)) => (pt => rt)) } = PQR & /* Modus pones */
  {p,q,r| PQRPred &  (((pt <=> qt) & (qt <=> rt)) => (pt <=> rt)) } = PQR &
  {p,q| p:P & q:Q &    ((pt <=> qt) => (pt => qt)) } = PQ &
  {p,q| p:P & q:Q &    ((pt <=> qt) => (qt => pt)) } = PQ &
  {p,q| p:P & q:Q &    ((pt <=> qt) <=> ((pt => qt) & (qt => pt))) } = PQ &

  {p,q| p:P & q:Q &    ( pt => qt or pt )} = PQ &
  {p,q| p:P & q:Q &    ( (pt=>qt) or pt ) & ( pt => (qt or pt) ) } = PQ &


   /* Some tautologies */
   {p,q| p:P & q:Q & ( pt => (qt => pt) ) } = PQ &
   {p,q| p:P & q:Q &  ( pt => (qt => (pt & qt)))} = PQ &
   {p,q| p:P & q:Q &  ((pt & qt) => pt ) &  ( (pt & qt) => qt ) } = PQ &
   {q| q:Q & (not(not(qt)) => qt)} = Q &
   {p,q| p:P & q:Q &  ((pt => qt) => ( (qt=>pt) => (qt<=>pt) ) ) } = PQ &
   
 TT/=FF
END

