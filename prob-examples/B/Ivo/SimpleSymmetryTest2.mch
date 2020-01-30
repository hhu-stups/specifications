MACHINE SimpleSymmetryTest2
DEFINITIONS HEURISTIC_FUNCTION == card(active) + 3*card(sync)
SETS ID
PROPERTIES card(ID) = 3
VARIABLES active, sync
INVARIANT active<: ID & sync : ID +-> ID
INITIALISATION active := {} || sync := {}
OPERATIONS
  Create(yy) = PRE yy /: active THEN active := active \/ {yy} END;
  Sync(xx,yy) = PRE xx:active & yy:active & xx|->yy /: sync THEN sync(xx) := yy END
END

