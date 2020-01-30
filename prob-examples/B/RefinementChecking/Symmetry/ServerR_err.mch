REFINEMENT ServerR_err

REFINES Server

SETS
  SessionID
PROPERTIES
  card(SessionID) = 3
  
VARIABLES
  session
  
INVARIANT
  session : Process +-> SessionID &
   logged_in = dom(session)
  
INITIALISATION
  session := {}
  
OPERATIONS

  LogIn(pp) =
    PRE pp: Process & pp /: dom(session) THEN
     ANY sid WHERE sid: SessionID & sid /: ran(session) THEN
      session := session \/ {pp |-> sid}
     END
    END;
    
  LogOut(pp) =
    PRE pp: Process & dom(session) /= {} /* error here */ THEN
      session := {pp} <<| session 
    END
    
END

