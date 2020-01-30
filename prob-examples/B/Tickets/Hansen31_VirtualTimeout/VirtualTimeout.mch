MACHINE VirtualTimeout
SEES LibraryStrings
VARIABLES xx
INVARIANT
 xx:1..3
INITIALISATION xx:=1
OPERATIONS
  Set =
    PRE xx =1
    THEN
      IF
        !a,b.(a: STRING
          & b : STRING
          & a /= b
          =>
          append(a,a)  /= append(b,b)
        )
      THEN xx:= 2
      ELSE xx:= 3
      END
    END
;
  NoDeadlock = skip
END