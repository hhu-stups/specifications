MACHINE RefinementAlgorithm
/* A model of the refinement algorithm as implemented within ProB itself */
SETS
  AbstractStates={a1,a2}; ConcreteStates={c1,c2}; Events = {a,b}
  
CONSTANTS
 
  initAS,initCS, ARel,CRel
  
PROPERTIES

  initAS: AbstractStates & initCS: ConcreteStates &
  /* ARel: AbstractStates --> (Events +-> POW1(AbstractStates)) & */
  ARel: Events --> (AbstractStates --> POW1(AbstractStates)) &
  CRel: ConcreteStates --> (Events --> POW1(ConcreteStates))
 &
  initAS = a1 & initCS = c1
  
VARIABLES
  table, pending, curC, curAS, curEvents
  
INVARIANT
   table: POW(ConcreteStates * POW(AbstractStates)) &
   pending: POW(ConcreteStates * POW(AbstractStates)) &
   curC: ConcreteStates & curAS: POW(AbstractStates) & curEvents: POW(Events)
   
INITIALISATION
   table := { c1 |-> {a1} } ||
   pending := { c1 |-> {a1} } ||
   curC := initCS ||
   curAS := {} ||
   curEvents := {}
OPERATIONS
   CounterExample(CS,AS) = PRE CS: ConcreteStates & AS: POW(AbstractStates) &
                             CS |-> AS : pending THEN
                         skip
                       END;
                       
   TreatPendingPair(CS,ASs) = PRE curEvents = {} &
                      CS: ConcreteStates & ASs: POW(AbstractStates) &
                      CS|->ASs : pending THEN
                      curC := CS ||
                      curAS := ASs ||
                      curEvents := dom(CRel(CS)) || 
                      pending := pending - { CS|->ASs }
                   END;
                   
   CheckEvent(CS,Ev,CS1,AS1) = PRE CS: ConcreteStates & CS = curC &
                      Ev: Events & Ev: curEvents & CS1 : ConcreteStates &
                      CS1: CRel(CS)(Ev) &
                      AS1: POW(AbstractStates) &
                      AS1 = UNION(ZZ).(ZZ:curAS | ARel(Ev)(ZZ))
                      THEN   /* for the moment we assume deterministic CRel */
                       curEvents := curEvents - {Ev} ||
                       IF (CS1 |-> AS1) : table THEN
                          skip
                       ELSE
                          table := table \/ { CS1 |-> AS1} ||
                          pending := pending \/ { CS1 |-> AS1}
                       END
                  END
END
