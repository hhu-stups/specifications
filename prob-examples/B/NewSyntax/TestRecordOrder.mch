/* TestRecordOrder
 * Author: 
 * Creation date: 31/10/2012
 */
MACHINE
    TestRecordOrder
VARIABLES
    xx,yy,zz
INVARIANT
    xx : struct(aa:NAT, bb:NAT1) &
    yy : struct(bb:NAT1, aa:NAT) &
    zz : struct(aa:NAT1, bb:NAT1)
INITIALISATION
    xx,yy := rec(aa:0,bb:1) , rec(bb:1,aa:2) /* rec(aa:2, bb:1 not allowed by Atelier-B but allowed by ProB ! */
   ||
    zz := rec(aa:1,bb:1)
OPERATIONS
     ztox = BEGIN xx := zz END
  ;  xtoz = BEGIN zz := xx END /* invariant violation */
 /*  ; ytox = BEGIN xx := yy END not allowed */
END


