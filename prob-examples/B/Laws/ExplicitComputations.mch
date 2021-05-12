MACHINE ExplicitComputations
/* A machine with some explicitly given results for certain computations */
SETS
  PROC = {p1,p2,p3}; SINGLE={one}
DEFINITIONS SET_PREF_MAXINT == 5; SET_PREF_MININT == -1
CONSTANTS
  r, r2, d, cd, cr, s,
  x,y,z, u
PROPERTIES
  p1=p1 & p1 /= p2 & not(p1=p2) &
  r = {p1 |-> p2, p2|-> p3} &
  r: d <-> cd & r: PROC +-> PROC &
  r: d --> cd & r/: PROC --> PROC & r/: d --> d &
  r: d >-> cd & r /: PROC >-> cd & r /: d >-> d &
  r : PROC +->> cd & r : d -->> cd &
  r: PROC >+> PROC & r/: PROC >+> {p3} &
  r: PROC >+>> cd & r: d >+>> cd & r: d >->> cd &
  r /: PROC --> PROC & r /: {p1,p2} --> {p1,p2} &
  r /: d +->> PROC & r /: d -->> PROC &
  r /: PROC >+>> PROC & r /: d >->> PROC &
  r /: {p2} +-> PROC & r /: PROC +-> {p2} &  r /: PROC +-> {p3} &  r /: PROC +-> {p1} &
  r /: PROC +-> {p1,p2} &
  fnc(r) = {p1|->{p2}, p2 |->{p3}} &
  fnc(r): dom(r) --> POW(ran(r)) &
  rel(fnc(r)) = r &
  rel(fnc({x,y|x:1..10 & y:1..x})) = {x,y|x:1..10 & y:1..x} &

  /* some rules over the global sets */

  {PROC} = {{p1,p2,p3}} &
  {(PROC - {p1}) \/ {p1}} = {{p2,p3,p1,p2}} &
  card({ {p1,p2}, PROC, {p1,p3,p2}}) = 2 &
  {{PROC},{{p2,p3,p1}}} = {{{p3,p3,p1,p2}}} &
  {SINGLE} = {{one}} &

  /* some rules for sets over singleton SET */
  one : {one} & one /: {} &
  !(x,s).(x:SINGLE & s<:SINGLE & x/:s => x=one & s={}) &
  !(x,s).(x:SINGLE & s<:SINGLE & x:s => x=one & s={one}) &

  /* testing reification */
  !zz.(zz:PROC => ( zz:{p1,p2} <=> (zz=p1 or zz=p2))) &

  {1 |->p2, 2|->p2} : NATURAL1 +-> {p2} &
  {1 |->p2, 2|->p2} : 1..2 +-> {p2} &
  {1 |->p2, 2|->p2} /: 1..1 +-> {p2} &
  {1 |->p2, 2|->p2} : 0..3 +-> {p2} &

  r2 : PROC <-> PROC & p1|->p3 : r2 &
  r2 /: PROC +-> {p1,p2} & r2 : PROC +-> PROC &
  card(r2) = 2 & dom(r2)={p1,p2} & ran(r2)={p3} &
   /* r2 will be {p1|->p3, p2|->p3} */
  r2 /: PROC >+> PROC &

  {} <-> {} = { {} } &
  PROC <-> {} = { {} } &
  {} <-> PROC = { {} } &
  {p1} <-> {p2} = { {p1|->p2}, {} } &
  card({p1} <-> {p2}) = 2 &
  {p1} <-> {p2,p3} = { {p1|->p2}, {p1|->p3}, {} , {p1|->p2, p1|->p3} } &
  card({p1,p2,p3} <-> {p1,p2,p3}) = 2**(3*3) &
  {} +-> {} = { {} } &
  PROC +-> {} = { {} } &
  {} +-> PROC = { {} } &
  {p1} +-> {p2} = { {p1|->p2}, {} } &
  {p1} +-> {p2,p3} = { {p1|->p2}, {p1|->p3}, {} } &
  {} --> {} = { {} } &
  PROC --> {} = { } &
  {} --> PROC = { {} } &
  {p1} --> {p2} = { {p1|->p2} } &
  {p1} --> {p2,p3} = { {p1|->p2}, {p1|->p3} } &
  card({p1,p2,p3} --> {p1,p2,p3}) = 3**3 &
  card({p1,p2,p3} +-> {p1,p2,p3}) = 4**3 &
  card({p1,p3} --> {p1,p2,p3}) = 3**2 &
  card({p1,p3} +-> {p1,p2,p3}) = 4**2 &
  {p1} >+> {p2,p3} = { {}, {p1|->p2}, {p1|->p3} } &
  {p1} >-> {p2,p3} = { {p1|->p2}, {p1|->p3} } &
  {p1} -->> {p2,p3} = { } &
  {p1} +->> {p2,p3} = { } &
  {p1,p2} -->> {p3} = { {p1|->p3, p2|->p3} } &
  {p1,p2} +->> {p3} = { {p1|->p3}, {p2|->p3}, {p1|->p3, p2|->p3} } &
  d = {p1,p2} & cd = {p2,p3} &
  not(d=cd) & cd /= d &
  dom(r) = d &
  ran(r) = cd &
  d = {p2,p1} & d = {p2,p2,p1,p1,p2,p1} &
  d /= {} & {} /= d & d /= {p1,p2,p3} & PROC /= d & d /= {p1} & d /= {p2} &
  r(p1) = p2 & p2 = r(p1) & p3 = r(p2) & r(r(p1)) = p3 & p3 = r(r(p1)) &
  r[d] = cd &
  r[{}] = {} &
  r~[cd] = d &
  r~ = {p2|->p1, p3 |->p2} &
  cr = {p1|->p2, p2|->p3, p1|->p3} &
  (r;r) = {p1|->p3} & (r;{}) = {} & ({};r) = {} & ({};{}) = {} &
  ((r;r);r) = {} & (r;(r;r)) = {} &
  ((r;r);r~) = {p1|->p2} &
  ({1|->11,11|->2,2|->22,22|->1} ; {1|->11,1|->111,2|->22}) = {22|->11,22|->111,11|->22} &
  r <+ {p1|->p3} = {p1|->p3, p2|->p3} &
  r <+ {} = r &
  {} <+ r = r &
  {p1|->p3} <+ r = r &
  id(d) = {p2|->p2, p1|->p1} &
  card(id(d)) = 2 &
  closure1(r) = cr &
  closure1(r~) = cr~ &
  #rr.(rr:BOOL<->BOOL & card(rr)=1 & iterate(rr,2)=rr) &
  #rr.(rr:BOOL<->BOOL & card(rr)=1 & iterate(rr,2)={}) &
  !rr.(rr:BOOL<->BOOL & card(rr)=1 & iterate(rr,2)=rr => (rr={TRUE|->TRUE} or rr={FALSE|->FALSE})) &
  !rr.(rr:BOOL<->BOOL & card(rr)=1 & iterate(rr,2)={} => (rr={TRUE|->FALSE} or rr={FALSE|->TRUE})) &
  #rr.(rr:BOOL<->BOOL & card(rr)=1 & closure1(rr)=rr) &
  !rr.(rr:BOOL<->BOOL & card(rr)=1 => closure1(rr)=rr) &
  #rr.(rr:BOOL<->BOOL & card(rr)=2 & closure1(rr)=rr) &
  #rr.(rr:BOOL<->BOOL & card(rr)=2 & closure1(rr)/=rr) &
  !rr.(rr:BOOL<->BOOL & card(rr)=2 & closure1(rr)/=rr => rr={TRUE|->FALSE,FALSE|->TRUE}) &
  card({rr|rr:BOOL<->BOOL & closure1(rr)=rr}) + card({rr|rr:BOOL<->BOOL & closure1(rr)/=rr}) = 16 &
  {rr|rr:BOOL<->BOOL & card(rr)=4 & closure1(rr)=rr} = {BOOL*BOOL} &
  closure1(%x.(x:1..1000000|x/2))[{1001}]  = {0,1,3,7,15,31,62,125,250,500} &
  closure1(%x.(x:1..10000|x/2))[{1001}]  = {0,1,3,7,15,31,62,125,250,500} &
  {x| closure1(%x.(x:1..1000|x/2))[{x}] = {0,1,2,4} & x:1..100} = {8,9} &
  iterate(r,1) = r &
  iterate(r,2) = (r;r) &
  iterate(r,3) = ((r;r);r) &
  prj1(PROC,PROC)(p1|->p2) = p1 &
  prj2(PROC,PROC)(p1|->p2) = p2 &
  p1 : d & p2: d  & not(p3:d) & p3 /: d &
  cr = r \/ {p1|->p3} &
  d \/ cd = PROC & d \/ {} = d & {} \/ d = d & d = d\/d &
  {} \/ {} = {} &
  d \/ {p1} = d & d \/ {p3} = PROC & {p3} \/ d = PROC & {p1} \/ d = d &
  d /\ cd = {p2} & d /\ {} = {} & {} /\ d = {} &
  {} /\ {} = {} &
  d /\ {p2} = {p2} & {p2} /\ d = {p2} &
  d - cd = {p1} &
  cd - d = {p3} &
  d /<: cd & d/<<: cd & not(d <: cd) & not(d <<: cd) &
  cd /<: d & cd /<<: d &
  d <<: PROC & d <: PROC & d<:d & d/<<:d &
  cd <<: PROC & cd <: PROC & cd <: cd & cd /<<:cd &
  {p1} <: {p1} & {p2,p3} <: {p3,p2,p1} &
  {1,3,5} <: 1..5 & {1,3,5} /<: 1..4 & {1,3,5} /<: 2..5 &
  d<|r = r & d<<|r = {} &
  r|>cd = r & r |>> cd = {} &
  cd <|r = {p2|->p3} &
  cd <<|r = {p1|->p2} &
  r|>d = {p1|->p2} &
  r|>>d = {p2|->p3} &

  {p1} <<| {p1|->p2, p1|->p1, p2|->p2} = {p2|->p2} &
  {p2} <| {p1|->p2, p1|->p1, p2|->p2} = {p2|->p2} &
  {p1|->p2, p1|->p1, p2|->p2} |> {p1} = {p1|->p1} &
  {p1|->p2, p1|->p1, p2|->p2} |>> {p1} = {p1|->p2, p2|->p2} &

  r >< r = { p1|->(p2,p2), p2|->(p3,p3) } &
  {p1|->1, p1|->2, p2|->3, p3|->4} >< {p1|->3,p1|->4} =
       { p1|->(1,3), p1|->(1,4), p1|->(2,3), p1|->(2,4)} &
  {p1|->1, p1|->2, p2|->3, p1|->4} >< {p2|->3, p3|->7} = { p2|->(3,3) } &
  {p1|->1, p1|->2, p2|->3, p3|->4} >< {p1|->3,p1|->4, p3|->7} =
       { p1|->(1,3), p1|->(1,4), p1|->(2,3), p1|->(2,4), p3|->(4,7)} &
  (r || r) = { (p1,p1)|->(p2,p2), (p1,p2)|->(p2,p3), (p2,p1)|->(p3,p2), (p2,p2)|->(p3,p3) } &

  id({p1}) : PROC +-> PROC &
  id({p1}) : {p1} +-> {p1} &
  id({p1}) : {p1} --> PROC &
  id({p1}) : {p1} --> {p1} &
  id({p1}) /: PROC --> PROC &
  id({p1}) /: {p1,p2} --> PROC &
  id({p1}) /: {p1} --> {p2,p3} &
  id({p1,p3})[{p1,p2}] = {p1} &
  id({p1,p3})[{p3}] = {p3} &
  id(NAT)[NAT] = NAT &
  id({}) : NAT +-> NATURAL &
  id(NAT) : NAT --> NAT &
  id(NAT) : NAT --> NATURAL &
  id(NAT) : NATURAL +-> NAT &
  id(NAT) : NATURAL +-> NATURAL &
  id(NATURAL1) : NATURAL +-> INTEGER &
  id(1..100000) : NATURAL1 +-> NATURAL1 &
  id(NATURAL) : NATURAL --> NATURAL &
  id(NATURAL) : NATURAL --> INTEGER &
  id(NATURAL) : NATURAL >+> NATURAL &
  id(NATURAL1) : NATURAL >+> NATURAL1 &
  id(NATURAL1) : NATURAL >+> NATURAL &
  id(NATURAL) /: NATURAL >+> NATURAL1 &
  id(NATURAL) : NATURAL >+>> NATURAL &
  id(NATURAL1) : NATURAL >+>> NATURAL1 &
  id(NATURAL) : NATURAL >-> NATURAL &
  id(NATURAL) : NATURAL >->> NATURAL &
     id(NAT) /: NATURAL --> NATURAL &
     id(NATURAL) /: NATURAL1 --> INTEGER &
     id(NATURAL) /: NATURAL --> NATURAL1 &
     id(NATURAL) /: NATURAL --> 1..100000 &
     id(NATURAL) /: NAT +-> INTEGER &
     id(NATURAL1) : NATURAL1 >->> NATURAL1 &
     id(NATURAL) /: NATURAL >->> NATURAL1 &
     id({1,2,3}) /: 2..100000 +-> INTEGER &
     id(1..1000000) /: 1..999999 +-> INTEGER &
     id(1..100000) : 1..100001 +-> INTEGER &
     id(0..100000) /: NATURAL1 +-> NATURAL &
     id(0..100000) /: NATURAL +-> NATURAL1 &
     id(INTEGER*INTEGER) /: (INT*INT) --> (INTEGER*INTEGER) &
     /* id(INTEGER*INTEGER) /: (INT*INT) +-> (INTEGER*INTEGER) &  subset check for cart products not yet implemented */
     id(INTEGER*INTEGER) : (INTEGER*INTEGER) --> (INTEGER*INTEGER) &
     id(INTEGER*INTEGER) : (INTEGER*INTEGER) +-> (INTEGER*INTEGER) &
     id(INT*INTEGER) : (INTEGER*INTEGER) +-> (INTEGER*INTEGER) &
     /* id(INT*INTEGER) /: (NATURAL*INTEGER) +-> (INTEGER*INTEGER) & */
  id(NATURAL)[1..10] = 1..10 &
  id(NAT)~=id(NAT) & id(NATURAL)~=id(NATURAL) &
 /* (NAT*NAT) : NATURAL <-> INTEGER & (NATURAL*NAT) /: NATURAL <-> INTEGER : still expands ! */

 /* Set Comprehensions */
  {x|x:r} = r & {x,y|x|->y:r} = r &
  {y,x|x|->y:r} = r~ &
  card({y,x|x|->y:r}) = card(r) &
  card({y,x|x|->y:r}) = 2 &
  card({y,x|x|->y:r}) >= 2 &
  card({y,x|x|->y:r}) > 1 &
  {x| x <<: {y| y<<: {z | z:0..1}}} = {{}, {{}}, {{},{0}}, {{},{1}}, {{0}}, {{0},{1}}, {{1}}} &
  card({x| x <: {y| y<: {z | z:0..1}}}) = 16 &
  {x,y| x<:0..1 & y<:0..1 & x/<:y & y/<:x } = {({0}|->{1}),({1}|->{0})} &
  {x,y| (x:{y+3,y+5} or y:{x+2,x+4}) & x:0..6 & y:0..4} =
    {(0|->2),(0|->4),(1|->3),(2|->4),(3|->0),(4|->1),(5|->0),(5|->2),(6|->1),(6|->3)} &
  {x|x<:1..4 & card(x)>0 & x /\ 3..4 /= {} & x /\ 0..2 = {}}  =  {{3}, {3,4}, {4}} &
  {x|x<:1..10 & card(x)>0 & x /\ 3..4 /= {} & x /\ 0..2 = {} &
    (8..10) - x = 9..10 & 6 /: x & 7 : x & #v.(v:x & v mod 5 = 0) & card(x)<5} = {{3,5,7,8},{4,5,7,8}} &
  {xx | xx:{1|->TRUE,2|->TRUE,2|->FALSE} & (xx  :  {(2|->TRUE),(2|->FALSE),(3|->TRUE)} or xx  :  {(1|->TRUE),(1|->FALSE),(2|->TRUE),(2|->FALSE),(3|->TRUE),(3|->FALSE)})} =
  {1|->TRUE, 2|->TRUE, 2|->FALSE} &
  {x| x:1..10 & not(x..x+1 <: 3..8)} = {1,2,8,9,10} &
  {n | [0,1,2,3,4,5,6,7,8,9,10]: 1..n --> 0..10} = {11} &
  {n,m | [0,1,2,3,4,5,6,7,8,9,10]: 1..n --> 0..m & m:0..12} = {11|->10, 11|->11, 11|->12} &

 /* Powersets */
  POW(d) = {{},{p1},{p2},d} & POW({}) = { {} } &
  POW1(d) = {{p1},{p2},d} & POW1({}) =  {} &
  {} /: POW1(d) & {} : POW(d) & (d/={} => d:POW1(d)) & d:POW(d) &
  FIN(d) = {{},{p1},{p2},d} & FIN({}) = { {} } &
  FIN1(d) = {{p1},{p2},d} & FIN1({}) = {} &
  {} /: FIN1(d) & d : FIN1(d) &
  card(POW({p1,p2,p3})) = 2**3 &
  card(FIN({p1,p2,p3})) = 2**3 &
  card(POW1({p1,p2,p3})) = 2**3 - 1 &
  card(FIN1({p1,p2,p3})) = 2**3 - 1 &
  card(POW({ {}, {{}}, {{},{1}}, {{1}} })) = 16 &
  card(POW({ {}, {{}}, {{},{1}}, {{1}} }) - {{}}) = 15 &
  card(POW({ {}, {{}}, {{},{p1}}, {{p1}} }) - {{}}) = 15 &
  POW({ {}, {{}}, {{},{p1}}, {{p1}} }) - { {} } = POW1({ {}, {{}}, {{},{p1}}, {{p1}} }) &

  /* Cartesian Product: */
  d*{p3} = {p1|->p3, p2|->p3} &
  d*{} = {} & {}=d*{} & {}*{} = {} &
  d*d = {p1|->p1, p2|->p1, p1|->p2, p2|->p2} &
  p1|->p2 : d*d & p1|->p3 /: d*d &
  dom((NATURAL*INTEGER)) = NATURAL &
  dom(((1..3) * NATURAL1)) = 1..3 &
  dom((NATURAL * {})) = {} &
  ran((NATURAL*INTEGER)) = INTEGER &
  ran(((1..3) * NATURAL1)) = NATURAL1 &
  ran((NATURAL * (1..3))) = 1..3 &
  ran((NATURAL * {})) = {} &
  ran(({} * NATURAL)) = {} &
  card((1..3)*(1..4)) = 12 &
  card((1..3)*{}) = 0 &
  card({1}*(1..4)) = 4 &
  card({ x | x <: {1,2,3}*{TRUE,FALSE}}) = 2**6 &
  card(id((1..100)*(1..100))) = 100*100 &
  card(id((1..1000)*(1..10000))) = 1000*10000 &
  card(id((1..1000)*(1..1000))~)=1000*1000 &
  card(((1..1000)*(1..1000))~)=1000*1000 &
  TRUE |-> 99 : ((98..100000)*BOOL)~ &
  TRUE |-> 97 /: ((98..100000)*BOOL)~ &
  {}*{} <: {(1,1)} &
  {1,2}*{3,4} <: NATURAL*NATURAL &
  (1..10000)*(1..10000) <: NATURAL*NATURAL1 &
  (1 .. 10000) * (0 .. 10000) /<: NATURAL * NATURAL1 &
  (1..1000)*(1..9000) : (1..1000)<->(1..9999) &
  (1..1000)*(1..9000) /: (1..1000)<->(2..9999) &

  (	{1}*{41,51} \/  {2,11}*{41}
    \/  {6, 7}*{51} \/  {12}*{41,51}
    \/  {12,13}*{101} \/  {18,23}*{111}
    ) = {(1|->41),(1|->51),(2|->41),(6|->51),(7|->51),(11|->41),
         (12|->41),(12|->51),(12|->101),(13|->101),(18|->111),(23|->111)} &
  {x,y| x<:y & y<:0..1 & x*y={}} =
    {x,y| x<:y & y<:0..1 & x*y={}} &
  {x,y| ((x<<:y & y<:0..1) or (y<<:x & x<:0..1)) & x*y={}} =
    {({}|->{0}),({}|->{0,1}),({}|->{1}),({0}|->{}),({0,1}|->{}),({1}|->{})} &
  {x,y| ((x<<:y & y<:0..1) or (y<<:x & x<:0..1)) & x*y/={}} =
    {({0}|->{0,1}),({0,1}|->{0}),({0,1}|->{1}),({1}|->{0,1})} &
  {x,y|y=card(x*INTEGER) & x<<:{TRUE}} = { {}|->0} & /* check that card of cartesian product of empty and infinite set is 0 */
  card({}*INTEGER) = 0 &
  card(seq(BOOL)*{}) = 0 &

  /* generalized union/inter */
  union({d,cd}) = PROC &
  {p1,p2,p3} = union({d,cd}) &
  union({d}) = d & union({}) = {} &
  inter({d,cd}) = {p2} &
  inter({d}) = d &  /* inter({}) = {} & not well defined */
  {p2} = inter({d,cd}) &
  /* some rules about disjoint'ness */
  not( {} = d /\ cd ) &
  {} = d /\ {p3} &
  {} = {p1} /\ cd  & {} = {} /\ cd  & {} = cd /\ {}  & {} = {} /\ {}  &
  #z.({} = {z} /\ cd & z=p1) & /* force disjoint Prolog predicate to activate */
  #z.({} = z /\ cd & z={}) & /* force disjoint Prolog predicate to activate */
  u = {{0,5,2,4}, {2,4,5}, {2,1,7,5}} & /* example from page 124 of B-Book */
  inter(u) = {2,5} &
  union(u) = {0,1,2,4,5,7} &

  /* some rules using quantification */
  #x.(x:INTEGER & {x} \/ {1,2} = {1,2} ) &
  #x.(x:BOOL & {x} \/ {TRUE} = {TRUE} ) &
  #x.(x:BOOL*INTEGER & {x} \/ {TRUE|->0, FALSE|->1} = {TRUE|->0, FALSE|->1} ) &
  !x.(x:{1,3,5} => (x=1 or x=3 or x=5)) &
  !x.(x:{1,3,5} => (x*x=1 or x*x=9 or x*x=25)) &
  !x.(x:{1,3,5} => #y.(y:{1,3,5} & x>=y)) &
  not(!x.(x:{1,3,5} => #y.(y:{1,3,5} & x>y))) &
  #x.(x:{1,3,5} & !y.(y:{1,3,5} => x>=y)) &
  #x.(x:{1,3,5} & x/: {1,2,4,5}) &
  #x.(x:{1,3,5} & x*x=9) &
  not(#x.(x:{1,3,5} & !y.(y:{1,3,5} => x>y))) &
  (not(#c.(c = 1)) => 1=2) &
  !x.(x:{1,3,5} => (x:{1,3} or x:{3,5})) &

 /* some BOOL */
  TRUE = TRUE & FALSE = FALSE & TRUE /= FALSE & FALSE /= TRUE & not(TRUE=FALSE) & not(FALSE=TRUE) & not(TRUE/=TRUE) & not(FALSE/=FALSE) &  not(not(TRUE=TRUE)) &
  (1=1) & (bool(1=2)=bool(2=3)) & not(bool(1=1)=bool(1=2)) &
  (TRUE=TRUE <=> FALSE=FALSE) & not(TRUE=FALSE <=> FALSE=FALSE) &
  (TRUE=TRUE => FALSE=FALSE) & (TRUE=FALSE => FALSE=TRUE) &
  (TRUE=FALSE => TRUE=TRUE) & not(TRUE=TRUE => FALSE=TRUE) &
  TRUE = bool(TRUE=TRUE) & FALSE = bool(TRUE=FALSE) &
  {x|bool(x**2=x**3) = bool(x**2/=x+x) & x:1..50} = {1,2} &
  {x,t| x:POW(0..1) & bool(x:POW(NATURAL1))=t} =
     {({}|->TRUE),({0}|->FALSE),({0,1}|->FALSE),({1}|->TRUE)} &
  {x,t| x:POW(1024..1025) & bool(x:POW(NATURAL1))=t} =
     {({}|->TRUE),({1024}|->TRUE),({1024,1025}|->TRUE),({1025}|->TRUE)} &
  {x,t| x<:1..120  & card(x)=2 & bool(x<:(2..4))=t & bool(x/<:(118..119))=t} =
     {({2,3}|->TRUE),({2,4}|->TRUE),({3,4}|->TRUE),({118,119}|->FALSE)} &
  {y,t|bool( #x.(x:2..6 & (x>y & x<y+y) ))=t & y:3..6} =
     {(3|->TRUE),(4|->TRUE),(5|->TRUE),(6|->FALSE)} &
  {z|bool(#(x,y).(x:1..2 & x+y=z & y:3..5))=bool(z:{1,2,3,5}) & z:0..10} =
     {0,5,8,9,10} &
  {z|bool(#(x,y).(x:1..2 & x+y=z & y:3..40))=
     bool(z:{1,2,3,5}) & z:0..10} =
     {0,5} &
  {z|bool(#(x,y).((x : 1 .. 2 & (z:{x + y,0,-1} <=> z>=0)) & y : 3 .. 40)) =
     bool(z : {-1,0,1,2,3,5}) & z : 0 .. 10} = {0,5} &
     bool(1=2 & 1=1 or 1=1) = TRUE & // associativity
     bool(1=2 & (1=1 or 1=1)) = FALSE &

  /* some Arithmetic */
  PI(x).(x:{1,2,3}|x) = 6 &
  PI(x).(x:{1,2,5}|x+1) = 2*3*6 &
  PI(x).(x:{}|x) = 1 &
  PI(x).(x:1..3|x*x) = 36 &
  SIGMA(x).(x:{1,2,4}|x) = 7 &
  SIGMA(x).(x:{1,2,3,5}|x) = SIGMA(x).(x:{1,2,3,5}|x+1) - 4 &
  SIGMA(x).(x:{}|x) = 0 &
  SIGMA(x).(x:1..3|x) = 6 &
  SIGMA(x).(x:1..3|x*x) = 14 &
  SIGMA(x).(x : 1 .. 60000 & x > 0|1) = 60000 &
  SIGMA(x).(x:1..2000 \/ {-1}|x) = SIGMA(x).(x:1..2000|x) - 1 &
  SIGMA(x).(x:-2000..2000|x) = 0 &
  SIGMA(x).(x:2..2|x) = 2 &
  SIGMA(x).(x:3..2|x) = 0 &
  SIGMA(x).(x:1..100|x) = 5050 &
  SIGMA(x).(x:2..100|x) = 5049 &
  SIGMA(x).(x:1..2**30|x) = 576460752840294400 & /* check that interval sum computed efficiently */
  succ(1) = 2 & pred(2) = 1 &
  2+3 = 5 & 5 = 2+3 & 2+3 = 3+2 &
  2*3 = 6 & 3*2 = 2*3 &
  2*3 /= 2+3 &
  -(-2) = 2 &
  2+x = 5 & x=3 &  /* checking backwards computation */
  x*x = 9 & /* checking square */
  2*y = 6 & y=3 & /* checking backwards computation */
  2**z = 8 & z=3 & /* checking backwards computation */
  2**3 = 8 & 3 mod 2 = 1 & 2 mod 2 = 0 & 1 mod 2 = 1 &
  4/2 = 2 & 2 = 4/2 & 2 = 5/2 & 5/2 = 2 &
  3**0 = 1 & 0**2 = 0 & 0**0 = 1 &
  #zz.(zz:{0,1,2} & 0**zz = 1) &
  max({3,5,2,1}) = 5 & 4 = max({3,4,2}) &
  min({3,5,2,1}) = 1 & 2 = min({2,3,3}) &
  min(1..10) = 1 & max(1..10) = 10 & min(NAT)=0 & min(NAT1) = 1 & max(NAT1) = MAXINT &
  max(INT) = MAXINT & min(INT) = MININT & min(NATURAL1) = 1 & min(NATURAL) = 0 &
  card({1,2,3}) = 3 & 4 = card({1,2,3,4}) &
  card({2,3,3}) = 2 &
  card({2,3}) > 1 & 1 < card({2,3}) &
  card({2,3}) >= 2 & 2 <= card({2,3}) &
  2 = card({2,3,3}) & card({}) = 0 & card({3,5,2,1}) = 4 &
  1..3 = {1,2,3} &
  {3,2,1} = 1..3 & 1..3 = {3,1,2} & 1..0 = {} & {} = 1..0 &
  0 : INT & 0:NAT & 0 /: NAT1 & 0:NATURAL & 0/:NATURAL1 &
  1 : INT & 1:NAT & 1 : NAT1 & 1:NATURAL & 1:NATURAL1 &
  -1 : INT & -1 /: NAT  & -1 /: NAT1 & -1 /: NATURAL  & -1 /: NATURAL1 &
  (0:INTEGER <=> 0=0) & (0/:INTEGER <=> 0=1) &
  (MININT-1:INTEGER <=> 0=0) & (MININT-1/:INTEGER <=> 0=1) &
  (MAXINT+1:INTEGER <=> 0=0) & (MAXINT+1/:INTEGER <=> 0=1) &
  !(x,S).(S=NATURAL & x:{1,2} => x:S) &
  !(x,S).(S=NATURAL & x:{-1,-2} => x/:S) &
  !(x,S).(S=NATURAL1 & x:{1,2} => x:S) &
  !(x,S).(S=NATURAL1 & x:{-1,0} => x/:S) &
  MAXINT : INT & MAXINT+1 /: INT &
  MAXINT : NAT & MAXINT+1 /: NAT &
  MININT : INT & MININT-1 /: INT &
  not( 0 /: NAT) & not( 0 /: INT) & not( 0 /: INTEGER) &
  not( 1 /: NAT1) &
  0<1 & -1 < 0 & 0 <= 1 & 1<= 1 & 1>0 & 0>-1 & 1>=0 & 1>= 1 &
  not(1<0) & not (1<1) & not(1<=0) & not (0>1) & not(0>=1) & not(1>1) &
  not(not(0<1)) &
  dom(pred) = INTEGER  &
  {x|x:-10..10  & x / 4 =0} = -3..3 &
  {x|x:-10..10  & x / 4 =1} = 4..7 &
  {x|x:-10..10  & x / 4 =-1} = -7..-4 &
  (-1) / 4 = 0 & /* this is different from Z and TLA */
     9/3*2 = 6 & // test associativity
     3*2/6 = 1 &
     8 / 2 * 4 = 16 &
     8 / 4 / 2 = 1 &
     2**3**2 = 512 &

  /* interval sets */
  1..2 <: 1..2 &  2..0 <: 1..1 &
  1..2 <: NATURAL & 1..2 <: NAT & 1..2 <: NAT1 & 1..2 <: NATURAL1 & 1..2 <: INT &
  1..2 <: 1..3 & 1..2 <: 0..2 & 1..2 <: 0..3 &
  -1 .. 10 <: -2 .. 12 &
  10 : 10..99999 & 11 : 10..99999 & 99999 : 10..99999 &
  9 /: 10..99999 & (99999+1)/: 10..99999 & -1 /: 10..99999 &
  card(0..1) = 2 & card(0..0) = 1 & card(1..0) = 0 &
  card(99..-99)=0 &
  !x.(x:1..99 => ( x:5..10 <=> (x>=5 & x<=10) ) ) &
  !z.(z:1..49 => !x.(x:1..50 => ( x:5..z <=> (x>=5 & x<=z) ) )) &
  1..9999 = 1..9999 &
  2..9999 \/ {1} = 1..9999 &
  2..9999 \/ {1} /= 1..9998 &
  #(x,y).( ((1..10000)\/{-1}) - {-1} = x..y) & /* check quick comparison between interval & AVL */
  (1..10000)\/{0} = 0..10000 &
  (1..10000)\/{-1} /= 0..10000 &
  ((1..10000) - {250}) /= 1..10000 &
  (1..999999) \/ {0,2} = 0..999999 &
  (1..999999) \/ {2,4,55} = 1..999999 &
  (1..999999) \/ {0,2,77,999999+1} = 0..1000000 &
  (1..999999) \/ {30,2,77,999999+1} = 1..1000000 &
  {0} \/ NATURAL1 = NATURAL &
  (0..1000) \/ NATURAL1 = NATURAL &
  NATURAL \/ NATURAL1 = NATURAL &
   1..1000 \/ NATURAL1 = NATURAL1 &
   NATURAL1 \/ INTEGER = INTEGER &
   NATURAL1 \/ {0,3,4,77} = NATURAL &
   NATURAL1 \/ {0,3,4,77} /= NATURAL1 &
   {-1} \/ INTEGER = INTEGER &
   INTEGER \/ -100..100 = INTEGER &
   NAT \/ NATURAL1 = NATURAL &
   #(i1,i2).(i1..i2 = {1024,1026,1025,1027}) &
   #(j1,j2).({1024,1026,1025,1027,1028} = j1..j2) &
   #(k1,k2).(k1..k2 = {1024}) &
   /* #(i1,i2).(i1..i2 = {}) & */
   !(ii1,ii2).(ii1:INTEGER & ii2:INTEGER => ii1..ii2 /= {1024,1026,1027}) &
   {x1|x1:NAT & x1>0} = NAT1 & {x2|x2:NAT & x2>=1} = NAT1 &
   {x1|x1:NATURAL & x1>0} = NATURAL1 & {x2|x2:NATURAL & x2>=1} = NATURAL1 &
   {x1|x1:NATURAL & x1>-1} = NATURAL &
   {x3|x3:NATURAL & x3<MAXINT} = NAT - {MAXINT} &
   #yy.({x4|x4:NATURAL & x4<yy} = 0..1024) & /* should instantiate yy to 1025 */
   /* not(#yy.({x4|x4:NATURAL & x4<yy} = 1..1024)) & still enumerates */
   {x,y | x:0..3 & y:1..3 & not(not(x..y <<: 1..2))} = {1|->1, 2|->2, 2|->1, 3|->1, 3|->2} &
   {x,y | x:0..4 & y:1..3 & not(x..y <: 1..4)} = {0}*(1..3) &
   {x,y | x:0..3 & y:1..3 & not(x..y <: 1..2)} = {0}*(1..3) \/ (1..3)*{3} &
   {x,y | x:100..103 & y:101..103 & not(x..y <: 101..102)}  = {100}*(101..103) \/ (101..103)*{103} &
   {x,y | x:100..103 & y:101..103 & not(x..y <<: 101..102)}  = {(101|->102)} \/ {100}*(101..103) \/ (101..103)*{103} &
   /* sets containing intervals */
    {1..1000} = { {x|x: 1..1000 & x mod 2 = 0} \/ {x|x: 1..1000 & x mod 2 = 1} }  &
    card({ (1..1000) , ({x|x: 1..1000 & x mod 2 = 0} \/ {x|x: 1..1000 & x mod 2 = 1})}) = 1 &
    card({ii|#nn.(nn:601..609 & ii=1..nn)} \/ {1..610}) = 10 &
    card({ii|#nn.(nn:601..609 & ii=1..nn)} \/ {1..610} \/
        {({x|x: 1..605 & x mod 2 = 0} \/ {x|x: 1..605 & x mod 2 = 1})} ) = 10 &
    ({x|x: 1..605 & x mod 2 = 0} \/ {x|x: 1..605 & x mod 2 = 1}) : {ii|#nn.(nn:601..609 & ii=1..nn)} &

  { (1,2), (3,4), (4,4), (1024,1025), (0,0) } [ NATURAL1 ] = {2,4,1025} &
  { (1,2), (3,4), (4,4), (-1 ,33),(1,22) } [ {x|x<2} ] = {2,22,33} &
  { (1,2), (3,4), (4,4), (-1 ,33),(1,22) } [ 3..10000000 ] = {4} &
  { (1,2), (3,4), (4,4), (1024,1025) } [ INTEGER ] = {2,4,1025} &

  /* complement sets */
  2 /: INTEGER - {2} & 3 : INTEGER - {2} & 333333 : INTEGER - {2} &
  MAXINT+2 : INTEGER - {0,1} &
  MAXINT : INTEGER - (0..MAXINT) \/ {MAXINT} &
  MAXINT-1 /: INTEGER - (0..MAXINT) \/ {MAXINT} &
  2 /: (((INTEGER - {2}) - {3}) - {4}) &
  3 /: (((INTEGER - {2}) - {3}) - {4}) &
  4 /: (((INTEGER - {2}) - {3}) - {4}) &
  1 :  (((INTEGER - {2}) - {3}) - {4}) &
  3 :  (((INTEGER - {2}) - {3}) - {4}) \/ {1,3} &
  333333 :  (((INTEGER - {2}) - {3}) - {4}) \/ {1,3} &
  { 1|->2 , 2|->3, 3|->4} |> (INTEGER - {3}) = {1|->2, 3|->4} &
 (INTEGER - {3}) <| { 1|->2 , 2|->3, 3|->4} = {1|->2, 2|->3} &
 (INTEGER - {2}) <: INTEGER &
   {x| x/: {1,2,10000}} \/ {2} = {z|z/:{1,10000}} &
  {x| x/: {1,2,10000}} \/ {2} /= {z|z/:{1,10000,2}} &
  {x| x/: {1,2,10000}} \/ {10000} /= {z|z/:{1,10000,2}} &
  {b | b=TRUE <=> {x| x/: {1,2,10000}} \/ {10000} /= {z|z/:{1,10000,2}}} = {TRUE} &
  {x| x/: {1,2,10000}} \/  {z|z/:{10000,2,3}} = {w|w/:{2,10000}} &
  1..1000 \/  {z|z/:{10000,2,3}}  = {ww|ww/:{10000}} &
  1..1000 \/  {z|z/:{10000,2,3}}  = {ww|ww/=10000} &
   {1,3,9999} \/  {z|z/:{10000,2,3}}  = {ww|ww/:{2,10000}} &

 /* some infinite sets; should be detected as such by ProB */
  1024 : {n|n : NATURAL & n > 0}  &
  1024 : {n|n : NATURAL1 & n > 133}  &
  133 /: {n|n : NATURAL1 & n > 133}  &
  0 /: {n|n : NATURAL & n > 0}  &
  -200 : {xx| xx<10} &
  200 : {zz| zz>100} &
  {zz|zz>100} /= {} &
  card({x|x : NATURAL1 & x < 10024}) = 10023 &
  {x|x : NATURAL1 & x < 10024} = 1..10023 &
  {x|x : NATURAL1 & x > 10024 & x <= 22222} = 10025..22222 &
  {x|x : NATURAL & x >= 10024 &  22222 >= x } = 10024..22222 &
  2048 : {x|x:NATURAL & x>2047 & x<100000} &
  {x|x:NATURAL & x>2047 & x<100000} /\ {y|y<4096} = 2048..4095 &

  %x.(x:NATURAL|x+1) : NATURAL --> INTEGER &
  %x.(x:NATURAL1|x+1) : NATURAL +-> INTEGER &
  %x.(x:NATURAL1|x*x)[{200}] = {40000} &
  %x.(x:NATURAL1|x*x)[{0}] = {} &

  {xx|xx<2000} /\ {vv|vv<1000} = {ww|ww<1000} &
  {xx|xx<2000} \/  {vv|vv<1000} = {ww|ww<2000} &
  {xx|xx<2000} \/  {vv|vv<1000} /= {ww|ww<1000} &
  {xx|xx<2000} /\  {vv|vv>1000} = 1001..1999 &
  {xx|xx<2000} \/ 1000..3000 = {vv|vv<3001} &
  1000..3000 \/ {xx|xx<2000} = {vv|vv<=3000} &
  1000..3000 \/ {xx|xx>2000} = {vv|vv>999} &

  NATURAL1 /\ {-(2**40),0,2**40} = {2**40} &
  NATURAL1 /\ {2**40} = {2**40} &
  NATURAL1 /\ {} = {} &
  NATURAL1 /\ {-(2**40)} = {} &
   {-(2**40),-1,0}  /\ NATURAL1 = {} &
  {-(2**40),0,2**40} /\ NATURAL1 = {2**40} &
  {xx|xx>101} /\ {-(2**40),0,101,2**40} = {2**40} &
  {-(2**40),0,101,2**40} /\ {xx|xx>101} = {2**40} &

  card( %(x,y).(x:NATURAL1 &y:NATURAL1|x*y) /\ %(y,x).(y:-20000..50 & x:-100..50|x*y)) = 2500 &

  /* cardinality of functions/relations */
  card((1..10) --> (5..6)) = 1024 &
  (card(((1..10) --> (5..6)) - {%uu.(uu:1..10|5)}) = 1023) &
  card((1..3) >+> (5..6)) = 13 &
  (card(((1..3) >+> (5..6)) \/ {%uu.(uu:1..3|5)}) = 14) &
  card((1..3) >-> (5..6)) = 0 &
  (card(((1..3) >-> (5..6)) \/ {%uu.(uu:1..3|5)}) = 1) &

  /* the union {0|->0} forces expansion and compares symbolic calculation against enumeration */
  (card(((1..3) <-> (5..4)) \/ { {0|->0} }) = 1+ card((1..3) <-> (5..4))) &
  (card(((1..4) +-> (5..7)) \/ { {0|->0} }) = 1+ card((1..4) +-> (5..7))) &
  (card(((1..1) +-> (5..7)) \/ { {0|->0} }) = 1+ card((1..1) +-> (5..7))) &
  (card(((1..3) +-> (5..4)) \/ { {0|->0} }) = 1+ card((1..3) +-> (5..4))) &
  (card(((1..3) --> (5..4)) \/ { {0|->0} }) = 1+ card((1..3) --> (5..4))) &
  (card(((1..3) -->> (5..4)) \/ { {0|->0} }) = 1+ card((1..3) -->> (5..4))) &
  (card(((1..4) >+> (5..7)) \/ { {0|->0} }) = 1+ card((1..4) >+> (5..7))) &
  (card(((1..1) >+> (5..7)) \/ { {0|->0} }) = 1+ card((1..1) >+> (5..7))) &
  (card(((1..4) >+> (5..5)) \/ { {0|->0} }) = 1+ card((1..4) >+> (5..5))) &
  (card(((1..4) >+> (5..4)) \/ { {0|->0} }) = 1+ card((1..4) >+> (5..4))) &
  (card(((1..4) >-> (2..7)) \/ { {0|->0} }) = 1+ card((1..4) >-> (2..7))) &
  (card(((1..4) >+>> (2..7)) \/ { {0|->0} }) = 1+ card((1..4) >+>> (2..7))) &
  (card(((1..4) >->> (2..7)) \/ { {0|->0} }) = 1+ card((1..4) >->> (2..7))) &
  (card(((1..4) >->> (2..5)) \/ { {0|->0} }) = 1+ card((1..4) >->> (2..5))) &
  !(n,m).(n:0..3 & m:4..6 =>
     (card(((1..n) <-> (5..m)) \/ { {0|->0} }) = 1+ card((1..n) <-> (5..m))) &
     (card(((1..n) +-> (5..m)) \/ { {0|->0} }) = 1+ card((1..n) +-> (5..m))) &
     (card(((1..n) --> (5..m)) \/ { {0|->0} }) = 1+ card((1..n) --> (5..m))) &
     (card(((1..n) >+> (5..m)) \/ { {0|->0} }) = 1+ card((1..n) >+> (5..m))) &
     (card(((1..n) >-> (5..m)) \/ { {0|->0} }) = 1+ card((1..n) >-> (5..m))) &
     (card(((1..n) -->> (5..m)) \/ { {0|->0} }) = 1+ card((1..n) -->> (5..m))) &
     (card(((1..n) >+>> (5..m)) \/ { {0|->0} }) = 1+ card((1..n) >+>> (5..m))) &
     (card(((1..n) >->> (5..m)) \/ { {0|->0} }) = 1+ card((1..n) >->> (5..m)))  ) &
  card(1..10 -->> 1..2) = 1022 &
  card(1..10 +->> 1..1) = 1023 &
  card(1..6 >+>> 1..4) = 360 &
  card({}+->INTEGER) = 1 &
  card(INTEGER +-> {}) = 1 &
  card({} --> INTEGER) = 1 &
  card(INTEGER --> {}) = 0 &
  card({} +->> INTEGER) = 0 &
  card(INTEGER +->> {}) = 1 &
  card({} -->> INTEGER) = 0 &
  card(INTEGER -->> {}) = 0 &
  card({}>+>INTEGER) = 1 &
  card(INTEGER >+> {}) = 1 &
  card({}>->INTEGER) = 1 &
  card(INTEGER >-> {}) = 0 &
  card({}>->>INTEGER) = 0 &
  card(INTEGER >->> {}) = 0 &

  /* Arithmetic with Boolean connectives to exercise b_interpreter_check */

  !x.(x:0..3 =>  (x<3 <=> x<=2)) &
  !x.(x:0..3 =>  (x<=2 <=> x<3)) &
  !x.(x:0..3 =>  (x>2 <=> x>=3)) &
  !x.(x:0..3 =>  (x>=3 <=> x>2)) &
  !x.(x:0..3 =>  (x>3 <=> 1=2)) &
  !x.(x:0..3 =>  (x>0 <=> x/=0)) &
  #x.(x:0..3 &  (x<3 <=> 1=2)) &
  #x.(x:0..3 &  (1=2 <=> x<3)) &
  #x.(x:0..9 & ((x<5 & x>3) <=> 1=1))  &
  #x.(x:0..9 & ((x>8 or x<0) <=> 1=1))  &
  #x.(x:0..9 & ((x<=4 & x>=4) <=> 1=1))  &
  #x.(x:0..9 & ((x>=9 or x<=-1) <=> 1=1))  &
  #x.(x:0..9 & ((x<9 or x>9) <=> 1=2))  &
  #x.(x:0..9 & ((x<=8 or x>=10) <=> 1=2))  &

  /* Sequences */
  s = [p1,p2,p3] &
  s : seq(PROC) &
  s = {1|->p1, 3|->p3, 2|->p2} &
  2|->p2 : s & 2|->p1 /: s & {3|->p3} <<: s & {3|->p3} <: s & s<:s &  s/<<:s &
  ran(s) = PROC & dom(s) = 1..3 &
  s: seq1(PROC) & s:iseq(PROC) & s:iseq1(PROC) & s: perm(PROC) &
  s /: seq({p1}) & {2|->p1} /: seq(PROC) & {} : seq(PROC) & {1 |-> p1, 1|-> p2} /: seq(PROC) &
  s /: iseq({p1}) & [p1,p1] /: iseq(PROC) & {2|->p1} /: iseq({p1}) & {} : iseq({p1}) &
  {} : iseq({}) & {} : seq({}) & [] = {} & {} = [] &
  s /: iseq1({p1}) & [p1,p1] /: iseq1(PROC) & {2|->p1} /: iseq1({p1}) & {} /: iseq1({p1}) &
  s /: perm({p1}) & [p1,p1] /: perm({p1}) & {2|->p1} /: perm({p1}) & {} /: perm({p1}) &
  [p1,p2] /: perm(PROC) & [p3,p2,p1] : perm(PROC) &
  [p1] : perm({p1}) &
  <> : perm({}) &
  card(perm({})) = 1 &
  card(perm({p1})) = 1 &
  card(perm({p1,p2})) = 2 &
  card(perm({p1,p2,p3})) = 6 &
  card(perm(1..10)) = 3628800 &
  <> : iseq({}) &
  card(iseq({})) = 1 &
  card(iseq({p1})) = 2 &
  card(iseq({p1,p2})) = 5 &
  card(iseq({p1,p2,p3})) = 16 &
  iseq({p1,p2,p3}) = iseq1({p1,p2,p3}) \/ {{}} &
  card(iseq1({p1,p2,p3}) \/ {{}}) = 16 &
  iseq({p1,p2}) = { {}, [p1],[p2],[p1,p2],[p2,p1] } &
  iseq1({p1,p2}) = { [p1],[p2],[p1,p2],[p2,p1] } &
  card(iseq(1..4)) = 65 &
  card(iseq(1..5)) = 326 &
  card(iseq(1..6)) = 1957 &
  card(iseq1(1..3) \/ {{}}) = 16 &
/*  card(iseq1(1..6) \/ {{}}) = 1957 &  (only works if MAXINT set to at least 6) */
  card(iseq(1..7)) = 13700 &
  card(iseq1({})) = 0 &
  card(iseq1({p1})) = 1 &
  card(iseq1({p1,p2})) = 4 &
  card(iseq1({p1,p2,p3})) = 15 &
  card(iseq1(1..6)) = 1956 &
  <> : seq({}) &
  card(seq({})) = 1 &
  card(seq1({})) = 0 &
  [p1] = {1|->p1} &
  [] : perm({}) &
  size(s) = 3 &
  first(s) = p1 & last(s) = p3 &
  front(s) = [p1,p2] &
  tail(s) = [p2,p3] &
  s = [p1]^[p2,p3] & s = [] ^ s & s = s ^ [] &
  s = [p1,p2] ^ [p3] &
  rev(s) = [p3,p2,p1] &
  s = rev(rev(s)) &
  conc([[p1],[],[p2],[p3],[]]) = s &
  conc([[],[],[p1,p2],[],[p3],[]]) = s &
  conc([s]) = s &
  conc([]) = [] &
  s /|\ 1 = [p1] & s /|\ 2 = [p1,p2] & s /|\ 3 = s & s /|\ 0 = [] & /* allowed in Atelier B: s /|\ 4 = s & */
  s \|/ 0 = s &  s \|/ 1 = [p2,p3] &  s\|/ 2 = [p3] & s\|/3 = [] &  /* not allowed: s \|/ 4 = [] & */
  s = (p1 -> [p2]) <- p3 & s = p1 -> ([p2] <- p3) &
  ([1,2,3,4,5,6] ; pred) = [0,1,2,3,4,5] & /* test that we can apply infinite function to set */
  ([1001,1002,1003,1004,1005,1006] ; pred ; pred) = [999,1000,1001,1002,1003,1004] &
  ([1001,1002,1003,1004,1005,1006] ; %x.(x:INTEGER|x+x)) = [2002,2004,2006,2008,2010,2012] &

  /* image of infinite functions */
  pred[1..100] = 0..99 &
  succ[1..100] = 2..101 &
  SIGMA(y).(y:%x.(x:INTEGER|x*x)[1..10]|y) = 385 &
  SIGMA(y).(y:%x.(x:INTEGER|x*x)[1..100]|y) = 338350 &
  %x.(x:INTEGER|x*x)[-2..2] = {0,1,4} &
  max(%x.(x:INTEGER|x*x)[-20..100]) = 10000 &
  %i.(i:INTEGER|i/2)[pred[ran(%i.(i:1..30|i*2) ; succ)]] = 1..30 &
  %i.(i:NATURAL1|1000/i)[-1..10] = {100,111,125,142,166,200,250,333,500,1000} &
  ([3,2,1,0,-1] ; %i.(i:NATURAL1|1000/i)) = [333,500,1000] &

  /* other infinite functions checks */
  %x.(x:INTEGER|{x}) : INTEGER --> POW(INTEGER) &
  %x.(x:1..99999|{x}) : 1..99999 --> POW(INTEGER) &
  %x.(x:INTEGER|{x|->x}) : INTEGER --> (INTEGER <-> INTEGER) &
  %x.(x:1..99999|{x|->x}) : 1..99999 --> (INTEGER <-> INTEGER) &

   POW(NATURAL1) <: POW(NATURAL) &
   POW1(NATURAL1) <: POW(NATURAL) &
   FIN(NATURAL1) <: POW(NATURAL) &
   FIN(NATURAL1) <: POW(NATURAL1) &
   FIN1(NATURAL1) <: FIN(NATURAL) &
   POW(POW(NATURAL1)) <: POW(POW(NATURAL)) &
   POW(POW(NATURAL)) /<: POW(POW(NATURAL1)) &
   FIN(POW1(NATURAL)) /<: FIN1(POW1(INTEGER)) &

   /* some finite checks */
   {x|x:10..100 or x<3} /: FIN(INTEGER) &
   {x|x:10..100 or x:200..30000} : FIN(INTEGER) &

   /* some other checks */
   #e.(e : {1|->2, 2|->3} & prj1(INTEGER,INTEGER)(e)=2) &
   card({e|e : {1|->2, 2|->3, 2|->4} & prj1(INTEGER,INTEGER)(e)=2 }) = 2 &
   {s1,s2|s1 |-> s2 : {(1,2),(2,3),(3,5)} &
     bool({(1,100)}(["VIA_1"]~(["VIA_1","VIA_1","VIA_1"](s1))) <= {(1,700)}(["VIA_1"]~(["VIA_1","VIA_1","VIA_1"](s1)))) =
      bool([0,100,200,300,400,500,600,700](s1) <= [0,100,200,300,400,500,600,700](s2))}
     = [2,3,5] &
    {a,b | a:2..5 & b:1..4 & (a>=b <=> a=2*b)} =
       {(2,1),(4,2),  (2,3),(2,4),(3,4) } &
    {a,b | a:2..5 & b:1..4 & bool(a>=b) = bool(a=2*b)} =
       {(2,1),(4,2),  (2,3),(2,4),(3,4) } &
    {a,b | a:2..5 & b:1..4 & bool(a<b) /= bool(a=2*b)} =
       {(2,1),(4,2),  (2,3),(2,4),(3,4) } &
    {S|#(a,b,c,d).(S={(a,b),(c,d)} & {a,c} = 1..2 & {b,d} = 33..34)} =
       {{(1|->33),(2|->34)},{(1|->34),(2|->33)}} &

  /* some performance tests */
  {x|#(y,v).(x={y,v,3,2,1} & 1 /: x & y:0..2**15 & v:0..2**15)} = {} /* ensure that we detect 1:x straight away without enumerating y,v */
  &
  {x,S,S2|x:S & S<:1..213 & S \/ {x} = S2 & x/: S2} = {}  /* check that we detect impossibility directly */
  &
  {n| #x.(x<:(BOOL*BOOL*BOOL) & card(x)=n)} = 0..8
  &
  card({f|f: BOOL*BOOL +-> 1..10 & ran(f) <: 3..(card(f))}) = 21 &
  {f|f: BOOL*BOOL +-> 1..10 & ran(f) <: 4..(card(f))} =
     {{},{((FALSE|->FALSE)|->4),((FALSE|->TRUE)|->4),((TRUE|->FALSE)|->4),((TRUE|->TRUE)|->4)}} &
  {f,n|f: 1..3 >->> 1..n} =
     {([2,1,3]|->3),([3,1,2]|->3),([1,2,3]|->3),
      ([3,2,1]|->3),([1,3,2]|->3),([2,3,1]|->3)} &
  card({f,n,g,m| f:2001..n >->> POW(BOOL) & g:1000..m >->> dom(f)}) = 24*24 &
  {f,n,g,m| f:2001..n >->> BOOL & g:1000..m >->> dom(f) & (g;f) : dom(g) >->> BOOL}
    = {((({(2001|->FALSE),(2002|->TRUE)}|->2002)|->{(1000|->2001),(1001|->2002)})|->1001),
       ((({(2001|->FALSE),(2002|->TRUE)}|->2002)|->{(1000|->2002),(1001|->2001)})|->1001),
       ((({(2001|->TRUE),(2002|->FALSE)}|->2002)|->{(1000|->2001),(1001|->2002)})|->1001),
       ((({(2001|->TRUE),(2002|->FALSE)}|->2002)|->{(1000|->2002),(1001|->2001)})|->1001)} &
  {on,sol|on = {"o"|-> %x.(x:1..7|8-x), "d"|->{}, "m" |->{}} &
          sol = {d,f,t|on(f)/={} & t/=f & on(t)={} &
                 d=last(on(f))}} =
  {({("d"|->{}),("m"|->{}),("o"|->[7,6,5,4,3,2,1])}|->{((1|->"o")|->"d"),((1|->"o")|->"m")})}&
  {on,sol|on = {"o"|-> %x.(x:1..7|8-x), "d"|->{}, "m" |->{}} & sol = {d,f,t|on(f)/={} & t/=f & on(t)={} & d=on(f)(card(on(f)))}} =
  {({("d"|->{}),("m"|->{}),("o"|->[7,6,5,4,3,2,1])}|->{((1|->"o")|->"d"),((1|->"o")|->"m")})} &
{x| {{{{{{{{{{{{{{{{{{{{{{x}}}}}}}}}}}}}}}}}}}}}}={{{{{{{{{{{{{{{{{{{{{{1}}}}}}}}}}}}}}}}}}}}}}} = {1} &
{x| {{{{{{{{{{{{{{{{{{{{{{x}}}}}}}}}}}}}}}}}}}}}}<:{{{{{{{{{{{{{{{{{{{{{{{1}}}}}}}}}}}}}}}}}}}}}}}} = {{1}} &
{x,y| x=bool(bool(y=x)=bool(y=TRUE or y=FALSE))} = {x,y|x:BOOL & y=TRUE} &
{z| bool(bool(z:1..20)=bool(3*3=9)) = bool(bool(z:5..6)=bool(1+1=2)) & bool(z:0..21) = bool(2+2=4)} = {0,5,6,21} &
{x,n|x:1..n-->BOOL & !i.(i:1..(n-2) => (x(i)=TRUE <=> (x(i+1)=FALSE & x(i+2)=FALSE)))
     & n=32 & x(1)=FALSE} =
    {([FALSE,FALSE,TRUE,FALSE,FALSE,TRUE,FALSE,FALSE,TRUE,FALSE,FALSE,TRUE,FALSE,
       FALSE,TRUE,FALSE,FALSE,TRUE,FALSE,FALSE,TRUE,FALSE,FALSE,TRUE,FALSE,
       FALSE,TRUE,FALSE,FALSE,TRUE,FALSE,FALSE]|->32),
    ([FALSE,TRUE,FALSE,FALSE,TRUE,FALSE,FALSE,TRUE,FALSE,FALSE,TRUE,
      FALSE,FALSE,TRUE,FALSE,FALSE,TRUE,FALSE,FALSE,TRUE,FALSE,
      FALSE,TRUE,FALSE,FALSE,TRUE,FALSE,FALSE,TRUE,FALSE,FALSE,TRUE]|->32)} &

 tail({v,r|v:1..10 & r={y|y:1..10 & #z.(z:{y,y+1} & z>v)}} ) =
    [{2,3,4,5,6,7,8,9,10},{3,4,5,6,7,8,9,10},{4,5,6,7,8,9,10},
     {5,6,7,8,9,10},{6,7,8,9,10},{7,8,9,10},{8,9,10},{9,10},{10}]
ASSERTIONS
  {{1,2},{2,1}} = {{1,2}};
  card({{1,2},{2,3}}) = 2
VARIABLES f
INVARIANT f: PROC +-> PROC
INITIALISATION f:= {}
OPERATIONS
 ovrid1(p) = PRE p:PROC THEN f(p) := p END;
 ovrid2(p) = PRE p:PROC THEN f(p) := p2 END;
 res <-- GetInter = BEGIN res := inter({d,cd}) END;
 res <-- become_such(p) = PRE p:PROC & p=p1 THEN res : (res/=p) END
END
