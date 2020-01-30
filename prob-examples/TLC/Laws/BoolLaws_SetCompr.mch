MACHINE BoolLaws_SetCompr
/* Boolean Laws expressed using set comprehensions */
CONSTANTS
   TT,FF
DEFINITIONS
 pt == (p=TRUE);
 qt == (q=TRUE);
 rt == (r=TRUE);
 tr == (TT=TT);
 fail == (TT=FF)
PROPERTIES
   FF:BOOL & FF=FALSE & TT:BOOL & TT=TRUE &

   /* Associativity rules */
   {p,q,r|((pt or qt) or rt)}  =  {p,q,r|(pt or (qt or rt))} &
   {p,q,r|((pt & qt) & rt)} =  {p,q,r|(pt & (qt & rt))} &


   /* Commutativity rules */
   {p,q|(pt & qt)}   = {p,q|(qt & pt)} &
   {p,q|(pt or qt)}  = {p,q|(qt or pt)} &
   {p,q|(pt <=> qt)} = {p,q|(qt <=> pt)} &


   /* Distributivity rules */
   {p,q,r| (pt or (qt & rt))} = {p,q,r| (pt or qt) & (pt or rt) } &
   {p,q,r| (pt & (qt or rt))} = {p,q,r| (pt & qt) or (pt & rt) } &

   /* De Morgan's rules */ 
   {p,q|not(pt or qt)}   =  {p,q|not(pt) & not(qt)} &
   {p,q|not(pt  & qt)}   =  {p,q|not(pt) or not(qt)} &
   
 /* some unamed rules about => and <=> */
  {p,q|   ( (pt => qt) <=> (not(pt) or qt) ) } = BOOL*BOOL &
  {p|     ( pt <=> pt )} = BOOL &
  {p,q,r| (((pt => qt) & (qt => rt)) => (pt => rt)) } = BOOL*BOOL*BOOL & /* Modus pones */
  {p,q,r| (((pt <=> qt) & (qt <=> rt)) => (pt <=> rt)) } = BOOL*BOOL*BOOL &
  {p,q|   ((pt <=> qt) => (pt => qt)) } = BOOL*BOOL &
  {p,q|   ((pt <=> qt) => (qt => pt)) } = BOOL*BOOL &
  {p,q|   ((pt <=> qt) <=> ((pt => qt) & (qt => pt))) } = BOOL*BOOL &

  {p,q|   ( pt => qt or pt )} = BOOL*BOOL &
  {p,q|   ( (pt=>qt) or pt ) & ( pt => (qt or pt) ) } = BOOL*BOOL &


   /* Some tautologies */
   {p,q| pt => (qt => pt) } = BOOL*BOOL &
   {p,q| pt => (qt => (pt & qt))} = BOOL*BOOL &
   {p,q| ((pt & qt) => pt ) &  ( (pt & qt) => qt ) } = BOOL*BOOL &
   {q| not(not(qt)) => qt} = BOOL &
   {p,q| (pt => qt) => ( (qt=>pt) => (qt<=>pt) ) } = BOOL*BOOL &
   
 TT/=FF
END

