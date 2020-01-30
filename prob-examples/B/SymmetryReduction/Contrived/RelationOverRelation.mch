MACHINE RelationOverRelation
/* An example with a more complicated data structure;
  For the moment the StateGraph Algorithm used by Nauty-Symmetry is wrong.
  This means that after Set one cannot execute the operation Test !
*/
SETS
 ID={aa,bb}; PROC
VARIABLES relrel, xx
INVARIANT
 relrel : NAT +-> (ID <-> ID) & xx:PROC 
INITIALISATION relrel := { 1 |-> {aa|->aa}, 2 |-> {aa|->bb}, 3 |-> {bb|->aa} } || xx :: PROC
OPERATIONS
  Set = BEGIN relrel := { 1 |-> {aa|->aa}, 2 |-> {bb|->aa}, 3 |-> {aa|->bb} } END;
  Test = PRE relrel = { 1 |-> {aa|->aa}, 2 |-> {bb|->aa}, 3 |-> {aa|->bb} } THEN skip END;
  Set2 = BEGIN relrel := { 1 |-> {aa|->aa,bb|->aa}, 2 |-> {bb|->aa}, 3 |-> {aa|->bb} } END;
  Set3 = BEGIN relrel := { 1 |-> {aa|->aa,bb|->aa,bb|->bb}, 2 |-> {bb|->aa}, 3 |-> {aa|->bb} } END;
  Test2 = PRE relrel = { 1 |-> {aa|->aa,bb|->aa,bb|->bb}, 2 |-> {bb|->aa}, 3 |-> {aa|->bb} } THEN skip END
END

