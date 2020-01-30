MACHINE relation_test

SETS
  ALPH = {a,b,c}
  
VARIABLES
  mrel
  
INVARIANT
  mrel:  ALPH <-> ALPH
  
INITIALISATION
  mrel := { a|->b }
  
 OPERATIONS
 
   add(nn,pp) = PRE nn: ALPH & pp:ALPH THEN mrel := mrel \/ {nn |-> pp} END;
   
   compose = BEGIN mrel := (mrel ; mrel) END;
   
   
   cc <-- two = BEGIN cc := {a,a} END
 END