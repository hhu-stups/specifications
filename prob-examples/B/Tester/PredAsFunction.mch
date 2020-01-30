MACHINE PredAsFunction
VARIABLES x
INVARIANT x: INTEGER +-> INTEGER

INITIALISATION x:= {}

OPERATIONS
 evt1 = BEGIN x := {1 |-> pred(1)} END;
 evt0 = BEGIN x := pred END   /* This should be accepted; but the parser does not support this */

END