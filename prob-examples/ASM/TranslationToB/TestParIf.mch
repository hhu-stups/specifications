MACHINE TestParIf
DEFINITIONS
 SET_PREF_ALLOW_SIMULTANEOUS_ASSIGNMENTS == TRUE
SETS
 ID={aa,bb,cc}
VARIABLES xx, yy
INVARIANT
 xx:ID & yy : POW(ID) 
INITIALISATION xx:=aa || yy := {}
OPERATIONS
  Test = BEGIN xx:= aa || skip END;
  Set =     IF xx=aa THEN
               xx := bb
            END
            ||
            IF xx=bb THEN
               xx := cc
            ELSE
               skip
            END;
  Set2 =     IF xx=aa THEN
               xx := bb
            END
            ||
            IF xx=bb THEN
               yy := {xx}
            ELSE
               yy := {}
            END
END

