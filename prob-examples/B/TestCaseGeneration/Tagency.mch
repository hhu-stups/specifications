MACHINE  Tagency

SETS USER = {u1,u2}; SESSION = {s1,s2}; ROOM =  {r1,r2}

VARIABLES  sess, booking

INVARIANT

   sess    : SESSION >+> USER &
   booking : ROOM    +-> USER

INITIALISATION
               sess := {} || booking := {}

OPERATIONS

login(u) = PRE u : USER & u /: ran(sess) & card(dom(sess)) /=  2 
           THEN
                IF s1 : dom(sess) 
                THEN
                   sess(s2) := u
                ELSE
                   sess(s1) := u
                END
            END; 

 ss <-- probe_login_whichSession(u) = PRE u : USER & u : ran(sess)
                                      THEN
                                          ss := sess~(u)
                                      END;
 bb <-- probe_login_userHasRoom(u) = PRE u : USER THEN
                                         bb := bool(u : ran(booking))

END;                                 

alloc(s) = PRE  s : SESSION & sess /= {} & dom(booking) /= {r1,r2}  & s:dom(sess)
           THEN
               IF r1 : dom(booking) 
               THEN booking(r2) := sess(s)
               ELSE
                    booking(r1) := sess(s)
               END
            END;

count <-- probe_alloc_noOfAlloc = BEGIN
                          count := card(booking)
                        END;


logout(s) = PRE s: SESSION & s : dom(sess)
            THEN
                 sess :=  {s} <<| sess
            END;

bb <-- probe_logout_noSession = BEGIN bb := bool(sess = {})
                                END;


dealloc(s,r) = PRE r : ROOM & s : SESSION & 
                      booking(r) = sess(s)
                THEN
                    booking := {r} <<| booking
                END;

bb <-- probe_dealloc_roomEmpty = 
                          BEGIN bb := bool(booking = {})
                          END
END