MACHINE CallQueryOps
VARIABLES ii
INVARIANT ii:NATURAL
INITIALISATION ii:=0
OPERATIONS
  res <-- Double(xx) = PRE xx:INTEGER THEN res := xx*2 END;
  res <-- Half(xx) = PRE xx:NATURAL THEN res := xx/2 END;
  res <-- Get = BEGIN res := ii END;
  Inc = BEGIN ii:=ii+1 END
END

