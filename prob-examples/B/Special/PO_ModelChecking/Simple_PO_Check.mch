MACHINE Simple
 /* A simple machine to check the correct behaviour of proof directed MC */
VARIABLES xx,yy
INVARIANT
 xx:NATURAL & yy:NATURAL
INITIALISATION xx:=0 || yy:=0
OPERATIONS
  Inc = PRE xx<5 THEN xx := xx+1 END;
  Dec = PRE xx>-2 THEN xx := xx-3 END; /* can violate the invariant */
  IncY = PRE yy<5 THEN yy := yy+1 END
END

