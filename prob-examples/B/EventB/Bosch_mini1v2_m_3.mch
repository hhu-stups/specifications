MODEL m_3
DEFINITIONS SET_PREF_SHOW_EVENTB_ANY_VALUES==TRUE 
CONSTANTS n,fth,m,rth
PROPERTIES (n > 0) & (m > 0) & (rth : (1 .. (m - 1))) & (fth : (1 .. (m - 1))) & (fth < rth)
VARIABLES c,fe,off,on,output,re
INVARIANT (output : BOOL) & (on : BOOL) & (off : BOOL) & ((output = TRUE) => (on = FALSE)) & ((output = FALSE) => (off = FALSE)) & ((re = TRUE) => (output = FALSE)) & ((re = TRUE) => (on = FALSE)) & ((fe = TRUE) => (output = TRUE)) & ((fe = TRUE) => (off = FALSE)) & (c : (0 .. n))
INITIALISATION output := (FALSE) || on := (FALSE) || off := (FALSE) || re := (FALSE) || fe := (FALSE) || c := (0)
OPERATIONS
 output_FALSE_TRUE = SELECT (output = FALSE) & (on = TRUE) THEN output := (TRUE) || on := (FALSE) END ;
 output_TRUE_FALSE = SELECT (output = TRUE) & (off = TRUE) THEN output := (FALSE) || off := (FALSE) END ;
 on_FALSE_TRUE = SELECT (re = TRUE) & (c = 0) THEN on := (TRUE) || re := (FALSE) END ;
 off_FALSE_TRUE = SELECT (fe = TRUE) & (c = 0) THEN off := (TRUE) || fe := (FALSE) END ;
 re_FALSE_TRUE = ANY input WHERE (output = FALSE) & (on = FALSE) & (re = FALSE) & (input : (0 .. m)) & (input > rth) THEN re := (TRUE) || c := (n) END ;
 re_TRUE_TRUE = ANY input WHERE (re = TRUE) & (c > 0) & (input : (0 .. m)) & (input > rth) THEN c := ((c)-(1)) END ;
 re_TRUE_FALSE = ANY input WHERE (re = TRUE) & (c > 0) & (input : (0 .. m)) & (input < rth) THEN re := (FALSE) || c := (0) END ;
 re_FALSE_FALSE = ANY input WHERE (output = FALSE) & (on = FALSE) & (re = FALSE) & (input : (0 .. m)) & (input < rth) THEN skip END ;
 fe_FALSE_TRUE = ANY input WHERE (output = TRUE) & (off = FALSE) & (fe = FALSE) & (input : (0 .. m)) & (input < fth) THEN fe := (TRUE) || c := (n) END ;
 fe_TRUE_TRUE = ANY input WHERE (fe = TRUE) & (c > 0) & (input : (0 .. m)) & (input < fth) THEN c := ((c)-(1)) END ;
 fe_TRUE_FALSE = ANY input WHERE (fe = TRUE) & (c > 0) & (input : (0 .. m)) & (input > fth) THEN fe := (FALSE) || c := (0) END ;
 fe_FALSE_FALSE = ANY input WHERE (output = TRUE) & (off = FALSE) & (fe = FALSE) & (input : (0 .. m)) & (input > fth) THEN skip END 
END