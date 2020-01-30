
MACHINE M2_Internal
/* PROMOTED OPERATIONS
  foo */
INITIALISATION
    skip
OPERATIONS
  out <-- foo(p) = 
    VAR res
    IN
        res := 0
      ;
        VAR RSET2
        IN
            RSET2 := 1 .. 100
          ;
            WHILE card(RSET2) > 0
            DO
              VAR x
              IN
                  x := max(RSET2)
                ;
                  res := res + p
                ;
                  RSET2 := RSET2 - {max(RSET2)}
              END
            INVARIANT card(RSET2) : NATURAL
            VARIANT card(RSET2)
            END
        END
      ;
        out := res
    END
/* DEFINITIONS
  EXPRESSION CHOOSE */
END
