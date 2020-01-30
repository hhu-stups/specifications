MACHINE ClosureFunOutsideDomain
SETS
 ID={aa,bb}
CONSTANTS f
PROPERTIES
 f:ID +-> ID & f = { aa |-> bb}
VARIABLES xx, state
INVARIANT
 xx:ID & state:{1,2,3,4}
INITIALISATION xx:=bb || state := 1
OPERATIONS
  IncState = PRE state<4 THEN state := state+1 END;
  Set(yy) = PRE yy: {zz| f(zz)=bb} /* error: f applied outside of domain ; not detected */
            THEN xx:= yy END;
  Set2(yy) = PRE yy: {zz| zz:dom(f) & f(zz)=bb} /* correct */
            THEN xx:= yy END;
  Set3(yy) = PRE yy: ID & state=2
            THEN xx:= f(yy) END; /* error: f applied outside of domain; not detected */
  Set4(yy) = PRE f(yy)=bb & state=3
            THEN xx:= f(yy) END; /* error: f applied outside of domain; detected */
  Set5(yy) = PRE f(yy)/=yy & state=4
            THEN xx:= f(yy) END; /* error: f applied outside of domain; not detected */
  Set6(yy) = PRE f(yy)/=aa & state=4
            THEN xx:= f(yy) END /* error: f applied outside of domain; not detected */
END

