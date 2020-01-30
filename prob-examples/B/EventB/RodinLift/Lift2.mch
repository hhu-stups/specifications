MODEL Lift2
DEFINITIONS SET_PREF_SHOW_EVENTB_ANY_VALUES==TRUE;
  Rconv == (topf-r+groundf);
  ANIMATION_FUNCTION == ( {r,c,i|r:groundf..topf & ((c=2 & i=0) or (c=1 & i=2))} <+ 
                            ({r,c,i|r:groundf..topf & Rconv:call_buttons & c=2 & i=1} \/
                             {r,c,i|r:groundf..topf & Rconv=cur_floor & c=1 & ((door_open=TRUE & i=3) or (door_open=FALSE & i=4))}
                              ) \/ {r,c,i| r=topf+1 & c=1 & 
                                       ((direction_up=TRUE & i=5) or (direction_up=FALSE & i=6)) } );
      ANIMATION_IMG0 == "images/CallButtonOff.gif";
      ANIMATION_IMG1 == "images/CallButtonOn.gif";
      ANIMATION_IMG2 == "images/LiftEmpty.gif";
      ANIMATION_IMG3 == "images/LiftOpen.gif";
      ANIMATION_IMG4 == "images/LiftClosed.gif";
      ANIMATION_IMG5 == "images/up_arrow.gif";
      ANIMATION_IMG6 == "images/down_arrow.gif"
CONSTANTS groundf,topf
PROPERTIES (topf : INTEGER) & (groundf : INTEGER) & (groundf = -1) & (topf = 2) & (groundf < topf)
VARIABLES call_buttons,cur_floor,direction_up,do_count,door_open
INVARIANT (cur_floor : (groundf .. topf)) & (door_open : BOOL) & (call_buttons : POW((groundf .. topf))) & (direction_up : BOOL) & ((door_open = TRUE) => (cur_floor : call_buttons)) & (do_count : (0 .. 3))
INITIALISATION cur_floor := (groundf) || door_open := (FALSE) || call_buttons := ({}) || direction_up := (TRUE) || do_count := (0)
OPERATIONS
 move_up = SELECT (door_open = FALSE) & (cur_floor < topf) & (direction_up = TRUE) & # c.((c : INTEGER) & ((c : INTEGER) & (c > cur_floor) & (c : call_buttons))) & (cur_floor /: call_buttons) THEN do_count := (0) || cur_floor := ((cur_floor)+(1)) END ;
 move_down = SELECT (door_open = FALSE) & (cur_floor > groundf) & (direction_up = FALSE) & # cu.((cu : INTEGER) & ((cu : INTEGER) & (cu < cur_floor) & (cu : call_buttons))) & (cur_floor /: call_buttons) THEN do_count := (0) || cur_floor := ((cur_floor)-(1)) END ;
 reverse_lift_up = SELECT (direction_up = FALSE) & (door_open = FALSE) & # c.((c : INTEGER) & ((c : INTEGER) & (c > cur_floor) & (c : call_buttons))) & ! l.((l : INTEGER) => (((l : INTEGER) & (l <= cur_floor) & (l >= groundf)) => (l /: call_buttons))) THEN direction_up := (TRUE) END ;
 open_door = SELECT (door_open = FALSE) & (cur_floor : call_buttons) THEN door_open := (TRUE) END ;
 close_door = SELECT (door_open = TRUE) THEN door_open := (FALSE) || call_buttons := ((call_buttons)\({cur_floor})) END ;
 push_call_button = ANY floor WHERE (floor : (groundf .. topf)) & (floor /: call_buttons) & (floor /= cur_floor) THEN call_buttons := ((call_buttons)\/({floor})) END ;
 reverse_lift_down = SELECT (direction_up = TRUE) & # c.((c : INTEGER) & ((c : INTEGER) & (c < cur_floor) & (c : call_buttons))) & ! u.((u : INTEGER) => (((u : INTEGER) & (u >= cur_floor) & (u <= topf)) => (u /: call_buttons))) THEN direction_up := (FALSE) END ;
 push_call_button_cur_floor = SELECT (cur_floor /: call_buttons) & (do_count < 3) THEN call_buttons := ((call_buttons)\/({cur_floor})) || do_count := ((do_count)+(1)) END 
END