MACHINE voiture

SEES LibraryLustre

VARIABLES voiture_is_initialisation, voiture_var_stop, voiture_var_move, voiture_var_dist, voiture_var_bump, voiture_var_meter, voiture_var_second, voiture_var_speed, voiture_var_tmp_4, voiture_var_tmp_0, voiture_var_time, voiture_var_tmp_12, voiture_var_tmp_10, voiture_var_tmp_2, voiture_var_tmp_8, voiture_var_tmp_6, voiture_var_toofast

SETS voiture_clocks = {voiture_clock___basic__}

INVARIANT ((voiture_is_initialisation : voiture_clocks --> BOOL) & ((voiture_var_toofast : REF +-> BOOL) & ((voiture_var_tmp_6 : REF +-> INTEGER) & ((voiture_var_tmp_8 : REF +-> INTEGER) & ((voiture_var_tmp_2 : REF +-> INTEGER) & ((voiture_var_tmp_10 : REF +-> INTEGER) & ((voiture_var_tmp_12 : REF +-> INTEGER) & ((voiture_var_time : REF +-> INTEGER) & ((voiture_var_tmp_0 : REF +-> BOOL) & ((voiture_var_tmp_4 : REF +-> INTEGER) & ((voiture_var_speed : REF +-> INTEGER) & ((voiture_var_second : REF +-> BOOL) & ((voiture_var_meter : REF +-> BOOL) & ((voiture_var_bump : REF +-> BOOL) & ((voiture_var_dist : REF +-> INTEGER) & ((voiture_var_move : REF +-> BOOL) & ((voiture_var_stop : REF +-> BOOL) & (((voiture_is_initialisation(voiture_clock___basic__) = FALSE) => (voiture_var_meter /= {})) & (((voiture_is_initialisation(voiture_clock___basic__) = FALSE) => (voiture_var_second /= {})) & (((voiture_is_initialisation(voiture_clock___basic__) = FALSE) => (voiture_var_move /= {})) & (((voiture_is_initialisation(voiture_clock___basic__) = FALSE) => (voiture_var_time /= {})) & (((voiture_is_initialisation(voiture_clock___basic__) = FALSE) => (voiture_var_speed /= {})) & (((voiture_is_initialisation(voiture_clock___basic__) = FALSE) => (voiture_var_dist /= {})) & (((voiture_is_initialisation(voiture_clock___basic__) = FALSE) => (voiture_var_bump /= {})) & (((voiture_is_initialisation(voiture_clock___basic__) = FALSE) => (voiture_var_stop /= {})) & ((voiture_is_initialisation(voiture_clock___basic__) = FALSE) => (voiture_var_toofast /= {})))))))))))))))))))))))))))

INITIALISATION 
    voiture_is_initialisation := (voiture_clocks * {TRUE}); 
    voiture_var_stop := {}; 
    voiture_var_move := {}; 
    voiture_var_dist := {}; 
    voiture_var_bump := {}; 
    voiture_var_meter := {}; 
    voiture_var_second := {}; 
    voiture_var_speed := {}; 
    voiture_var_tmp_4 := {}; 
    voiture_var_tmp_0 := {}; 
    voiture_var_time := {}; 
    voiture_var_tmp_12 := {}; 
    voiture_var_tmp_10 := {}; 
    voiture_var_tmp_2 := {}; 
    voiture_var_tmp_8 := {}; 
    voiture_var_tmp_6 := {}; 
    voiture_var_toofast := {}


