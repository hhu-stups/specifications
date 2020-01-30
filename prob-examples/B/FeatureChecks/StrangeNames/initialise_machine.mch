MACHINE initialise_machine
/* this machine uses problematic names for the operations */
SETS
 ID={aa,bb}
CONSTANTS iv
PROPERTIES
 iv:ID
VARIABLES xx
INVARIANT
 xx:ID
INITIALISATION xx:=iv
OPERATIONS
  initalise_machine(vv) = xx:=vv;
  setup_constants(pp) = xx := pp;
  Set(yy) = PRE yy:ID THEN xx:= yy END;
  rr <-- GetXX = rr := xx
END

