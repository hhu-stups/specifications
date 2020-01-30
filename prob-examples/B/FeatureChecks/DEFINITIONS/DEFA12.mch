/* DEFA12
 * Author: 
 * Creation date: Wed Oct 21 2009
 */
MACHINE
    DEFA12
SEES DEFA1, DEFA2
VARIABLES xx
INVARIANT xx:NAT & (xx=aa or xx=bb)
    INITIALISATION xx::{aa,bb}
END
