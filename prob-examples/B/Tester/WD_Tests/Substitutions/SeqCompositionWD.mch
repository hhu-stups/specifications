/* SeqCompositionWD
 * Author: 
 * Creation date: 11/04/2020
 */
MACHINE
    SeqCompositionWD
ABSTRACT_VARIABLES
      xx
INVARIANT xx : NAT
INITIALISATION xx := 0
OPERATIONS
     Add3 = PRE xx < 100 THEN xx := xx + 3 END ;
     Del3 = PRE xx > 2 THEN xx := xx - 3 END
END
