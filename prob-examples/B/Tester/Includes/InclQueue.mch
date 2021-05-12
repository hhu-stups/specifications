MACHINE InclQueue
INCLUDES Queue(ID)
PROMOTES add,pop
SETS
  ID = {id1,id2,id3}
VARIABLES
  cur
INVARIANT
  cur : ID
INITIALISATION
  cur := id1
OPERATIONS
  UpdCur = PRE q /= {} THEN cur <-- pop END
END