
MACHINE M1_Internal_v2
/* PROMOTED OPERATIONS
  bar */
/* NOT PROMOTED OPERATIONS
  foo */
INCLUDES M2_Internal_v2
//PROMOTES foo
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
              VAR q,p
              IN
                  q := min(RSET) 
                ;
                  p := q-1
                ;
                  res <-- foo(q,p)
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