OPERATIONS 

    voiture_clock_step(voiture_param_m, voiture_param_s) = 
        PRE
            ((voiture_param_m : REF --> BOOL) & (voiture_param_s : REF --> BOOL))
        THEN
            VAR voiture_tmp_0_history, voiture_tmp_2_history, voiture_tmp_4_history, voiture_tmp_6_history, voiture_tmp_8_history, voiture_tmp_10_history, voiture_tmp_12_history, voiture_var_tmp_13, voiture_var_tmp_1, voiture_var_s, voiture_var_m, voiture_var_tmp_11, voiture_var_tmp_5, voiture_var_tmp_3, voiture_var_tmp_7, voiture_var_tmp_9 IN
                voiture_tmp_0_history := voiture_var_tmp_0; 
                voiture_tmp_2_history := voiture_var_tmp_2; 
                voiture_tmp_4_history := voiture_var_tmp_4; 
                voiture_tmp_6_history := voiture_var_tmp_6; 
                voiture_tmp_8_history := voiture_var_tmp_8; 
                voiture_tmp_10_history := voiture_var_tmp_10; 
                voiture_tmp_12_history := voiture_var_tmp_12; 
                voiture_var_m := voiture_param_m; 
                voiture_var_s := voiture_param_s; 
                voiture_var_meter := l_fby_boolean(voiture_is_initialisation(voiture_clock___basic__) |-> {ref |-> FALSE} |-> l_and(voiture_var_m |-> l_not(voiture_var_s))); 
                voiture_var_second := l_fby_boolean(voiture_is_initialisation(voiture_clock___basic__) |-> {ref |-> FALSE} |-> voiture_var_s); 
                voiture_var_tmp_1 := voiture_tmp_0_history; 
                voiture_var_move := l_fby_boolean(voiture_is_initialisation(voiture_clock___basic__) |-> {ref |-> TRUE} |-> voiture_var_tmp_1); 
                voiture_var_tmp_3 := voiture_tmp_2_history; 
                voiture_var_tmp_5 := voiture_tmp_4_history; 
                voiture_var_dist := l_fby_integer(voiture_is_initialisation(voiture_clock___basic__) |-> {ref |-> 0} |-> l_ite_integer(l_and(voiture_var_move |-> voiture_var_meter) |-> l_plus(voiture_var_tmp_3 |-> {ref |-> 1}) |-> voiture_var_tmp_5)); 
                voiture_var_tmp_7 := voiture_tmp_6_history; 
                voiture_var_tmp_9 := voiture_tmp_8_history; 
                voiture_var_speed := l_fby_integer(voiture_is_initialisation(voiture_clock___basic__) |-> {ref |-> 0} |-> l_ite_integer(l_or(l_not(voiture_var_move) |-> voiture_var_second) |-> {ref |-> 0} |-> l_ite_integer(l_and(voiture_var_move |-> voiture_var_meter) |-> l_plus(voiture_var_tmp_7 |-> {ref |-> 1}) |-> voiture_var_tmp_9))); 
                voiture_var_tmp_11 := voiture_tmp_10_history; 
                voiture_var_tmp_13 := voiture_tmp_12_history; 
                voiture_var_time := l_fby_integer(voiture_is_initialisation(voiture_clock___basic__) |-> {ref |-> 0} |-> l_ite_integer(voiture_var_second |-> l_plus(voiture_var_tmp_11 |-> {ref |-> 1}) |-> voiture_var_tmp_13)); 
                voiture_var_toofast := l_greater_equal(voiture_var_speed |-> {ref |-> 3}); 
                voiture_var_stop := l_greater_equal(voiture_var_time |-> {ref |-> 4}); 
                voiture_var_bump := l_equal_integer(voiture_var_dist |-> {ref |-> 10}); 
                voiture_var_tmp_0 := l_and(voiture_var_move |-> l_and(l_not(voiture_var_stop) |-> l_and(l_not(voiture_var_toofast) |-> l_not(voiture_var_bump)))); 
                voiture_var_tmp_2 := voiture_var_dist; 
                voiture_var_tmp_4 := voiture_var_dist; 
                voiture_var_tmp_6 := voiture_var_speed; 
                voiture_var_tmp_8 := voiture_var_speed; 
                voiture_var_tmp_10 := voiture_var_time; 
                voiture_var_tmp_12 := voiture_var_time; 
                voiture_is_initialisation(voiture_clock___basic__) := FALSE

            END

        END



END