MACHINE Server

SETS
  Process = {p1,p2}
  
VARIABLES
  logged_in
  
INVARIANT
  logged_in : POW(Process)
  
INITIALISATION
  logged_in := {}
  
OPERATIONS

  LogIn(pp) =
    PRE pp: Process & pp /: logged_in THEN
      logged_in := logged_in \/ {pp}
    END;
    
  LogOut(pp) =
    PRE pp: Process & pp: logged_in THEN
      logged_in := logged_in - {pp}
    END
    
END