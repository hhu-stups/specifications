MACHINE CheckLargeGraphIsomorphismAsConstants
/* A machine where we use ProB to check if two graphs are isomorphic */
/* There is exactly one permutation: mapping node 1 to node 5 */
/*
This is an adapted version of the model CheckLargeGraphIsomorphismAsConstants, where with version 1.6.1-rc:
  Mx ProB         Kodkod
  40 0.140 sec    out of memory with defaults, 19 seconds with glucose, 1 solution, symmetry=20

Here, with the KODKOD as external function solving is much better:
Mx==40:
Kodkod Statistics: 334 ms translation, 42 ms solving, 321363 clauses, 162366 variables, 1600 primary variables
Mx==50:
Kodkod Statistics: 1370 ms translation, 58 ms solving, 627203 clauses, 316206 variables, 2500 primary variables
Mx==60:
Kodkod Statistics: 2192 ms translation, 1391 ms solving, 1083243 clauses, 545346 variables, 3600 primary variables
Mx==70:
Kodkod Statistics: 6199 ms translation, 428 ms solving, 1719483 clauses, 864786 variables, 4900 primary variables
*/
DEFINITIONS
      Mx==40;
      Nodes == 0..(Mx-1);
      RelevantNodes == (dom(graph1)\/dom(graph2)\/ran(graph1)\/ran(graph2));
      
      SET_PREF_TIME_OUT == 6000;
      SET_PREF_KODKOD == FALSE;
      SET_PREF_KODKOD_MAX_NR_SOLS == 1;
      SET_PREF_KODKOD_SAT_SOLVER == "sat4j";
      SET_PREF_KODKOD_SYMMETRY == 20;
      EXTERNAL_PREDICATE_KODKOD(T1,T2) == INTEGER*T1*T2*BOOL;
      KODKOD(ID,Ids,WaitIds,BoolExpr)==BoolExpr=TRUE;
      EXTERNAL_PREDICATE_KODKOD_SOLVE(T1,T2) == INTEGER*T1*T2;
      KODKOD_SOLVE(ID,Ids,WaitIds)==(1=1);
CONSTANTS graph1, graph2,p
PROPERTIES
 graph1: Nodes <-> Nodes &
 graph2: Nodes <-> Nodes &
 graph1 = %x.(x:Nodes|(x+1)mod Mx) \/ {1|->1} &
 graph2 = %x.(x:Nodes|(x+1)mod Mx) \/ {5|->5} &
 KODKOD(1,p,RelevantNodes,bool(p: RelevantNodes >->>RelevantNodes)) &
 !(x,y).(x|->y: graph1 => 
             KODKOD(1,p,graph2,bool(p(x)|->p(y) : graph2))
        )
    &
 !(x,y).(x|->y: graph2 => 
             KODKOD(1,p,graph2,bool(p~(x)|->p~(y) : graph1))
        ) &
  KODKOD_SOLVE(1,p,(graph1,graph2))
ASSERTIONS
 p(1)=5;
 p: RelevantNodes >->>RelevantNodes;
 !(x,y).(x:RelevantNodes & y:RelevantNodes => (x|->y:graph1 <=> p(x)|->p(y) : graph2))
OPERATIONS
 r <-- GetPerm(x) = PRE x:RelevantNodes THEN r:=p(x) END
END