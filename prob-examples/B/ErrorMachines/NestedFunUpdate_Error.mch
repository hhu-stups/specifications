/* NestedFunUpdate_Error
 * Author: Leuschel
 * Creation date: 20/05/2014
 */
 /* The assignment to gg in Setaa is allowed by Atelier-B
    The invariant can be fully proven 
    However, the WD lemmas require aa: dom(gg) which cannot be proven.
    */
MACHINE
    NestedFunUpdate_Error
SETS
 ID={aa,dd,cc}
VARIABLES  gg, bb
INVARIANT
 gg : ID +-> (ID +-> ID) & bb:BOOL &
 (bb=TRUE => aa:dom(gg))
INITIALISATION gg := {} || bb := FALSE
OPERATIONS
  Setaa = BEGIN gg(aa)(aa) := aa || bb := TRUE END
END
