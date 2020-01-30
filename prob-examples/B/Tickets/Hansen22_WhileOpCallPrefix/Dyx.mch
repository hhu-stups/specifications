MACHINE Dyx
INCLUDES c.C
VARIABLES y
INVARIANT
 y:NATURAL & y+c.x = 3
INITIALISATION y:=3
OPERATIONS
  whiledyx = WHILE y >0 DO
            c.inc;
            y := y-1
          INVARIANT y:NATURAL
          VARIANT y
          END
END