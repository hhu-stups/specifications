MACHINE SomeUnitErrors
/* A machine with various errors */
CONSTANTS /*@ unit "mps" */ maxspeed
PROPERTIES
 maxspeed:NATURAL
VARIABLES /*@ unit "m" */ pos
INVARIANT
 pos:INTEGER &
 pos <= maxspeed /* this is an error */
ASSERTIONS
  pos<=maxspeed /* type error */
INITIALISATION pos:=0
OPERATIONS
  Inc_ok(delta) = PRE delta >0 & delta <= maxspeed*1 THEN
   pos := pos+delta
  END;
  Inc_ko(delta) = PRE delta >0 & delta <= maxspeed THEN
   pos := pos+delta /* this is an error */
  END;
  Silly1 = PRE pos>0 THEN
     ANY yy WHERE yy<pos & yy>maxspeed /* this is an error */
     THEN skip END
  END;
  r <-- Silly2 = BEGIN r:= pos+maxspeed /* this is an error */
                 END;
  r <-- Silly3 = IF pos<maxspeed /* this is an error */
                 THEN r:= TRUE ELSE r:= FALSE END;
  r <-- Silly4 = IF pos-maxspeed>0 /* Error not yet detected */
                 THEN r:= TRUE ELSE r:= FALSE END;
  r <-- Silly5(x) = IF x=pos THEN r:= TRUE
                    ELSIF x=maxspeed /* this is an error */ THEN r:= FALSE
                    ELSE r := FALSE END
END
