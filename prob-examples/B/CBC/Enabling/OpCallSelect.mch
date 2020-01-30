/* OpCallSelect
 * Author: Michael Leuschel
 * Creation date: 29/06/2015
 The example below is not allowed by Atelier-B. ProB only complains when the two operations modify a common variable. Probably ProB should give out a warning.
 */
MACHINE
    OpCallSelect
EXTENDS OpCallSelect1 , OpCallSelect2
ABSTRACT_VARIABLES yy
INVARIANT yy : NAT
INITIALISATION yy := 0
OPERATIONS
     rr <-- BothGt1 = SELECT yy > 1 THEN
           rr <-- Gt1
            END ;
     rr , ss <-- Infeasible = BEGIN
              rr <-- Gt1 ||
              ss <-- Lt0 ||
              yy := - 1
              END ;
     Incyy = SELECT yy < 10 THEN yy := yy + 1 END
END
