MACHINE trace_checking_test
SETS
   MM = {ma,mb}
VARIABLES
   vv
INVARIANT
   vv:MM
INITIALISATION
   vv := ma
OPERATIONS
   set = BEGIN vv :: MM END;
   is_a = PRE vv=mb THEN skip END
END