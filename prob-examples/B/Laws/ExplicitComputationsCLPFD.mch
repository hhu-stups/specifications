MACHINE ExplicitComputationsCLPFD
/* Computations that require CLPFD to be on */
SETS
  SA = {aa,bb,cc,dd}
DEFINITIONS SET_PREF_CLPFD == TRUE
CONSTANTS AA, BB, Hundred, Cube, Eight
PROPERTIES
  AA <: SA & BB<: SA &
 !y.(y:SA => (y:AA <=> y/:BB)) & /* check inlining of forall; not really dependent on CLPFD */
  aa:AA & bb:BB & cc:AA & card(AA)=card(BB) &

  {S| S<:1..1000 & !x.(x:S => x>998)} = {{},{999},{999,1000},{1000}} & /* can only be solved efficiently if !x expanded early */

  {x,y| x>y & y:1..100 & x:1..100 & ((x>y+1 & x>y+2) <=> 1=2) & ((x/=10 & x/=11) <=> 1=2)}
  =
  {(10|->8),(10|->9),(11|->9),(11|->10)}
  &

 /* taking square root */
  Hundred:NATURAL1 &
  %x.(x:NATURAL|x*x)(Hundred)=10000 &

  Eight:INTEGER &
  Cube=%x.(x:INTEGER|x*x*x) & Cube(Cube(Eight))=134217728 &
 
 /* a few puzzles */
  {S| S<:1..5 & SIGMA(x).(x:S|x)=14} = {2..5} &
  {stolen| #(coins).(coins = {16,17,23,24,39,40} &
             stolen : coins --> NATURAL & SIGMA(x).(x:coins|stolen(x)*x)=100)}
   = 
  {{(16|->2),(17|->4),(23|->0),(24|->0),(39|->0),(40|->0)}} &

 /* argumentation semantics example */
 {SS| #attack.({2|->1, 3|->2} = attack & 
        SS={S|S <: 1..3 & attack[S] /\ S = {} & attack~[S] <: attack[S]})}
  = {{{},{1,3},{3}}} &

 /* Send More Money puzzle */
 card({ S,E,N,D,M,O,R,Y |  S*1000+E*100+N*10+D + M*1000+O*100+R*10+E = M*10000+O*1000+N*100+E*10+Y & [S,E,N,D,M,O,R,Y]:1..8-->0..9 & card({S,E,N,D,M,O,R,Y})=8}) = 25 &
 /* now when restricting S & M not to be 0 */
 { S,E,N,D,M,O,R,Y |  S*1000+E*100+N*10+D + M*1000+O*100+R*10+E = M*10000+O*1000+N*100+E*10+Y & [S,E,N,D,M,O,R,Y]:1..8-->0..9 & S>0 & M>0 & card({S,E,N,D,M,O,R,Y})=8}
  = 
  {(((((((9|->5)|->6)|->7)|->1)|->0)|->8)|->2)}
&
 card({x|x:POW1(1..1000) & max(x)=5 & min(x)=3}) = 2
 &
 {x| x:1..1000000 & not(x..x+1 <: 0..1000000)} = {1000000}
 &
 {n| #x.(x<:(BOOL*BOOL*BOOL) & card(x)>n) & n>0} = 1..7
 &
 {S,n|S <: POW(BOOL*BOOL*BOOL*BOOL) & card(S) >= n &  n>=0 & (n>2**(2**4) <=> S/={})} = {{}|->0} 
 &
  {f,m,n|f: 1..m >->> 2..n & n:3..4} =
      {(({(1|->2),(2|->3)}|->2)|->3),(({(1|->3),(2|->2)}|->2)|->3),
       (([3,2,4]|->3)|->4),(([4,2,3]|->3)|->4),(([2,3,4]|->3)|->4),
       (([4,3,2]|->3)|->4),(([2,4,3]|->3)|->4),(([3,4,2]|->3)|->4)}
 &
  {f,m,n|f: 1..m >->> 22..n & n:23..24} = 
      {(({(1|->22),(2|->23)}|->2)|->23),(({(1|->23),(2|->22)}|->2)|->23),
      (([23,22,24]|->3)|->24),(([24,22,23]|->3)|->24),(([22,23,24]|->3)|->24),
      (([24,23,22]|->3)|->24),(([22,24,23]|->3)|->24),(([23,24,22]|->3)|->24)}
 &
 {f|#(m,n).(f: 1..m >->> 122..n & n:123..124)} = (1..2 >->> 122..123) \/ (1..3 >->> 122..124)
 &
 {f,m|f: 1000..m >->> BOOL & m:1..1015} =
   {({(1000|->FALSE),(1001|->TRUE)}|->1001),({(1000|->TRUE),(1001|->FALSE)}|->1001)}
  &
  {x|  x = x mod 33 & x = x mod 44} = 0..32 /* ensure that we do not enumerate here */
  &
card({x,y,z|x:1..10000 & z = x/y & z:200..500 & y : 10..15 & (x+250)/(y+1)=z})=1030
  /* cross checked with Kodkod */
&
  {n,m|n..m = {} & m: 1022..10120 & n : 1022..1023} = {(1023|->1022)} &
  {n|n..100 = {}  & 105..n={}} = {101,102,103,104} &
  {m,n|card(m..n) = 4 & m:100..110} = 
      {(100|->103),(101|->104),(102|->105),(103|->106),
       (104|->107),(105|->108),(106|->109),(107|->110),
       (108|->111),(109|->112),(110|->113)} &
  {m,n|card(m..n) = m & m:1000..1002} = {(1000|->1999),(1001|->2001),(1002|->2003)} &
  {n,m|n..m = {} & m..100={} & 103..n={}}  = {(102|->101)}
&
{x,a | max({x-a,a-x}) : {0,1} & x=10000} = {(10000|->9999),(10000|->10000),(10000|->10001)}
&
 1=1
ASSERTIONS
 AA = {aa,cc};
 BB = {bb,dd};
 Hundred = 100;
 Eight = 8
END
