MACHINE Stack
SETS STACKS;DATA
DEFINITIONS scope_DATA == 2; scope_STACKS == 3;
  NFSTACKS == (STACKS-{full})
CONSTANTS
  empty, full, STACKS1, push, pop, tops
PROPERTIES
  empty : STACKS & empty /: STACKS1 &
  STACKS = STACKS1 \/ {empty} &
  full : STACKS &
  push : NFSTACKS*DATA --> STACKS1 &  /* if we use --> we need infinitely many stacks */
  push /= {} &
  pop : STACKS1 --> STACKS &
  tops : STACKS1 --> DATA &
  !(s,d).(s:NFSTACKS & d:DATA  => pop(push(s,d)) = s) &
  !(s,d).(s:NFSTACKS & d:DATA  => tops(push(s,d)) = d)
VARIABLES
  mystack
INVARIANT
  mystack:STACKS
INITIALISATION
  mystack := empty
OPERATIONS
  PUSH(d) = PRE d:DATA & (mystack,d):dom(push) THEN
    mystack := push(mystack,d)
  END;
  r <-- TOP = BEGIN r:= tops(mystack) END
END