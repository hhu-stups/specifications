MODEL TrainCtrl2_Mch4
SETS OPR_MODES={ATPF,ATPR,BYPAS}
CONSTANTS D,D1,D2
PROPERTIES (D : NATURAL) & (D = 600) & (D1 : NATURAL) & (D2 : NATURAL) & ((D2 + D1) <= D)
VARIABLES CBTC_status,EB_triggered,clk,console_switch,ctrl_mode,fetch_flag,fetch_time,swchng_flag,swchng_time,update_flag,update_time
INVARIANT (console_switch : OPR_MODES) & (ctrl_mode : OPR_MODES) & (CBTC_status : BOOL) & (EB_triggered : BOOL) & (clk : NATURAL) & (swchng_time : NATURAL) & (swchng_flag : BOOL) & (update_flag : BOOL) & (update_time : NATURAL) & ((swchng_flag = TRUE) => ((clk - swchng_time) <= D)) & ((update_flag = TRUE) => ((clk - update_time) <= D)) & (fetch_flag : BOOL) & ((fetch_flag = TRUE) => (swchng_flag = TRUE)) & ((fetch_flag = TRUE) => (update_flag = TRUE)) & (fetch_time : NATURAL) & (((swchng_flag = TRUE) & (fetch_flag = FALSE)) => ((clk - swchng_time) <= D1)) & (((update_flag = TRUE) & (fetch_flag = FALSE)) => ((clk - update_time) <= D1)) & ((fetch_flag = TRUE) => ((fetch_time - swchng_time) <= D1)) & ((fetch_flag = TRUE) => ((fetch_time - update_time) <= D1)) & CBTC_status:BOOL & EB_triggered:BOOL & clk:INTEGER & console_switch:OPR_MODES & ctrl_mode:OPR_MODES & fetch_flag:BOOL & fetch_time:INTEGER & swchng_flag:BOOL & swchng_time:INTEGER & update_flag:BOOL & update_time:INTEGER

DEFINITIONS
SET_PREF_SHOW_EVENTB_ANY_VALUES==TRUE 
INITIALISATION console_switch := ATPR || ctrl_mode := ATPR || CBTC_status := FALSE || EB_triggered := FALSE || clk := 0 || swchng_time := 0 || swchng_flag := FALSE || update_flag := FALSE || update_time := 0 || fetch_flag := FALSE || fetch_time := 0
OPERATIONS
 Select_Operating_Mode = SELECT (swchng_flag = FALSE) THEN console_switch :: OPR_MODES || swchng_flag := TRUE || swchng_time := clk END ;
 Update_Train_Position = SELECT (update_flag = FALSE) THEN CBTC_status :: BOOL || update_flag := TRUE || update_time := clk END ;
 Polling = SELECT (swchng_flag = TRUE) & (update_flag = TRUE) & (fetch_flag = FALSE) THEN fetch_flag := TRUE || fetch_time := clk END ;
 Set_Operation_Mode1 = SELECT (console_switch = ATPF) & (CBTC_status = TRUE) & (fetch_flag = TRUE) THEN ctrl_mode := console_switch || EB_triggered := FALSE || swchng_flag := FALSE || update_flag := FALSE || fetch_flag := FALSE END ;
 Set_Operation_Mode2 = SELECT (console_switch = ATPF) & (CBTC_status = FALSE) & (fetch_flag = TRUE) THEN ctrl_mode := ATPR || EB_triggered := TRUE || swchng_flag := FALSE || update_flag := FALSE || fetch_flag := FALSE END ;
 Set_Operation_Mode3 = SELECT (console_switch = ATPR) & (fetch_flag = TRUE) THEN ctrl_mode := console_switch || EB_triggered := FALSE || swchng_flag := FALSE || update_flag := FALSE || fetch_flag := FALSE END ;
 Set_Operation_Mode4 = SELECT (console_switch = BYPAS) & (fetch_flag = TRUE) THEN ctrl_mode := console_switch || EB_triggered := TRUE || swchng_flag := FALSE || update_flag := FALSE || fetch_flag := FALSE END ;
 Tick = ANY clk1 WHERE (clk1 : NATURAL) & (clk1 > clk) & (((fetch_flag = FALSE) & (swchng_flag = TRUE)) => ((clk1 - swchng_time) <= D1)) & (((fetch_flag = FALSE) & (update_flag = TRUE)) => ((clk1 - update_time) <= D1)) & ((fetch_flag = TRUE) => ((clk1 - fetch_time) <= D2)) THEN clk := clk1 END 
END
