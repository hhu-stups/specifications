MACHINE abort_test

SETS
  ID ={i1,i2}
  
VARIABLES
   xx, ff
   
 INVARIANT
    xx: ID  & ff: ID +-> ID
    
 INITIALISATION
    xx:= i1 || ff := {i1 |-> i2}
    
 OPERATIONS
    apply = BEGIN xx := ff(xx) END
 END
   