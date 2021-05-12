MACHINE speed_verif

INCLUDES Node_2.speed

SEES LibraryLustre

VARIABLES speed_verif_is_initialisation, speed_verif_var_tmp_0, speed_verif_var_OK, speed_verif_var_tmp_2

SETS speed_verif_clocks = {speed_verif_clock___basic__}

INVARIANT ((speed_verif_is_initialisation : speed_verif_clocks --> BOOL) & ((speed_verif_var_tmp_2 : REF +-> BOOL) & ((speed_verif_var_OK : REF +-> BOOL) & ((speed_verif_var_tmp_0 : REF +-> BOOL) & (((speed_verif_is_initialisation(speed_verif_clock___basic__) = FALSE) => (speed_verif_var_OK /= {})) & ((speed_verif_is_initialisation(speed_verif_clock___basic__) = FALSE) => (speed_verif_var_OK = {ref |-> TRUE})))))))

INITIALISATION 
    speed_verif_is_initialisation := (speed_verif_clocks * {TRUE}); 
    speed_verif_var_tmp_0 := {}; 
    speed_verif_var_OK := {}; 
    speed_verif_var_tmp_2 := {}


OPERATIONS 

    speed_verif_clock_step(speed_verif_param_beacon, speed_verif_param_second) = 
        PRE
            ((speed_verif_param_beacon : REF --> BOOL) & (speed_verif_param_second : REF --> BOOL))
        THEN
            VAR speed_verif_tmp_0_history, speed_verif_tmp_2_history, speed_verif_var_late, speed_verif_var_beacon, speed_verif_var_early, speed_verif_var_tmp_1, speed_verif_var_second, speed_verif_var_tmp_3 IN
                speed_verif_tmp_0_history := speed_verif_var_tmp_0; 
                speed_verif_tmp_2_history := speed_verif_var_tmp_2; 
                speed_verif_var_beacon := speed_verif_param_beacon; 
                speed_verif_var_second := speed_verif_param_second; 
                Node_2.speed_clock_step(speed_verif_var_beacon, speed_verif_var_second); 
                speed_verif_var_late := Node_2.speed_var_late; 
                speed_verif_var_early := Node_2.speed_var_early; 
                speed_verif_var_tmp_0 := speed_verif_var_early; 
                speed_verif_var_tmp_1 := speed_verif_tmp_0_history; 
                speed_verif_var_tmp_2 := speed_verif_var_late; 
                speed_verif_var_tmp_3 := speed_verif_tmp_2_history; 
                speed_verif_var_OK := l_and(l_not(l_and(speed_verif_var_late |-> speed_verif_var_early)) |-> l_and(l_fby_boolean(speed_verif_is_initialisation(speed_verif_clock___basic__) |-> {ref |-> TRUE} |-> l_not(l_and(speed_verif_var_late |-> speed_verif_var_tmp_1))) |-> l_fby_boolean(speed_verif_is_initialisation(speed_verif_clock___basic__) |-> {ref |-> TRUE} |-> l_not(l_and(speed_verif_var_tmp_3 |-> speed_verif_var_early))))); 
                speed_verif_is_initialisation(speed_verif_clock___basic__) := FALSE

            END

        END



END