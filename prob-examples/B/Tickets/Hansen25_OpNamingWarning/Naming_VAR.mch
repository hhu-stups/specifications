MACHINE Naming_VAR
OPERATIONS
res<--foo =
 BEGIN
  VAR res IN res := 1 END; res := 1
 END
;
res<--bar = BEGIN ANY res1 WHERE res1 : 1..10 THEN skip END; res := 1 END
END
