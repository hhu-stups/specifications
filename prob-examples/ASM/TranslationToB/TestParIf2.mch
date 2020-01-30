MACHINE TestParIf2
DEFINITIONS
 SET_PREF_ALLOW_SIMULTANEOUS_ASSIGNMENTS == TRUE
SETS
 ID={aa,bb,cc}
VARIABLES xx, yy, ff, gg
INVARIANT
 xx:ID & yy : POW(ID) & ff: ID +-> ID & gg : ID +-> (ID +-> ID)
INITIALISATION xx:=aa || yy := {} || ff := {} || gg := ID * {{}}
OPERATIONS
  Set2 =     IF xx=aa THEN
               xx := bb || ff(xx) := xx
            END
            ||
            IF xx=bb THEN
               yy := {xx}
            ELSE
               yy := {} || ff(xx) := aa
            END;
  Set3 = IF xx=aa THEN ff(xx) := aa ELSE ff(xx) := bb END ||
         IF xx=bb THEN ff(xx) := bb ELSE ff(xx) := cc END;

  Set4 = IF xx=aa THEN ff(aa) := aa ELSE ff(xx) := bb END ||
         IF xx/=cc THEN ff := ff <+ {xx|->bb} <+ {aa |-> aa} END;
 /* Set5 = BEGIN gg(xx)(aa) := xx || gg(aa)(xx) := aa END; */
  Set6 = BEGIN gg(xx)(aa) := xx END; 
 /* Conflict = BEGIN ff(aa) := bb || ff := {bb|->cc} END /* should result in conflict */

  Test1 = BEGIN IF xx = aa THEN xx:=bb ELSE xx := cc END END;
  Test2 = BEGIN IF xx = aa THEN xx:=bb ELSE xx := cc END || IF xx=bb THEN xx := aa END END
END

