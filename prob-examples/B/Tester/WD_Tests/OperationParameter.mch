MACHINE OperationParameter
// it would be nice to show operation parameter in WD error below for x=10 & y=9
OPERATIONS
  r <-- Test(x,y) = PRE x:1..10 & y:9..11 THEN r := max(x..y) END
END
/*

An expression was not well-defined.
Reason:  max applied to empty set
Details: 
Context: 
### Line: 4, Column: 56 until Line: 4, Column: 60
OPERATION: Test
  State ID:0,


set_error_context(operation(ActionName,CurID)),
*/