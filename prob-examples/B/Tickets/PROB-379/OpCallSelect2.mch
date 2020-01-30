/* OpCallSelect2
 * Author: 
 * Creation date: 29/06/2015
 */
MACHINE
    OpCallSelect2
VARIABLES zz
INVARIANT zz:NAT
INITIALISATION zz:=0
OPERATIONS
    res <-- Lt0 = SELECT zz<0 THEN res := zz END;
    Inczz = SELECT zz<10 THEN zz:=zz+1 END
END
