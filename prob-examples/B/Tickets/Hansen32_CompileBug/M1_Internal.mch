
MACHINE M1_Internal
/* PROMOTED OPERATIONS
  bar */
/* NOT PROMOTED OPERATIONS
  foo */
INCLUDES M2_Internal
INITIALISATION
    skip
OPERATIONS
  out <-- bar = 
    VAR res
    IN
        res := 0
      ;
        VAR RSET
        IN
            RSET := 1 .. 100
          ;
            WHILE card(RSET) > 0
            DO
              VAR yy
              IN
                  yy := min(RSET)
                ;
                  res <-- foo(yy)
                ;
                  RSET := RSET - {min(RSET)}
              END
            INVARIANT card(RSET) : NATURAL
            VARIANT card(RSET)
            END
        END
      ;
        out := res
    END
  

/* DEFINITIONS
  EXPRESSION CHOOSE */
END
