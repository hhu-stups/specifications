MACHINE EulerWayModelCheck
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
 Nd == 1..5;
 GOAL == Edges={} /* we have used up all edges */
CONSTANTS BaseEdge
PROPERTIES
 BaseEdge = {(1,2),(1,3),(1,4),(2,4),(2,3),(3,4),(3,5),(4,5)}
VARIABLES State, Edges
INVARIANT  State : Nd & Edges <: BaseEdge
INITIALISATION State :: Nd || Edges := BaseEdge
OPERATIONS
 Step(i) = PRE State|->i: Edges THEN State,Edges := i,Edges-{State|->i} END;
 StepInv(i) = PRE i|->State: Edges THEN State,Edges := i,Edges-{i|->State} END
END

