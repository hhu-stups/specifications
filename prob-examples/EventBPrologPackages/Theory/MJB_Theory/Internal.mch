
MACHINE M1
SETS /* deferred */
  OBJECT
CONCRETE_CONSTANTS
  rt
ABSTRACT_VARIABLES
  struct
/* PROMOTED OPERATIONS
  CreateObject,
  MoveObject,
  RemoveObject */
INVARIANT
    prj1(OBJECT,POW(OBJECT*OBJECT))(prj2(POW(OBJECT),OBJECT*POW(OBJECT*OBJECT))(__ft~(TreeType(OBJECT),tree,(struct)))) : prj1(POW(OBJECT),OBJECT*POW(OBJECT*OBJECT))(__ft~(TreeType(OBJECT),tree,(struct)))
  & prj2(OBJECT,POW(OBJECT*OBJECT))(prj2(POW(OBJECT),OBJECT*POW(OBJECT*OBJECT))(__ft~(TreeType(OBJECT),tree,(struct)))) : prj1(POW(OBJECT),OBJECT*POW(OBJECT*OBJECT))(__ft~(TreeType(OBJECT),tree,(struct))) - {prj1(OBJECT,POW(OBJECT*OBJECT))(prj2(POW(OBJECT),OBJECT*POW(OBJECT*OBJECT))(__ft~(TreeType(OBJECT),tree,(struct))))} --> prj1(POW(OBJECT),OBJECT*POW(OBJECT*OBJECT))(__ft~(TreeType(OBJECT),tree,(struct)))
  & !(p).(p : POW(OBJECT) & p <: (prj2(OBJECT,POW(OBJECT*OBJECT))(prj2(POW(OBJECT),OBJECT*POW(OBJECT*OBJECT))(__ft~(TreeType(OBJECT),tree,(struct))))~)[p] => p = {})
INITIALISATION
    EVENT INITIALISATION = /* of machine M1 */
    THEN 
         struct := tree({rt} |-> (rt |-> {}))
    END
