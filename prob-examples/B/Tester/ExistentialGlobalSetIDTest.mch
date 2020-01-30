MACHINE ExistentialGlobalSetIDTest
SETS
 ID={aa,bb,cc}
CONSTANTS iv
PROPERTIES
 iv:ID & iv /= cc
VARIABLES xx
INVARIANT
 xx:ID & xx/=cc
INITIALISATION xx:=iv
OPERATIONS
  Set(ID) = PRE cc /: ID & ID = {}
                 & #v.(v:ID) /* check that this is not optimized away to {} */
    THEN xx:= cc END;
  r <-- ret(ID) = PRE cc /: ID & ID = {}  THEN r := dom({x,y|x=1 & y:ID}) END;
  r <-- ret2(ID) = PRE cc /: ID & bb/:ID  THEN r := dom({x,y|x=1 & y:ID}) END
ASSERTIONS
  #(ID).( cc /: ID & dom({x,y|x=1 & y:ID}) = {})  // fails when run in console if we enable clause in not_empty_set_aux for identifier(X)
END

