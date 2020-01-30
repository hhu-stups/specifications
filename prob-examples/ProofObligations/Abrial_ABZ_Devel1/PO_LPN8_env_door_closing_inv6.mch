MACHINE PO_LPN8_env_door_closing_inv6
CONSTANTS three_door_open,i,three_door_closed,door_open,door_closed
PROPERTIES
 not(!(i0).(i0 : {1,2,3} => (three_door_open <+ {i |-> FALSE})(i0) = FALSE or three_door_closed(i0) = FALSE)) & 
 three_door_open : {1,2,3} --> BOOL &
 three_door_closed : {1,2,3} --> BOOL &
 ( door_open = TRUE => three_door_open = {1,2,3} * {TRUE}) &
 ( door_closed = TRUE => three_door_closed = {1,2,3} * {TRUE}) &
 !(i).(i : {1,2,3} => three_door_open(i) = FALSE or three_door_closed(i) = FALSE) & 
 (door_open = FALSE or door_closed = FALSE) &
 (i<1 or i:1..3 or i>3)
END

