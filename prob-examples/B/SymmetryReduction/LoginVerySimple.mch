MACHINE LoginVerySimple
SETS
 Session
DEFINITIONS scope_Session == 6
VARIABLES active
INVARIANT
 active<:Session 
INITIALISATION active := {} 
OPERATIONS
  res <-- Login = ANY s WHERE s:Session & s/: active THEN
                   res := s ||
                   active := active \/ {s}
                END;
  Logout(s) = PRE s: active THEN
                active := active - {s}
              END
END