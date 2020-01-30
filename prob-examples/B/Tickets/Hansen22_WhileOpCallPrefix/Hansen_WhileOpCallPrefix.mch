MACHINE Hansen_WhileOpCallPrefix
INCLUDES c1.C, c2.C
VARIABLES y
INVARIANT
 y:NATURAL & y+c1.x+c2.x = 3
INITIALISATION y:=3
OPERATIONS
  while = WHILE y >0 DO
            c1.inc;
            y := y-1
          INVARIANT y:NATURAL
          VARIANT y
          END
END

