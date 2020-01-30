MACHINE LocalOperationCall2
DEFINITIONS
  SET_PREF_ALLOW_LOCAL_OPERATION_CALLS == TRUE
ABSTRACT_VARIABLES
  Aomp2
INVARIANT
    Aomp2 : {"COMPUTATION_DISABLED","EXECUTED","NOT_EXECUTED"}
INITIALISATION
    BEGIN
      Aomp2 := "NOT_EXECUTED"
    END
OPERATIONS
  Aomp2 =
    SELECT
        Aomp2 = "NOT_EXECUTED"
    THEN
        VAR res
        IN
          res <-- FUNC_foo(3)
        END
      ;
        Aomp2 := "EXECUTED"
    END;
  out <-- FUNC_foo2(p) =
    PRE
        p : 1 .. 10
    THEN
      out := p + 2
    END;
  out <-- FUNC_foo(p) =
    PRE
        p : 1 .. 8
    THEN
      out <-- FUNC_foo2(p + 2)
    END
END