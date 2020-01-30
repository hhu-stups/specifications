/* Var
 * Author: 
 * Creation date: 30/08/2016
 */
MACHINE
    Var
VARIABLES xx
INVARIANT xx:NAT
INITIALISATION xx:=0
OPERATIONS
     rr <-- GetXX = BEGIN rr:=xx END
END
