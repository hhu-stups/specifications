
MACHINE __RULES_MACHINE_Main
ABSTRACT_VARIABLES
  COMP_comp1
/* PROMOTED OPERATIONS
  COMP_comp1 */
/* NOT PROMOTED OPERATIONS
  FUNC_foo */
INVARIANT
    COMP_comp1 ∈ {"COMPUTATION_DISABLED","EXECUTED","NOT_EXECUTED"}
INITIALISATION
    BEGIN
      COMP_comp1 := "NOT_EXECUTED"
    END
OPERATIONS
  out <-- FUNC_foo(p) = 
    BEGIN
        VAR i,res
        IN
            i := p
          ;
            res := ∅
          ;
            WHILE i < 100
            DO
                res := res ∪ {rec(a:i)}
              ;
                i := i + 1
            INVARIANT ⊤ /* 1 = 1 */
            VARIANT 100 - i
            END
          ;
            out := res
        END
      ;
        ASSERT out ∈ ℙ(struct(a:1 ‥ 100))
        THEN
          skip
        END
    END;
  
  COMP_comp1 = 
    SELECT 
        COMP_comp1 = "NOT_EXECUTED"
    THEN 
        VAR result
        IN
            result := ∅
          ;
            VAR $SET0
            IN
                $SET0 := 1 ‥ 200
              ;
                WHILE card($SET0) > 0
                DO
                  VAR x
                  IN
                      x := CHOOSE($SET0)
                    ;
                      VAR temp
                      IN
                          temp <-- FUNC_foo(x)
                        ;
                          result := result ∪ temp
                      END
                    ;
                      $SET0 := $SET0 - {CHOOSE($SET0)}
                  END
                INVARIANT card($SET0) ∈ ℕ
                VARIANT card($SET0)
                END
            END
        END
      ;
        COMP_comp1 := "EXECUTED"
    END
/* DEFINITIONS
  EXPRESSION SET_PREF_ALLOW_LOCAL_OPERATION_CALLS
  EXPRESSION SET_PREF_TIME_OUT */
END
