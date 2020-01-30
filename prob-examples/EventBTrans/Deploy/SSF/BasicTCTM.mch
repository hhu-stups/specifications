MODEL BasicTCTM
SETS ADDRESSES;TC_DATA;TM_DATA;STATUS={ok,fail,unknown}
CONSTANTS BuffSize,TC_check,TC_execution
PROPERTIES
  (BuffSize : NATURAL1) & (BuffSize = 16) &
  (TC_check : (ADDRESSES --> STATUS)) &
  (TC_execution : (ADDRESSES --> STATUS)) 
 /* &
  (((0 .. (BuffSize - 1)) --> TC_DATA) /= {}) */ /* strange property: causes problems to ProB */
VARIABLES Buffer,TCPool,TC_queue,TMPool,TM_queue,can_copy,can_execute,can_write
INVARIANT
  (Buffer : ((0 .. (BuffSize - 1)) --> TC_DATA)) & (TCPool : (ADDRESSES +-> TC_DATA)) & (TMPool : (ADDRESSES +-> TM_DATA)) & (TC_queue <: ADDRESSES) & (TC_queue = dom(TCPool)) & (TM_queue <: ADDRESSES) & (TM_queue = dom(TMPool)) & (can_write : POW((0 .. (BuffSize - 1)))) & (can_copy : POW((0 .. (BuffSize - 1)))) & ((can_copy /\ can_write) = {}) & (can_execute <: ADDRESSES) & (can_execute <: TC_queue) & ! s.((s : ADDRESSES) => ((s : can_execute) => (TC_check(s) = ok))) & ((dom(TMPool) /\ dom(TCPool)) = {}) & Buffer:POW((INTEGER * TC_DATA)) & TCPool:POW((ADDRESSES * TC_DATA)) & TC_queue:POW(ADDRESSES) & TMPool:POW((ADDRESSES * TM_DATA)) & TM_queue:POW(ADDRESSES) & can_copy:POW(INTEGER) & can_execute:POW(ADDRESSES) & can_write:POW(INTEGER)

DEFINITIONS
SET_PREF_SHOW_EVENTB_ANY_VALUES==TRUE ;
 SET_PREF_MAXINT == 16
INITIALISATION
  Buffer :: ((0 .. (BuffSize - 1)) --> TC_DATA) ||
  TCPool := {} || TMPool := {} || TC_queue := {} || TM_queue := {} ||
  can_write := (0 .. (BuffSize - 1)) || can_copy := {} || can_execute := {}
OPERATIONS
 Receive_TC = ANY i,packet WHERE (i : (0 .. (BuffSize - 1))) & (i : can_write) & (packet : TC_DATA) THEN Buffer := ({(i |-> packet)} <+ Buffer) || can_write := (can_write - {i}) || can_copy := ({i} \/ can_copy) END ;
 Pool_TC = ANY a,data,j WHERE (j : (0 .. (BuffSize - 1))) & (j : can_copy) & (a : ADDRESSES) & (data : TC_DATA) & (a /: (dom(TMPool) \/ dom(TCPool))) THEN TCPool := ({(a |-> data)} <+ TCPool) || can_copy := (can_copy - {j}) || TC_queue := ({a} \/ TC_queue) || can_write := ({j} \/ can_write) END ;
 Report_TC_Check_ok = ANY a,data,s WHERE (s : TC_queue) & (TC_check(s) = ok) & (data : TM_DATA) & (a : ADDRESSES) & (a /: (dom(TCPool) \/ dom(TMPool))) THEN TMPool := ({(a |-> data)} <+ TMPool) || TM_queue := ({a} \/ TM_queue) || can_execute := ({s} \/ can_execute) END ;
 Report_TC_Check_fail = ANY a,data,s WHERE (s : TC_queue) & (TC_check(s) = fail) & (data : TM_DATA) & (a : ADDRESSES) & (a /: (dom(TCPool) \/ dom(TMPool))) THEN TMPool := ({(a |-> data)} <+ TMPool) || TM_queue := ({a} \/ TM_queue) || TCPool := ({s} <<| TCPool) || TC_queue := (TC_queue - {s}) END ;
 Report_TC_Execution_ok = ANY a,data,s WHERE (s : can_execute) & (TC_execution(s) = ok) & (data : TM_DATA) & (a : ADDRESSES) & (a /: (dom(TCPool) \/ dom(TMPool))) THEN TMPool := ({(a |-> data)} <+ TMPool) || can_execute := (can_execute - {s}) || TM_queue := ({a} \/ TM_queue) || TCPool := ({s} <<| TCPool) || TC_queue := (TC_queue - {s}) END ;
 Report_TC_Execution_fail = ANY a,data,s WHERE (s : can_execute) & (TC_execution(s) = fail) & (data : TM_DATA) & (a : ADDRESSES) & (a /: (dom(TCPool) \/ dom(TMPool))) THEN TMPool := ({(a |-> data)} <+ TMPool) || can_execute := (can_execute - {s}) || TM_queue := ({a} \/ TM_queue) || TC_queue := (TC_queue - {s}) || TCPool := ({s} <<| TCPool) END ;
 Deliver_TM		 = ANY i WHERE (i : TM_queue) THEN TMPool := ({i} <<| TMPool) || TM_queue := (TM_queue - {i}) END 
END