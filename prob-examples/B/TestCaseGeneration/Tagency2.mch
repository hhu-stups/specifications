MACHINE  Tagency2

SETS USER = {u1,u2}; SESSION = {s1}; ROOM =  {r1,r2}

VARIABLES  sess, booking

INVARIANT

   sess    : SESSION +-> USER &
   booking : ROOM    +-> USER

INITIALISATION
               sess := {} || booking := {}

OPERATIONS

login(u) = PRE u : USER & sess = {}  
           THEN
               sess(s1) := u
           END; 



alloc(s) = PRE  s : SESSION & sess /= {} & dom(booking) /= {r1,r2}
           THEN
               IF r1 : dom(booking) 
               THEN booking(r2) := sess(s)
               ELSE
                    booking(r1) := sess(s)
               END
            END;

uu <-- p_alloc_whichUser(s) = PRE s : SESSION & s:dom(sess) THEN
                  uu := sess(s)
              END;

count <-- p_alloc_roomsBooked = BEGIN
                count := card(booking)
                END;

logout(s) = PRE s: SESSION & sess /= {}
            THEN
                 sess :=  {}
            END
END
