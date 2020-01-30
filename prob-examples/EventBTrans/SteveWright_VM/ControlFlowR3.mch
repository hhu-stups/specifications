MODEL ControlFlowR3
SETS Inst;Status={LOADING,RUNNING,FAILED,HALTED}
CONSTANTS InvalidInst,ValidInst,ExecInst,StopInst,IncrInst,JumpInst,CondWriteInst,NonJumpInst,VectorWriteInst,JumpAlwaysInst,JumpCondInst,InstArrayDom,MaxVector
PROPERTIES (ValidInst <: Inst) & (ValidInst /= {}) & (InvalidInst <: Inst) & (InvalidInst /= {}) & (Inst = (InvalidInst \/ ValidInst)) & ((InvalidInst /\ ValidInst) = {}) & (ExecInst <: ValidInst) & (ExecInst /= {}) & (StopInst <: ValidInst) & (StopInst /= {}) & (ValidInst = (StopInst \/ ExecInst)) & ((StopInst /\ ExecInst) = {}) & (IncrInst <: ExecInst) & (IncrInst /= {}) & (JumpInst <: ExecInst) & (JumpInst /= {}) & (ExecInst = (JumpInst \/ IncrInst)) & ((JumpInst /\ IncrInst) = {}) & (NonJumpInst <: IncrInst) & (VectorWriteInst <: IncrInst) & (CondWriteInst <: IncrInst) & (IncrInst = (VectorWriteInst \/ CondWriteInst \/ NonJumpInst)) & ((VectorWriteInst /\ NonJumpInst) = {}) & ((CondWriteInst /\ NonJumpInst) = {}) & ((CondWriteInst /\ VectorWriteInst) = {}) & (JumpCondInst <: JumpInst) & (JumpAlwaysInst <: JumpInst) & (JumpInst = (JumpAlwaysInst \/ JumpCondInst)) & ((JumpAlwaysInst /\ JumpCondInst) = {}) & (MaxVector : NATURAL1) & (InstArrayDom = (1 .. MaxVector))
VARIABLES instArray,instPtr,jumpConditional,jumpVector,jumpVectorReadable,jumpVectorWritable,status
INVARIANT (status : Status) & (instArray : (InstArrayDom --> Inst)) & (instPtr : InstArrayDom) & (jumpConditional : BOOL) & (jumpVector : NATURAL) & (jumpVectorWritable : BOOL) & (jumpVectorReadable : BOOL) & instArray:POW((INTEGER * Inst)) & instPtr:INTEGER & jumpConditional:BOOL & jumpVector:INTEGER & jumpVectorReadable:BOOL & jumpVectorWritable:BOOL & status:Status
ASSERTIONS (Inst /= {}) & (InvalidInst /<: ValidInst) & ((StopInst /\ ExecInst) = {}) & ((JumpInst /\ IncrInst) = {}) & ((StopInst /\ IncrInst) = {}) & ((StopInst /\ JumpInst) = {}) & (InstArrayDom /= {})

