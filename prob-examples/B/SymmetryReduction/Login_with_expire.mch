MACHINE Login_with_expire
SETS Session /* = {s1,s2} */
VARIABLES active,expire
INVARIANT active<:Session & expire<:Session /* & s3 /: active */
INITIALISATION active := {} || expire := {}
OPERATIONS
  res <-- Login = ANY s WHERE s:Session & s/: active & s/:expire THEN
                    res := s || active := active \/ {s}
                 END;
  Logout(s,e) = PRE s: active & e: BOOL THEN
                 active := active - {s} ||
                 IF e=TRUE THEN
                   expire:=expire \/ {s}
                 END
                END
END