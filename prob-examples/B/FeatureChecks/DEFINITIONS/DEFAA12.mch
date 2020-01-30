/* DEFAA12
 * Author: Leuschel
 * Creation date: Wed Oct 21 2009
Check whether the same DEFINITION (AA) can be used locally in various machines
 */
MACHINE
    DEFAA12
SEES DEFA1, DEFA2
CONSTANTS AA
PROPERTIES AA=3
DEFINITIONS SET_PREF_MAXINT == 4
VARIABLES xx
INVARIANT xx:NAT & (xx=aa or xx=bb or xx=AA)
    INITIALISATION xx::{aa,bb,AA}
OPERATIONS
  r <-- get = BEGIN r:= xx END;
  setAA = BEGIN xx:= AA END
END
