MODEL Bosch_mini2_m_3
DEFINITIONS SET_PREF_SHOW_EVENTB_ANY_VALUES==TRUE 
CONSTANTS n,m,rth
PROPERTIES (n > 0) & (m > 0) & (rth : (1 .. m)) &
 m>3
VARIABLES c,old_input,output,re,switch
INVARIANT (output : BOOL) & (switch : BOOL) & ((re = TRUE) => (switch = FALSE)) & (c : (0 .. n)) & (old_input : (0 .. m)) & ((switch = TRUE) => (old_input > rth)) & ((re = TRUE) => (old_input > rth))
INITIALISATION output := (FALSE) || switch := (FALSE) || re := (FALSE) || c := (0) || old_input := (0)
OPERATIONS
 output_FALSE_TRUE = SELECT (output = FALSE) & (switch = TRUE) THEN output := (TRUE) || switch := (FALSE) END ;
 output_TRUE_FALSE = SELECT (output = TRUE) & (switch = TRUE) THEN output := (FALSE) || switch := (FALSE) END ;
 switch_FALSE_TRUE = SELECT (re = TRUE) & (c = 0) THEN switch := (TRUE) || re := (FALSE) END ;
 re_FALSE_TRUE = ANY input WHERE (switch = FALSE) & (re = FALSE) & (input : (0 .. m)) & (input > rth) & (old_input < rth) THEN re := (TRUE) || c := (n) || old_input := (input) END ;
 re_TRUE_TRUE = ANY input WHERE (re = TRUE) & (c > 0) & (input : (0 .. m)) & (input > rth) THEN c := ((c)-(1)) || old_input := (input) END ;
 re_TRUE_FALSE = ANY input WHERE (re = TRUE) & (c > 0) & (input : (0 .. m)) & (input < rth) THEN re := (FALSE) || c := (0) || old_input := (input) END ;
 re_FALSE_FALSE = ANY input WHERE (switch = FALSE) & (re = FALSE) & (input : (0 .. m)) & (input < rth) THEN old_input := (input) END 
END