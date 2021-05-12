MACHINE OperationOrder
CONSTANTS n
PROPERTIES n=3
VARIABLES
    equation
INVARIANT
    equation : 1..n  /* n > 2 */
 
INITIALISATION
     equation := 1
 
OPERATIONS
   Op_1 = SELECT equation = 1 THEN  equation := equation + 1 END  ;
   OP_2 = SELECT equation = 2 THEN  equation := equation + 1  END ;
   OP_3 = SELECT equation = 3 THEN  equation := 1  END
END
 

