MACHINE
   switching
INCLUDES
    layout
VARIABLES
    switches_left,
    switches_right,
    connected
INVARIANT
      switches_left <: switches
    & switches_right <: switches
    & switches_left /\ switches_right = {}
    & switches_left \/ switches_right = switches
    
    & connected : (SECTION-end_tracks) --> SECTION
    & connected = track_next
      \/ (switches_left <| switch_next_left)
      \/ (switches_right <| switch_next_right)
      
INITIALISATION
      switches_left,switches_right := switches,{}
    || connected := track_next \/ switch_next_left
OPERATIONS
   switch_move_left(switch) = 
   PRE switch:switches
   THEN 
        switches_left := switches_left \/ {switch}
     || switches_right := switches_right - {switch}
     || connected(switch) := switch_next_left(switch)
   END;

   switch_move_right(switch) =
   PRE switch:switches
   THEN
       switches_right := switches_right \/ {switch}
     || switches_left := switches_left - {switch}
     || connected(switch) := switch_next_right(switch)
   END
END
