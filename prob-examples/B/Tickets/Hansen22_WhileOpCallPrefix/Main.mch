MACHINE Main
INCLUDES d.Dyx
//SEES C
VARIABLES z
INVARIANT
 z:NATURAL & z+d.y+d.c.x <= 4
INITIALISATION z:=1
OPERATIONS
  whilemain = WHILE z >0 DO
            d.whiledyx;
            z := z-1
          INVARIANT z:NATURAL
          VARIANT z
          END
END