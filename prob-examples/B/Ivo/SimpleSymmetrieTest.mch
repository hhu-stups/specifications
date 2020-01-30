MACHINE SimpleSymmetryTest
SETS ID
PROPERTIES card(ID) = 4
VARIABLES active
INVARIANT active<: ID
INITIALISATION active := {}
OPERATIONS
  Create(yy) = PRE yy /: active THEN active := active \/ {yy} END
END

