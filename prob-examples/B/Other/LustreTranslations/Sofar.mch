MACHINE Sofar

SEES LibraryLustre

VARIABLES Sofar_is_initialisation, Sofar_var_Sofar, Sofar_var_tmp_0

SETS Sofar_clocks = {Sofar_clock___basic__}

INVARIANT ((Sofar_is_initialisation : Sofar_clocks --> BOOL) & ((Sofar_var_tmp_0 : REF +-> BOOL) & (Sofar_var_Sofar : REF +-> BOOL)))

INITIALISATION 
    Sofar_is_initialisation := (Sofar_clocks * {TRUE}); 
    Sofar_var_Sofar := {}; 
    Sofar_var_tmp_0 := {}


OPERATIONS 

    Sofar_clock_step(Sofar_param_X) = 
        PRE
            (Sofar_param_X : REF +-> BOOL)
        THEN
            VAR Sofar_tmp_0_history, Sofar_var_X, Sofar_var_tmp_1 IN
                Sofar_tmp_0_history := Sofar_var_tmp_0; 
                Sofar_var_X := Sofar_param_X; 
                Sofar_var_tmp_1 := Sofar_tmp_0_history; 
                Sofar_var_Sofar := l_fby_boolean(Sofar_is_initialisation(Sofar_clock___basic__) |-> Sofar_var_X |-> l_and(Sofar_var_X |-> Sofar_var_tmp_1)); 
                Sofar_var_tmp_0 := Sofar_var_Sofar; 
                Sofar_is_initialisation(Sofar_clock___basic__) := FALSE

            END

        END



END