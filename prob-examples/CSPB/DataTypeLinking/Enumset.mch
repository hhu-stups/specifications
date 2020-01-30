MACHINE Enumset
SETS ENUMSET = {c1, c2, c3}
VARIABLES var
INVARIANT var : POW(ENUMSET)
INITIALISATION
  var := {c1}
OPERATIONS
xx<--read_var = BEGIN xx:=var END;
 set_var(vv) = PRE vv:POW(ENUMSET) THEN var := vv END
END