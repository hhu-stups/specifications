/* OpCallSelect1
 * Author: 
 * Creation date: 29/06/2015
 */
MACHINE
    OpCallSelect1
VARIABLES xx
INVARIANT xx:NAT
INITIALISATION xx:=0
OPERATIONS
    res <-- Gt1 = SELECT xx>1 THEN res := xx  END;
    res <-- Leq1 = SELECT xx<=1 THEN res := xx END;
    Incxx = SELECT xx<MAXINT THEN xx:=xx+1 END
END
