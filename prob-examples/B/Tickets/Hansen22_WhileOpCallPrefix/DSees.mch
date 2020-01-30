MACHINE DSees
SEES C
VARIABLES y
INVARIANT
 y:NATURAL 
INITIALISATION y:=3
OPERATIONS
  whiledsees = WHILE y >0 DO
            y := y-1
          INVARIANT y:NATURAL & y>x-10
          VARIANT y
          END
END