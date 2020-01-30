MACHINE Parse  /* A simple form of the SleepSet machine */
	
CONSTANTS 
  Trans, Initial,RelTrans, RelClosure, Reachable

SETS
  Nodes  = {n1,n2,n3,n4}; 
  Labels  = {la,lb,lc} 

DEFINITIONS
   LTS1 == ( Trans = { n1 |-> {la |-> {n2}, lb|-> {n3}, lc |-> {} },
                      n2 |-> {la |-> {}, lb|-> {n1}, lc |-> {n2}},
                      n3 |-> {la |-> {}, lb|-> {n3}, lc |-> {n1}},
                      n4 |-> {la |-> {}, lb|-> {}, lc |-> {}}  }   );
   LTS3 == ( Trans = { n1 |-> {la |-> {n2}, lb|-> {n3}, lc |-> {} },
                      n2 |-> {la |-> {}, lb|-> {n4}, lc |-> {n2}},
                      n3 |-> {la |-> {}, lb|-> {n3}, lc |-> {n4}},
                      n4 |-> {la |-> {}, lb|-> {}, lc |-> {}}  }   );
/*
  LTS2 == ( Trans = { n1 |-> {la |-> {n2}, lb|-> {n3}, lc |-> {} },
                      n2 |-> {la |-> {}, lb|-> {}, lc |-> {}},
                      n3 |-> {la |-> {n4}, lb|-> {}, lc |-> {}},
                      n4 |-> {la |-> {}, lb|-> {}, lc |-> {n4}}  }  )*/
  Unreachable == (Nodes - Reachable)
PROPERTIES
  Trans: (Nodes --> (Labels --> POW(Nodes)))  &  /* non deterministic LTS */
  Initial : Nodes & /* initial = one node finite subset of nodes */
  RelTrans:(Nodes <-> Nodes)  & 
	(RelTrans={x,y | x:Nodes & y:Nodes & (#(a).(a:Labels & (y:Trans(x)(a))))}) &
  RelClosure:(Nodes <->Nodes) &
     (RelClosure = closure1(RelTrans) \/ id(Nodes)) &
  Reachable: POW(Nodes) & 
  Reachable = {Initial} \/ closure1(RelTrans)[{Initial}] &
  Reachable = RelClosure[{Initial}] &
  (!(rr,ll).((rr:Reachable & ll:Labels) => Trans(rr)(ll)<:Reachable)) &
  /* (Reachable = {Initial} \/ ran({Initial}<|closure1(RelTrans))) & */
  (LTS1 or LTS3) &
  Initial = n1
VARIABLES
  ParseTable, CurNode,  CurOpsToTreat, Stack, Finished

INVARIANT
  ParseTable:POW(Nodes)  &
  CurNode:Nodes  & CurOpsToTreat: POW(Labels) &
  Stack:POW(Nodes) &
  Finished:BOOL &
  ParseTable<:Reachable &
  Stack<:Reachable &
  (Finished=TRUE => ParseTable = Reachable) &
  CurNode:Reachable
  
  &
  
  Reachable = (ParseTable \/ RelClosure[Stack] \/
               RelClosure[{ nr | nr:Nodes &
                 #co.(co:Labels & co:CurOpsToTreat & nr: Trans(CurNode)(co)) }] )
               
            /*   UNION(co).(co:CurOpsToTreat | Trans(CurNode)(co)) ) */

INITIALISATION
  ParseTable := {} ||
  CurNode := Initial ||
  CurOpsToTreat := {} ||  /* CurOps = {} means CurNode treated */
  Stack := {Initial} ||
  Finished := FALSE

OPERATIONS
  StartProcessNode(n) =
	PRE n:Nodes & CurOpsToTreat={} & n /:ParseTable
		& n : Stack
	THEN
   	 CurNode := n ||
 	 Stack := Stack-{n} ||
	 CurOpsToTreat := {l|l:Labels & Trans(n)(l) /= {} }  ||
    	 ParseTable := ParseTable \/ {n}
 	END;

  ProcessTransition(t) = PRE t:CurOpsToTreat THEN
    CurOpsToTreat := CurOpsToTreat - {t} ||
    Stack := Stack \/ (Trans(CurNode)(t) - ParseTable)  
	 END;
 
  Finish = PRE CurOpsToTreat={} & Stack = {} THEN
    Finished := TRUE
   END
END
