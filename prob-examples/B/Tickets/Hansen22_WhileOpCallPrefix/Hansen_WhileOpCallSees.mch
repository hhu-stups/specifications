MACHINE Hansen_WhileOpCallPrefix
INCLUDES C
VARIABLES y
INVARIANT
 y:NATURAL & y+x = 3
INITIALISATION y:=3
OPERATIONS
  while = WHILE y >0 DO
            inc;
            y := y-1
          INVARIANT y:NATURAL
          VARIANT y
          END
END

