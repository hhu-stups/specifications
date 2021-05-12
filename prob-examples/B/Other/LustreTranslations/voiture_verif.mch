MACHINE voiture_verif

INCLUDES Node_1.voiture, Node_2.excludes2, Node_3.Sofar

SEES LibraryLustre

VARIABLES voiture_verif_is_initialisation, voiture_verif_var_dist, voiture_verif_var_OK, voiture_verif_var_env, voiture_verif_var_speed

SETS voiture_verif_clocks = {voiture_verif_clock___basic__}

INVARIANT ((voiture_verif_is_initialisation : voiture_verif_clocks --> BOOL) & ((voiture_verif_var_speed : REF +-> INTEGER) & ((voiture_verif_var_env : REF +-> BOOL) & ((voiture_verif_var_OK : REF +-> BOOL) & ((voiture_verif_var_dist : REF +-> INTEGER) & (((voiture_verif_is_initialisation(voiture_verif_clock___basic__) = FALSE) => (voiture_verif_var_env /= {})) & ((voiture_verif_is_initialisation(voiture_verif_clock___basic__) = FALSE) => (voiture_verif_var_OK = {ref |-> TRUE}))))))))

INITIALISATION 
    voiture_verif_is_initialisation := (voiture_verif_clocks * {TRUE}); 
    voiture_verif_var_dist := {}; 
    voiture_verif_var_OK := {}; 
    voiture_verif_var_env := {}; 
    voiture_verif_var_speed := {}


OPERATIONS 

    voiture_verif_clock_step(voiture_verif_param_m, voiture_verif_param_s) = 
        PRE
            ((voiture_verif_param_m : REF +-> BOOL) & (voiture_verif_param_s : REF +-> BOOL))
        THEN
            VAR voiture_verif_var_s, voiture_verif_var_m, voiture_verif_var_bump, voiture_verif_var_move, voiture_verif_var_meter, voiture_verif_var_stop, voiture_verif_var_second, voiture_verif_var_toofast, voiture_verif_var_time IN
                voiture_verif_var_m := voiture_verif_param_m; 
                voiture_verif_var_s := voiture_verif_param_s; 
                Node_1.voiture_clock_step(voiture_verif_var_m, voiture_verif_var_s); 
                voiture_verif_var_toofast := Node_1.voiture_var_toofast; 
                voiture_verif_var_stop := Node_1.voiture_var_stop; 
                voiture_verif_var_bump := Node_1.voiture_var_bump; 
                voiture_verif_var_dist := Node_1.voiture_var_dist; 
                voiture_verif_var_speed := Node_1.voiture_var_speed; 
                voiture_verif_var_time := Node_1.voiture_var_time; 
                voiture_verif_var_move := Node_1.voiture_var_move; 
                voiture_verif_var_second := Node_1.voiture_var_second; 
                voiture_verif_var_meter := Node_1.voiture_var_meter; 
                Node_2.excludes2_clock_step(voiture_verif_var_m, voiture_verif_var_s); 
                Node_3.Sofar_clock_step(l_and(Node_2.excludes2_var_excludes |-> l_less(voiture_verif_var_dist |-> {ref |-> 32767}))); 
                voiture_verif_var_env := Node_3.Sofar_var_Sofar; 
                ASSERT (voiture_verif_var_env = {ref |-> TRUE}) THEN skip END
; 
                voiture_verif_var_OK := l_and(l_greater_equal(voiture_verif_var_dist |-> {ref |-> 0}) |-> l_and(l_less(voiture_verif_var_dist |-> {ref |-> 11}) |-> l_and(l_less(voiture_verif_var_speed |-> {ref |-> 4}) |-> l_greater_equal(voiture_verif_var_speed |-> {ref |-> 0})))); 
                voiture_verif_is_initialisation(voiture_verif_clock___basic__) := FALSE

            END

        END



END