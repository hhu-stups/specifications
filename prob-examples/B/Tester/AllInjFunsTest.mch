MACHINE InjTest
SETS
 ID={aa,bb}
CONSTANTS fs
PROPERTIES
 fs=ID>+>ID
VARIABLES xx
INVARIANT
 xx:NATURAL
INITIALISATION xx:=card(fs)
OPERATIONS
  r <-- apply(a) = PRE a:ID THEN
          ANY f WHERE f:fs & a:dom(f) THEN
            r:= f(a)
          END
        END
END

