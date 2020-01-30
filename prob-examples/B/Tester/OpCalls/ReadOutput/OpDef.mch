/* OpDef
 * Author: 
 * Creation date: 31/10/2017
 */
MACHINE
    OpDef
OPERATIONS
     res <-- myop(pp) = PRE res:NAT & res=1 & pp:BOOL THEN  res := 0 END
 /*:not allowed  res <-- myop2(pp) = PRE res:NAT & res=1 & pp:BOOL THEN res:=0 || pp := TRUE END */
END
