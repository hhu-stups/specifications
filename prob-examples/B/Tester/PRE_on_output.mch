MACHINE PRE_on_output
OPERATIONS
  out <-- Set = PRE out : NATURAL THEN out := 1 END;
  out <-- Set2 = PRE out : INTEGER THEN out := 1 END;
  out <-- Set3 = PRE out : INTEGER THEN out := 1 ; out := out+1 END
END

