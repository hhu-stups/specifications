MACHINE ParseSimple
SETS
  Nodes
CONSTANTS
  Trans,Initial,Reachable
PROPERTIES
  Trans: Nodes <-> Nodes &
  Initial: Nodes &
  Reachable: POW(Nodes) & 
  Reachable = {Initial} \/ closure1(Trans)[{Initial}]
VARIABLES
  Stack, Table
INVARIANT
  Stack <: Nodes & Table <: Nodes &
  Reachable = Table \/ Stack \/ closure1(Trans)[Stack]
INITIALISATION
  Stack,Table := {Initial},{}
OPERATIONS
  Process(n) = PRE n:Stack THEN
    /* Stack := Stack - {n} \/ (Trans[{n}]-Table) || */
    Stack := Stack - {n} \/ Trans[{n}] ||
    Table := Table \/ {n}
  END;
  Finish = PRE Stack={} THEN skip END
END
   