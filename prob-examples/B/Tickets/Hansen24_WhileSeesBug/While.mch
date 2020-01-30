MACHINE While
SEES V_Track
OPERATIONS
  Foo =
    SELECT xx /= {}
    THEN
      VAR c,y
      IN
        c := 1;
        WHILE c < 2000
        DO
          y := card(xx);
          c := c + 1
        INVARIANT 1=1
        VARIANT 2000 - c
        END//WHILE
     END//vAR
    END//SELECT

END//MACHINE