DEFINITIONS
SET_PREF_SHOW_EVENTB_ANY_VALUES==TRUE ; scope_Inst == 7
INITIALISATION instArray :: (InstArrayDom --> Inst) || instPtr := 1 || status := LOADING || jumpConditional :: BOOL || jumpVector := 0 || jumpVectorWritable := TRUE || jumpVectorReadable := FALSE
OPERATIONS
 Loading = SELECT (status = LOADING) THEN instArray :: (InstArrayDom --> Inst) || status :: {LOADING,RUNNING} END ;
 NonJumpInst = ANY ptrInc WHERE (instArray(instPtr) : NonJumpInst) & (ptrInc : NATURAL1) & ((ptrInc + instPtr) : InstArrayDom) & (status = RUNNING) THEN instPtr := (ptrInc + instPtr) || jumpVector :: NATURAL || jumpVectorReadable :: BOOL || jumpVectorWritable :: BOOL || status :: {RUNNING,FAILED} END ;
 VectorWriteOk = ANY newPtr,newPtrAvail,ptrInc WHERE (instArray(instPtr) : VectorWriteInst) & (ptrInc : NATURAL1) & ((ptrInc + instPtr) : InstArrayDom) & (jumpVectorWritable = TRUE) & (newPtr : NATURAL) & (newPtrAvail : BOOL) & (newPtrAvail = TRUE) & (status = RUNNING) THEN jumpVector := newPtr || jumpVectorReadable := TRUE || jumpVectorWritable :: BOOL || instPtr := (ptrInc + instPtr) END ;
 VectorWriteNoData = ANY newPtrAvail,ptrInc WHERE (instArray(instPtr) : VectorWriteInst) & (ptrInc : NATURAL1) & ((ptrInc + instPtr) : InstArrayDom) & (newPtrAvail : BOOL) & (newPtrAvail = FALSE) & (status = RUNNING) THEN instPtr := (ptrInc + instPtr) || status := FAILED END ;
 VectorWriteNoVector = ANY ptrInc WHERE (instArray(instPtr) : VectorWriteInst) & (ptrInc : NATURAL1) & ((ptrInc + instPtr) : InstArrayDom) & (jumpVectorWritable = FALSE) & (status = RUNNING) THEN instPtr := (ptrInc + instPtr) || status := FAILED END ;
 CondWriteInst = ANY ptrInc WHERE (instArray(instPtr) : CondWriteInst) & (ptrInc : NATURAL1) & ((ptrInc + instPtr) : InstArrayDom) & (status = RUNNING) THEN jumpVector :: NATURAL || jumpVectorReadable :: BOOL || jumpVectorWritable :: BOOL || jumpConditional :: BOOL || instPtr := (ptrInc + instPtr) || status :: {RUNNING,FAILED} END ;
 IncrInstBadPc = ANY ptrInc WHERE (instArray(instPtr) : IncrInst) & (ptrInc : NATURAL1) & ((ptrInc + instPtr) /: InstArrayDom) & (status = RUNNING) THEN status := FAILED END ;
 JumpTrueOk = SELECT (instArray(instPtr) : JumpCondInst) & (jumpConditional = TRUE) & (jumpVectorReadable = TRUE) & (jumpVector : InstArrayDom) & (status = RUNNING) THEN jumpVectorReadable :: BOOL || jumpVectorWritable :: BOOL || instPtr := jumpVector END ;
 JumpTrueNoVector = SELECT (instArray(instPtr) : JumpCondInst) & (jumpConditional = TRUE) & (jumpVectorReadable = FALSE) & (status = RUNNING) THEN status := FAILED END ;
 JumpTrueBadPc = SELECT (instArray(instPtr) : JumpCondInst) & (jumpConditional = TRUE) & (jumpVectorReadable = TRUE) & (jumpVector /: InstArrayDom) & (status = RUNNING) THEN status := FAILED END ;
 JumpFalseOk = ANY ptrInc WHERE (instArray(instPtr) : JumpCondInst) & (jumpConditional = FALSE) & (ptrInc : NATURAL1) & ((ptrInc + instPtr) : InstArrayDom) & (status = RUNNING) THEN instPtr := (ptrInc + instPtr) END ;
 JumpFalseBadPc = ANY ptrInc WHERE (instArray(instPtr) : JumpCondInst) & (jumpConditional = FALSE) & (ptrInc : NATURAL1) & ((ptrInc + instPtr) /: InstArrayDom) & (status = RUNNING) THEN status := FAILED END ;
 JumpOk = SELECT (instArray(instPtr) : JumpAlwaysInst) & (jumpVectorReadable = TRUE) & (jumpVector : InstArrayDom) & (status = RUNNING) THEN jumpVectorReadable :: BOOL || jumpVectorWritable :: BOOL || instPtr := jumpVector END ;
 JumpNoVector = SELECT (instArray(instPtr) : JumpAlwaysInst) & (jumpVectorReadable = FALSE) & (status = RUNNING) THEN status := FAILED END ;
 JumpBadPc = SELECT (instArray(instPtr) : JumpAlwaysInst) & (jumpVectorReadable = TRUE) & (jumpVector /: InstArrayDom) & (status = RUNNING) THEN status := FAILED END ;
 StopInstOk = SELECT (instArray(instPtr) : StopInst) & (status = RUNNING) THEN status := HALTED END ;
 BadInst = SELECT (instArray(instPtr) /: ValidInst) & (status = RUNNING) THEN status := FAILED END ;
 Halted = SELECT (status = HALTED) THEN skip END ;
 Failed = SELECT (status = FAILED) THEN skip END 
END