MODEL m3
SETS Color={green,red};Sensor={on,off}
CONSTANTS d
PROPERTIES (d : NATURAL) & (d > 0) & not((on = off))
VARIABLES A,B,C,IL_IN_SR,IL_OUT_SR,ML_IN_SR,ML_OUT_SR,a,b,c,il_in_10,il_out_10,il_pass,il_tl,ml_in_10,ml_out_10,ml_pass,ml_tl
INVARIANT (a : NATURAL) & (b : NATURAL) & (c : NATURAL) & ((a = 0) or (c = 0)) & (ml_tl : Color) & (il_tl : Color) & ((ml_tl = green) => (c = 0)) & ((ml_tl = green) => ((a + b + c) < d)) & ((il_tl = green) => (a = 0)) & ((il_tl = green) => (b > 0)) & (il_pass : (0 .. 1)) & (ml_pass : (0 .. 1)) & ((ml_tl = red) => (ml_pass = 1)) & ((il_tl = red) => (il_pass = 1)) & ((il_tl = red) or (ml_tl = red)) & ((IL_IN_SR = on) => (A > 0)) & ((IL_OUT_SR = on) => (B > 0)) & ((ML_IN_SR = on) => (C > 0)) & ((ml_out_10 = TRUE) => (ml_tl = green)) & ((il_out_10 = TRUE) => (il_tl = green)) & ((IL_IN_SR = on) => (il_in_10 = FALSE)) & ((IL_OUT_SR = on) => (il_out_10 = FALSE)) & ((ML_IN_SR = on) => (ml_in_10 = FALSE)) & ((ML_OUT_SR = on) => (ml_out_10 = FALSE)) & (((il_in_10 = TRUE) & (ml_out_10 = TRUE)) => (A = a)) & (((il_in_10 = FALSE) & (ml_out_10 = TRUE)) => (A = (a + 1))) & (((il_in_10 = TRUE) & (ml_out_10 = FALSE)) => (A = (a - 1))) & (((il_in_10 = FALSE) & (ml_out_10 = FALSE)) => (A = a)) & (((il_in_10 = TRUE) & (il_out_10 = TRUE)) => (B = b)) & (((il_in_10 = TRUE) & (il_out_10 = FALSE)) => (B = (b + 1))) & (((il_in_10 = FALSE) & (il_out_10 = TRUE)) => (B = (b - 1))) & (((il_in_10 = FALSE) & (il_out_10 = FALSE)) => (B = b)) & (((il_out_10 = TRUE) & (ml_in_10 = TRUE)) => (C = c)) & (((il_out_10 = TRUE) & (ml_in_10 = FALSE)) => (C = (c + 1))) & (((il_out_10 = FALSE) & (ml_in_10 = TRUE)) => (C = (c - 1))) & (((il_out_10 = FALSE) & (ml_in_10 = FALSE)) => (C = c)) & ((A = 0) or (C = 0)) & ((A + B + C) <= d) & (A : NATURAL) & (B : NATURAL) & (C : NATURAL) & A:INTEGER & B:INTEGER & C:INTEGER & IL_IN_SR:Sensor & IL_OUT_SR:Sensor & ML_IN_SR:Sensor & ML_OUT_SR:Sensor & a:INTEGER & b:INTEGER & c:INTEGER & il_in_10:BOOL & il_out_10:BOOL & il_pass:INTEGER & il_tl:Color & ml_in_10:BOOL & ml_out_10:BOOL & ml_pass:INTEGER & ml_tl:Color

DEFINITIONS
SET_PREF_SHOW_EVENTB_ANY_VALUES==TRUE
INITIALISATION a := 0 || b := 0 || c := 0 || ml_tl := red || il_tl := red || ml_pass := 1 || il_pass := 1 || ml_out_10 := FALSE || il_out_10 := FALSE || ml_in_10 := FALSE || il_in_10 := FALSE || A := 0 || B := 0 || C := 0 || ML_IN_SR := off || ML_OUT_SR := off || IL_OUT_SR := off || IL_IN_SR := off
OPERATIONS
ÊML_out1 = SELECT (ml_out_10 = TRUE) & ((a + b + 1) < d) THEN a := (a + 1) || ml_pass := 1 || ml_out_10 := FALSE END ;
ÊML_out2 = SELECT (ml_out_10 = TRUE) & ((a + b + 1) = d) THEN a := (a + 1) || ml_tl := red || ml_pass := 1 || ml_out_10 := FALSE END ;
ÊIL_out1 = SELECT (il_out_10 = TRUE) & (b > 1) THEN b := (b - 1) || c := (c + 1) || il_pass := 1 || il_out_10 := FALSE END ;
ÊIL_out2 = SELECT (il_out_10 = TRUE) & (b = 1) THEN b := (b - 1) || il_tl := red || c := (c + 1) || il_pass := 1 || il_out_10 := FALSE END ;
ÊML_tl_green = SELECT (ml_tl = red) & ((a + b) < d) & (c = 0) & (il_pass = 1) & (il_out_10 = FALSE) & (ML_OUT_SR = on) THEN ml_tl := green || il_tl := red || ml_pass := 0 END ;
ÊIL_tl_green = SELECT (il_tl = red) & (0 < b) & (a = 0) & (ml_pass = 1) & (ml_out_10 = FALSE) & (IL_OUT_SR = on) THEN il_tl := green || ml_tl := red || il_pass := 0 END ;
ÊML_in = SELECT (ml_in_10 = TRUE) & (c > 0) THEN c := (c - 1) || ml_in_10 := FALSE END ;
ÊIL_in = SELECT (il_in_10 = TRUE) & (0 < a) THEN a := (a - 1) || b := (b + 1) || il_in_10 := FALSE END ;
ÊML_OUT_ARR = SELECT (ML_OUT_SR = off) & (ml_out_10 = FALSE) THEN ML_OUT_SR := on END ;
ÊML_IN_ARR = SELECT (ML_IN_SR = off) & (ml_in_10 = FALSE) & (C > 0) THEN ML_IN_SR := on END ;
ÊIL_IN_ARR = SELECT (IL_IN_SR = off) & (il_in_10 = FALSE) & (A > 0) THEN IL_IN_SR := on END ;
ÊIL_OUT_AR = SELECT (IL_OUT_SR = off) & (il_out_10 = FALSE) & (B > 0) THEN IL_OUT_SR := on END ;
ÊML_OUT_DEP = SELECT (ML_OUT_SR = on) & (ml_tl = green) THEN ML_OUT_SR := off || ml_out_10 := TRUE || A := (A + 1) END ;
ÊML_IN_DEP = SELECT (ML_IN_SR = on) THEN ML_IN_SR := off || ml_in_10 := TRUE || C := (C - 1) END ;
ÊIL_IN_DEP = SELECT (IL_IN_SR = on) THEN IL_IN_SR := off || il_in_10 := TRUE || A := (A - 1) || B := (B + 1) END ;
ÊIL_OUT_DEP = SELECT (IL_OUT_SR = on) & (il_tl = green) THEN IL_OUT_SR := off || il_out_10 := TRUE || B := (B - 1) || C := (C + 1) ENDÊ
END
