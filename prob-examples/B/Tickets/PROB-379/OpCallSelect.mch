/* OpCallSelect
 * Author: Michael Leuschel
 * Creation date: 29/06/2015
 This Machine is fully proven
 We want ProB to display the correct enabling condition
 */
MACHINE
    OpCallSelect
EXTENDS OpCallSelect1, OpCallSelect2
VARIABLES yy
INVARIANT yy:NAT
INITIALISATION yy:=0
OPERATIONS
     rr <-- BothGt1 = SELECT yy>1 THEN
           rr <-- Gt1
            END;
     rr,ss <-- Infeasible = BEGIN
              rr <-- Gt1 ||
              ss <-- Lt0 ||
              yy := -1 /* would violate invariant */
              END;
     Incyy = SELECT yy<10 THEN yy:= yy+1 END
END
