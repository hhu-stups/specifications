MACHINE simple_test_machine
VARIABLES b,i,s
INVARIANT
 b : {TRUE,FALSE} & i : INTEGER & s:POW(INTEGER)
INITIALISATION b:=TRUE || i:=0 || s := {}
OPERATIONS
  init = BEGIN b := TRUE || i := 0 || s := {} END
END

