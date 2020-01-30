MACHINE EulerWayDisjunction
/* a version of EulerWay using a disjunction instead of a set membership */
/* B version is much shorter than Formula version; 
   Initially performance of ProB was disappointing (53 secs)
   Is now solved in 0.150 seconds (Feb. 2014; ProB 1.3.7-beta10) or even 0.080 seconds (Feb. 28, 2014)

It seems that commit r12434 solved the intial performance problem:
  r12434 | leuschel | 2012-11-19 15:32:00 +0100 (Mon, 19 Nov 2012) | 5 lines
Changed paths:
   M /trunk/prolog/examples/B/Laws/ExplicitComputations.mch
   M /trunk/prolog/examples/B/Laws/ExplicitComputationsCLPFD.mch
   M /trunk/prolog/src/bsets_clp.pl
   M /trunk/prolog/src/custom_explicit_sets.pl
   M /trunk/prolog/src/inf_arith.pl
   M /trunk/prolog/src/kernel_objects.pl

improved propagation for cardinality (Peano version); now also works backwards
added cardinality test for total_bijection (domain, range same cardinality),
remove_element now does a quick element propagation check when it delays
expressions like {f,m,n|f: 1..m >->> 2..n & n:3..4} can now be solved without enumeration

*/
/*
 From http://www.riseforfun.com/Formula:

  This Formula specificatin models a problem in graph theory. It tries to find 
  a Eulerian trail within a specified graph. The problem is to find a trail through 
  the graph with the following properties:
  
  - all edges in the graph must be used
  - every edge must be used only once
  
  A well known example of this problem is the so called German "Das-ist-das-Haus-vom-Nikolaus"
  problem, which is modeled within this file.


domain EulerWay
{
  BaseEdge ::= (x:PosInteger, y:PosInteger).
  SolutionEdge ::= (pos:PosInteger, x : PosInteger, y : PosInteger).
  
  // Make sure we have used all BaseEdge terms in the solution
  usedBaseEdge ::= (x:PosInteger, y:PosInteger).
  usedBaseEdge(x,y) :- BaseEdge(x,y), SolutionEdge(_,x,y).
  usedBaseEdge(x,y) :- BaseEdge(x,y), SolutionEdge(_,y,x).
  unusedBaseEdge := BaseEdge(x,y), fail usedBaseEdge(x,y).

  // Make sure our index values are one based and not bigger than the number of base edges
  indexTooBig := SolutionEdge(x,_,_), x > count(BaseEdge(_,_)).
 
  // Make sure that no index is used twice
  doubleIndex := s1 is SolutionEdge, s2 is SolutionEdge, s1 != s2, s1.pos = s2.pos.
  
  // Exclude edges that don't line up
  //wrongSequence := SolutionEdge(x, Edge(_,b)), SolutionEdge(y, Edge(c,_)), y = x + 1, b != c.
  wrongSequence := SolutionEdge(pos1,_,y1), SolutionEdge(pos2,x2,_), pos2 = pos1 + 1, y1 != x2.
  
  // Avoid using edges twice
  doubleEdge := SolutionEdge(pos1,x,y), SolutionEdge(pos2,x,y), pos1 != pos2.
  
  // Exclude mirrors of already used edges
  mirrorEdge := SolutionEdge(_,x,y), SolutionEdge(_,y,x).
  
  conforms := !unusedBaseEdge & !indexTooBig & !doubleIndex & !wrongSequence & !doubleEdge & !mirrorEdge.
}


   Nikolaus graph:

     5
    / \
   3---4
   |\ /|
   | X |
   |/ \|
   1---2


partial model nikolaus2 of EulerWay
{
    BaseEdge(1,2)
    BaseEdge(1,3)
    BaseEdge(1,4)
    BaseEdge(2,4)
    BaseEdge(2,3)
    BaseEdge(3,4)
    BaseEdge(3,5)
    BaseEdge(4,5)
    SolutionEdge(1,_,_)
    SolutionEdge(2,_,_)
    SolutionEdge(3,_,_)
    SolutionEdge(4,_,_)
    SolutionEdge(5,_,_)
    SolutionEdge(6,_,_)
    SolutionEdge(7,_,_)
    SolutionEdge(8,_,_)
}
*/
DEFINITIONS
 N == card(BaseEdge); Nd == 1..5;
 inv(Pair) == (prj2(Nd,Nd)(Pair),prj1(Nd,Nd)(Pair));
 con(Pair1,Pair2) == (prj2(Nd,Nd)(Pair1) = prj1(Nd,Nd)(Pair2)) /* check if Pair1 connects to Pair2 */
CONSTANTS BaseEdge, UPath, Path
PROPERTIES
 BaseEdge = {(1,2),(1,3),(1,4),(2,4),(2,3),(3,4),(3,5),(4,5)} &
 UPath : perm(BaseEdge) & 
 Path : 1..N --> (Nd*Nd) &
 !i.(i:1..N => ( Path(i)=UPath(i) or Path(i)=inv(UPath(i))) ) & // now slow with new disjoin_true exponential backoff
 //!i.(i:1..N => ( Path(i) : {UPath(i),inv(UPath(i))} ) ) & // this constraint is much faster
 
 /* cycle: !i.(i:1..N => con(Path(i),Path((i+1) mod N))) & */
 !i.(i:1..(N-1) => con(Path(i),Path(i+1))) 

/*
 &
 Path = [(1,3),(3,2),(2,1),(1,4),(4,3),(3,5),(5,4),(4,2)] */
END

