MACHINE AssignByPredicate
VARIABLES xx
INVARIANT
 xx:NATURAL
INITIALISATION xx:=0
OPERATIONS
  Inc = PRE xx<1000 THEN
    xx : (xx>xx$0 & xx<xx$0+10)
  END;
  r <-- Get = BEGIN r:=xx END
END

