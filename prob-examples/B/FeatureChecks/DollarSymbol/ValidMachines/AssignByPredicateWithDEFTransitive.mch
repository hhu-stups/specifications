MACHINE AssignByPredicateWithDEFTransitive
DEFINITIONS
  foo == xx$0+10;
  lt == xx<foo
VARIABLES xx
INVARIANT
 xx:NATURAL & xx<39
INITIALISATION xx:=0
OPERATIONS
  Inc = PRE xx<30 THEN
    xx : (xx>xx$0 & lt)
  END;
  r <-- Get = BEGIN r:=xx END
END
