MACHINE TestNestedFunUpdate
DEFINITIONS
 SET_PREF_ALLOW_SIMULTANEOUS_ASSIGNMENTS == TRUE ;
 SET_PREF_TRY_FIND_ABORT == FALSE
SETS
 ID={aa,bb,cc}
VARIABLES xx, yy, ff, gg
INVARIANT
 xx:ID & yy : POW(ID) & ff: ID +-> ID & gg : ID +-> (ID +-> ID)
INITIALISATION xx:=aa || yy := {} || ff := {} || gg := {} /* ID*{{}} */
OPERATIONS
  Setxx(vv) = PRE vv /= xx THEN xx:=vv END;
  Set5 = BEGIN ff(aa) := xx || gg(aa)(xx) := aa END; 
  Set6 = BEGIN gg(xx)(aa) := xx END;
  Set7 = BEGIN /* Manual encoding of gg(aa)(aa) := bb */
               gg := fnc((rel(gg) - {x,yz|x=aa & #(y,z).(yz=(y,z) & y=aa & z:ID)})
                                   \/ {aa|->(aa|->bb)}) END
END

