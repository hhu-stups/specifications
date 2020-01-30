MACHINE TwoOpsSameName
/*
% loading(/Users/leuschel/svn_root/NewProB/examples/B/ErrorMachines/IllegalFunCalls/ClosureFunOutsideDomain.mch)
! An error occurred !
! source(bmachine_construction)
! Internal error: Checking the machine failed: 
! ClosureFunOutsideDomain

*/
SETS
 ID={aa,bb}
CONSTANTS f
PROPERTIES
 f:ID +-> ID & f = { aa |-> bb}
VARIABLES xx, state
INVARIANT
 xx:ID & state:{1,2,3}
INITIALISATION xx:=bb || state := 1
OPERATIONS
  IncState = PRE state<3 THEN state := state+1 END;
  Set(yy) = PRE yy: {zz| f(zz)=bb} /* error: f applied outside of domain */
            THEN xx:= yy END;
  Set2(yy) = PRE yy: {zz| zz:dom(f) & f(zz)=bb} /* correct */
            THEN xx:= yy END;
  Set3(yy) = PRE yy: ID & state=2
            THEN xx:= f(yy) END; /* error: f applied outside of domain; detected */
  Set4(yy) = PRE f(yy)=bb & state=3
            THEN xx:= f(yy) END; 
  Set4(yy) = PRE f(yy)/=yy & state=4
            THEN xx:= f(yy) END 
END

