MODEL ControlFlowR1
SETS Inst;Status={LOADING,RUNNING,FAILED,HALTED}
CONSTANTS InvalidInst,ValidInst,ExecInst,StopInst,IncrInst,JumpInst,InstArrayDom,MaxVector
PROPERTIES (ValidInst <: Inst) & (ValidInst /= {}) & (InvalidInst <: Inst) & (InvalidInst /= {}) & (Inst = (InvalidInst \/ ValidInst)) & ((InvalidInst /\ ValidInst) = {}) & (ExecInst <: ValidInst) & (ExecInst /= {}) & (StopInst <: ValidInst) & (StopInst /= {}) & (ValidInst = (StopInst \/ ExecInst)) & ((StopInst /\ ExecInst) = {}) & (IncrInst <: ExecInst) & (IncrInst /= {}) & (JumpInst <: ExecInst) & (JumpInst /= {}) & (ExecInst = (JumpInst \/ IncrInst)) & ((JumpInst /\ IncrInst) = {}) & (MaxVector : NATURAL1) & (InstArrayDom = (1 .. MaxVector))
VARIABLES instArray,instPtr,status
INVARIANT (status : Status) & (instArray : (InstArrayDom --> Inst)) & (instPtr : InstArrayDom) & instArray:POW((INTEGER * Inst)) & instPtr:INTEGER & status:Status
ASSERTIONS (Inst /= {}) & (InvalidInst /<: ValidInst) & ((StopInst /\ ExecInst) = {}) & ((JumpInst /\ IncrInst) = {}) & ((StopInst /\ IncrInst) = {}) & ((StopInst /\ JumpInst) = {}) & (InstArrayDom /= {})

DEFINITIONS
SET_PREF_SHOW_EVENTB_ANY_VALUES==TRUE ; scope_Inst == 4
INITIALISATION instArray :: (InstArrayDom --> Inst) || instPtr := 1 || status := LOADING
OPERATIONS
 Loading = SELECT (status = LOADING) THEN instArray :: (InstArrayDom --> Inst) || status :: {LOADING,RUNNING} END ;
 IncrInst = ANY ptrInc WHERE (instArray(instPtr) : IncrInst) & (ptrInc : NATURAL1) & ((ptrInc + instPtr) : InstArrayDom) & (status = RUNNING) THEN instPtr := (ptrInc + instPtr) || status :: {RUNNING,FAILED} END ;
 IncrInstBadPc = ANY ptrInc WHERE (instArray(instPtr) : IncrInst) & (ptrInc : NATURAL1) & ((ptrInc + instPtr) /: InstArrayDom) & (status = RUNNING) THEN status := FAILED END ;
 JumpInst = SELECT (instArray(instPtr) : JumpInst) & (status = RUNNING) THEN instPtr :: InstArrayDom || status :: {RUNNING,FAILED} END ;
 StopInstOk = SELECT (instArray(instPtr) : StopInst) & (status = RUNNING) THEN status := HALTED END ;
 BadInst = SELECT (instArray(instPtr) /: ValidInst) & (status = RUNNING) THEN status := FAILED END ;
 Halted = SELECT (status = HALTED) THEN skip END ;
 Failed = SELECT (status = FAILED) THEN skip END 
END