MACHINE M_after

SEES LibraryLustre

VARIABLES is_initialisation, var_afterA, var_tmp_0

SETS M_after_clocks = {M_after_clock}

INVARIANT ((is_initialisation : M_after_clocks --> BOOL) & ((var_afterA : LUSTRE_BOOL) & (var_tmp_0 : LUSTRE_BOOL)))

INITIALISATION 
    is_initialisation := (M_after_clocks * {TRUE}); 
    var_afterA := {}; 
    var_tmp_0 := {}


OPERATIONS 

    clock_step(param_A) = 
        PRE
            (param_A : LUSTRE_BOOL)
        THEN
            VAR var_A IN
                var_A := param_A; 
                var_afterA := l_fby_boolean(is_initialisation(M_after_clock) |-> {ref |-> FALSE} |-> var_tmp_0); 
                var_tmp_0 := l_or(var_A |-> var_afterA); 
                is_initialisation(M_after_clock) := FALSE

            END

        END



END