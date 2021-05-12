MACHINE WhileWD
VARIABLES xx
INVARIANT
 xx:NATURAL
INITIALISATION xx:=0
OPERATIONS
  Set(yy) = PRE yy:1..10 THEN
      WHILE xx < yy DO
         xx := xx+1+ 1/(10-xx)
      INVARIANT xx<10 // :NATURAL
      VARIANT yy-xx
      END
  END
END

