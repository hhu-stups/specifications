MACHINE ProcessIDStarvation_InvErr
SETS ID
CONSTANTS root
PROPERTIES
 root:ID
VARIABLES free,used,deleted, running
INVARIANT
  free <: ID-{root} & used <: ID &  used /\ free={} & used /\ deleted = {} &
  free /\ deleted = {} & used \/ free \/ deleted = ID &
  running : used /* this leads to invariant violation; now CBC finds invariant error but no longer a deadlock */ 
INITIALISATION free,used,deleted,running := ID - {root},{root},{},root
OPERATIONS
  New(i) = PRE i:free THEN free,used := free-{i},used\/{i} END;
  Run(i) = PRE (running=root or i=root) & i:used THEN running := i END;
  Delete(i) = PRE i:used THEN used,deleted := used-{i},deleted\/{i} END
END