OPERATIONS
  CreateObject(o,p) = 
    EVENT CreateObject = /* of machine M1 */
    ANY o,p
    WHERE 
        /* @M1:grd1 */ o /: prj1(POW(OBJECT),OBJECT*POW(OBJECT*OBJECT))(__ft~(TreeType(OBJECT),tree,(struct)))
      & /* @M1:grd2 */ p : prj1(POW(OBJECT),OBJECT*POW(OBJECT*OBJECT))(__ft~(TreeType(OBJECT),tree,(struct)))
    THEN 
         struct := tree((prj1(POW(OBJECT),OBJECT*POW(OBJECT*OBJECT))(__ft~(TreeType(OBJECT),tree,(struct))) \/ {o}) |-> (prj1(OBJECT,POW(OBJECT*OBJECT))(prj2(POW(OBJECT),OBJECT*POW(OBJECT*OBJECT))(__ft~(TreeType(OBJECT),tree,(struct)))) |-> (prj2(OBJECT,POW(OBJECT*OBJECT))(prj2(POW(OBJECT),OBJECT*POW(OBJECT*OBJECT))(__ft~(TreeType(OBJECT),tree,(struct)))) \/ {o |-> p})))
    END;
  
  MoveObject(o,p) = 
    EVENT MoveObject = /* of machine M1 */
    ANY o,p
    WHERE 
        /* @M1:grd1 */ o : prj1(POW(OBJECT),OBJECT*POW(OBJECT*OBJECT))(__ft~(TreeType(OBJECT),tree,(struct)))
      & /* @M1:grd2 */ p : prj1(POW(OBJECT),OBJECT*POW(OBJECT*OBJECT))(__ft~(TreeType(OBJECT),tree,(struct)))
      & /* @M1:grd3 */ p /: prj1(POW(OBJECT),OBJECT*POW(OBJECT*OBJECT))(__ft~(TreeType(OBJECT),tree,(tree(((inter({s|s : POW(OBJECT * OBJECT) & (# /* LET */ (S).( (S)=(OBJECT * OBJECT) & s : POW(S) & %s.(s : POW(S * S) & s : POW(S * S)|(LET (r)==prj2(OBJECT,POW(OBJECT*OBJECT))(prj2(POW(OBJECT),OBJECT*POW(OBJECT*OBJECT))(__ft~(TreeType(OBJECT),tree,(struct)))) IN r \/ (s ; r)))(s) <: s))})~)[{o}] \/ {o}) |-> (o |-> (((inter({s|s : POW(OBJECT * OBJECT) & (# /* LET */ (S).( (S)=(OBJECT * OBJECT) & s : POW(S) & %s.(s : POW(S * S) & s : POW(S * S)|(LET (r)==prj2(OBJECT,POW(OBJECT*OBJECT))(prj2(POW(OBJECT),OBJECT*POW(OBJECT*OBJECT))(__ft~(TreeType(OBJECT),tree,(struct)))) IN r \/ (s ; r)))(s) <: s))})~)[{o}] \/ {o}) <| prj2(OBJECT,POW(OBJECT*OBJECT))(prj2(POW(OBJECT),OBJECT*POW(OBJECT*OBJECT))(__ft~(TreeType(OBJECT),tree,(struct))))))))))
    THEN 
         struct := tree(LET (t)==tree(prj1(POW(OBJECT),OBJECT*POW(OBJECT*OBJECT))(__ft~(TreeType(OBJECT),tree,(t))) - ((inter({s|s : POW(OBJECT * OBJECT) & (# /* LET */ (S).( (S)=(OBJECT * OBJECT) & s : POW(S) & %s.(s : POW(S * S) & s : POW(S * S)|(LET (r)==prj2(OBJECT,POW(OBJECT*OBJECT))(prj2(POW(OBJECT),OBJECT*POW(OBJECT*OBJECT))(__ft~(TreeType(OBJECT),tree,(t)))) IN r \/ (s ; r)))(s) <: s))})~)[{o}] \/ {o}) |-> (prj1(OBJECT,POW(OBJECT*OBJECT))(prj2(POW(OBJECT),OBJECT*POW(OBJECT*OBJECT))(__ft~(TreeType(OBJECT),tree,(t)))) |-> (((inter({s|s : POW(OBJECT * OBJECT) & (# /* LET */ (S).( (S)=(OBJECT * OBJECT) & s : POW(S) & %s.(s : POW(S * S) & s : POW(S * S)|(LET (r)==prj2(OBJECT,POW(OBJECT*OBJECT))(prj2(POW(OBJECT),OBJECT*POW(OBJECT*OBJECT))(__ft~(TreeType(OBJECT),tree,(t)))) IN r \/ (s ; r)))(s) <: s))})~)[{o}] \/ {o}) <<| prj2(OBJECT,POW(OBJECT*OBJECT))(prj2(POW(OBJECT),OBJECT*POW(OBJECT*OBJECT))(__ft~(TreeType(OBJECT),tree,(t))))))) IN (LET (s)==tree(((inter({s|s : POW(OBJECT * OBJECT) & (# /* LET */ (S).( (S)=(OBJECT * OBJECT) & s : POW(S) & %s.(s : POW(S * S) & s : POW(S * S)|(LET (r)==prj2(OBJECT,POW(OBJECT*OBJECT))(prj2(POW(OBJECT),OBJECT*POW(OBJECT*OBJECT))(__ft~(TreeType(OBJECT),tree,(t)))) IN r \/ (s ; r)))(s) <: s))})~)[{o}] \/ {o}) |-> (o |-> (((inter({s|s : POW(OBJECT * OBJECT) & (# /* LET */ (S).( (S)=(OBJECT * OBJECT) & s : POW(S) & %s.(s : POW(S * S) & s : POW(S * S)|(LET (r)==prj2(OBJECT,POW(OBJECT*OBJECT))(prj2(POW(OBJECT),OBJECT*POW(OBJECT*OBJECT))(__ft~(TreeType(OBJECT),tree,(t)))) IN r \/ (s ; r)))(s) <: s))})~)[{o}] \/ {o}) <| prj2(OBJECT,POW(OBJECT*OBJECT))(prj2(POW(OBJECT),OBJECT*POW(OBJECT*OBJECT))(__ft~(TreeType(OBJECT),tree,(t))))))) IN (prj1(POW(OBJECT),OBJECT*POW(OBJECT*OBJECT))(__ft~(TreeType(OBJECT),tree,(t))) \/ prj1(POW(OBJECT),OBJECT*POW(OBJECT*OBJECT))(__ft~(TreeType(OBJECT),tree,(s)))) |-> (prj1(OBJECT,POW(OBJECT*OBJECT))(prj2(POW(OBJECT),OBJECT*POW(OBJECT*OBJECT))(__ft~(TreeType(OBJECT),tree,(t)))) |-> (prj2(OBJECT,POW(OBJECT*OBJECT))(prj2(POW(OBJECT),OBJECT*POW(OBJECT*OBJECT))(__ft~(TreeType(OBJECT),tree,(t)))) \/ (prj2(OBJECT,POW(OBJECT*OBJECT))(prj2(POW(OBJECT),OBJECT*POW(OBJECT*OBJECT))(__ft~(TreeType(OBJECT),tree,(s)))) \/ {prj1(OBJECT,POW(OBJECT*OBJECT))(prj2(POW(OBJECT),OBJECT*POW(OBJECT*OBJECT))(__ft~(TreeType(OBJECT),tree,(s)))) |-> p})))))
    END;
  
  RemoveObject(o) = 
    EVENT RemoveObject = /* of machine M1 */
    ANY o
    WHERE 
        /* @M1:grd1 */ o : prj1(POW(OBJECT),OBJECT*POW(OBJECT*OBJECT))(__ft~(TreeType(OBJECT),tree,(struct)))
      & /* @M1:grd2 */ o /= prj1(OBJECT,POW(OBJECT*OBJECT))(prj2(POW(OBJECT),OBJECT*POW(OBJECT*OBJECT))(__ft~(TreeType(OBJECT),tree,(struct))))
    THEN 
         struct := tree(prj1(POW(OBJECT),OBJECT*POW(OBJECT*OBJECT))(__ft~(TreeType(OBJECT),tree,(struct))) - ((inter({s|s : POW(OBJECT * OBJECT) & (# /* LET */ (S).( (S)=(OBJECT * OBJECT) & s : POW(S) & %s.(s : POW(S * S) & s : POW(S * S)|(LET (r)==prj2(OBJECT,POW(OBJECT*OBJECT))(prj2(POW(OBJECT),OBJECT*POW(OBJECT*OBJECT))(__ft~(TreeType(OBJECT),tree,(struct)))) IN r \/ (s ; r)))(s) <: s))})~)[{o}] \/ {o}) |-> (prj1(OBJECT,POW(OBJECT*OBJECT))(prj2(POW(OBJECT),OBJECT*POW(OBJECT*OBJECT))(__ft~(TreeType(OBJECT),tree,(struct)))) |-> (((inter({s|s : POW(OBJECT * OBJECT) & (# /* LET */ (S).( (S)=(OBJECT * OBJECT) & s : POW(S) & %s.(s : POW(S * S) & s : POW(S * S)|(LET (r)==prj2(OBJECT,POW(OBJECT*OBJECT))(prj2(POW(OBJECT),OBJECT*POW(OBJECT*OBJECT))(__ft~(TreeType(OBJECT),tree,(struct)))) IN r \/ (s ; r)))(s) <: s))})~)[{o}] \/ {o}) <<| prj2(OBJECT,POW(OBJECT*OBJECT))(prj2(POW(OBJECT),OBJECT*POW(OBJECT*OBJECT))(__ft~(TreeType(OBJECT),tree,(struct)))))))
    END
FREETYPES
  TreeType(_A): 
    tree(POW(_A)*(_A*POW(_A*_A)))
/* Event-B operators:
  By direct definition
  By direct definition
  By direct definition
  By direct definition
  By direct definition
  By direct definition
  By direct definition
  TreeType: Operator implemented by bmachine_eventb:freetype_operator
  tree: Operator implemented by bmachine_eventb:constructor_operator
  nodes: Operator implemented by bmachine_eventb:destructor_operator
  root: Operator implemented by bmachine_eventb:destructor_operator
  parent: Operator implemented by bmachine_eventb:destructor_operator
  By direct definition
  By direct definition
  By direct definition
  By direct definition
  By direct definition
  By direct definition
  By direct definition
*/
END
