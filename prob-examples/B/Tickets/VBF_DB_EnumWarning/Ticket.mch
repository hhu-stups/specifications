MACHINE Ticket
SETS
  Timer = {MUTE_TIMER, WAIT_INTEGRITY_TIMER, SHADOW_TRAIN_TIMER_A, SHADOW_TRAIN_TIMER_B,GHOST_TRAIN_PROPAGATION_TIMER}
DEFINITIONS
  SET_PREF_STRICT_RAISE_ENUM_WARNINGS == TRUE;
  TEST ==
{xx|#(name,kind,value).(name |-> kind |-> value : 
{(("1"|->MUTE_TIMER)|->421188),
(("1"|->WAIT_INTEGRITY_TIMER)|->271188),
(("TTD1"|->SHADOW_TRAIN_TIMER_A)|->-1),
(("TTD1"|->SHADOW_TRAIN_TIMER_B)|->-1),
(("TTD1"|->GHOST_TRAIN_PROPAGATION_TIMER)|->60103760),
(("TTD2"|->SHADOW_TRAIN_TIMER_A)|->-1),
(("TTD2"|->SHADOW_TRAIN_TIMER_B)|->-1),
(("TTD2"|->GHOST_TRAIN_PROPAGATION_TIMER)|->60113045)
} &
 xx = rec(kind:kind,name:name)
)}
CONSTANTS UI_Timers
PROPERTIES
 UI_Timers = TEST
END