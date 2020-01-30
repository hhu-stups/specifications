MACHINE ProcessIDStarvation
SETS ID
CONSTANTS root
PROPERTIES
 root:ID
VARIABLES free,used,deleted, running, count
INVARIANT
  free <: ID-{root} & used <: ID &  used /\ free={} & used /\ deleted = {} &
  free /\ deleted = {} & used \/ free \/ deleted = ID & running : ID & count:NATURAL
INITIALISATION free,used,deleted,running,count := ID - {root},{root},{},root,0
OPERATIONS
  New(i) = PRE i:free THEN free,used := free-{i},used\/{i} END;
  Run(i) = PRE (running=root or i=root) & i:used THEN running,count := i,count+1 END;
  Delete(i) = PRE i:used THEN used,deleted := used-{i},deleted\/{i} END
END

