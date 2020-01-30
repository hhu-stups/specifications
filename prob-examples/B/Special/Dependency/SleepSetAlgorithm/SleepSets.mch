MACHINE SleepSets
USES LTS
DEFINITIONS
  SLEEP == POW(Labels);
  LTS1 == ( Trans = { n1 |-> {la |-> {n2}, lb|-> {n3}, lc |-> {} },
                      n2 |-> {la |-> {}, lb|-> {n1}, lc |-> {n2}},
                      n3 |-> {la |-> {}, lb|-> {n3}, lc |-> {n1}},
                      n4 |-> {la |-> {}, lb|-> {}, lc |-> {}}  }   );
  LTS2 == ( Trans = { n1 |-> {la |-> {n2}, lb|-> {n3}, lc |-> {} },
                      n2 |-> {la |-> {}, lb|-> {}, lc |-> {}},
                      n3 |-> {la |-> {n4}, lb|-> {}, lc |-> {}},
                      n4 |-> {la |-> {}, lb|-> {}, lc |-> {n4}}  }  )
CONSTANTS Indep
PROPERTIES Indep: Labels <-> Labels & Indep~ = Indep & id(Labels) /\ Indep = {} &
/* Machine not yet correct: requirements about Indep needs to be made stronger */
   LTS2
VARIABLES
  SleepTable, CurNode, CurSleep, CurOpsToTreat, Stack, Finished
INVARIANT
  SleepTable: Nodes +-> SLEEP &
  CurNode: Nodes & CurSleep: SLEEP & CurOpsToTreat: POW(Labels) &
  Stack: Nodes <-> SLEEP &
  Finished:BOOL &
  (Finished=TRUE => dom(SleepTable) = Nodes)
INITIALISATION
  SleepTable := {} ||
  CurNode := n1 ||
  CurSleep := {} ||
  CurOpsToTreat := {} ||  /* CurOps = {} means CurNode treated */
  Stack := {n,s| n:Nodes & n:Initial & s:POW(Labels) & s={}} ||
  Finished := FALSE
OPERATIONS
  StartProcessNode(n) = PRE n:Nodes & CurOpsToTreat={} & n:dom(Stack) &
    n /:dom(SleepTable) THEN
    CurNode := n ||
    CurSleep := Stack(n) ||
    Stack := {n} <<| Stack ||
    CurOpsToTreat := {l|l:Labels & Trans(n)(l) /= {} } - Stack(n)||
    SleepTable(n) := Stack(n)
  END;
  ReVisitNode(n) = PRE n:Nodes & CurOpsToTreat={} & n:dom(Stack) &
    n :dom(SleepTable) THEN
    CurNode := n ||
    CurSleep := Stack(n) /\ SleepTable(n) ||
    Stack := {n} <<| Stack ||
    CurOpsToTreat := Stack(n) - SleepTable(n) ||  /* remove some more */
    SleepTable(n) := Stack(n) /\ SleepTable(n)
  END;
  ProcessTransition(t) = PRE t:CurOpsToTreat THEN
    CurOpsToTreat := CurOpsToTreat - {t} ||
    CurSleep := CurSleep \/ {t} ||
    Stack := Stack \/ {n2,s2| n2:Nodes & s2:SLEEP & n2:Trans(CurNode)(t) &
                s2 = {t2|t2:Labels & t2:CurSleep & t|->t2:Indep} }   END;
  Finish = PRE CurOpsToTreat={} & Stack = {} THEN
    Finished := TRUE
  END
END