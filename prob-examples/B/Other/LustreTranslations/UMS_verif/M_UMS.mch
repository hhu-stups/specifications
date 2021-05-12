MACHINE M_UMS

SEES LibraryLustre

VARIABLES is_initialisation, var_grant_access, var_grant_exit, var_do_AB, var_do_BC

SETS M_UMS_clocks = {M_UMS_clock}

INVARIANT ((is_initialisation : M_UMS_clocks --> BOOL) & ((var_do_BC : LUSTRE_BOOL) & ((var_do_AB : LUSTRE_BOOL) & ((var_grant_exit : LUSTRE_BOOL) & (var_grant_access : LUSTRE_BOOL)))))

INITIALISATION 
    is_initialisation := (M_UMS_clocks * {TRUE}); 
    var_grant_access := {}; 
    var_grant_exit := {}; 
    var_do_AB := {}; 
    var_do_BC := {}


OPERATIONS 

    clock_step(param_on_A, param_on_B, param_on_C, param_ack_AB, param_ack_BC) = 
        PRE
            ((param_on_A : LUSTRE_BOOL) & ((param_on_B : LUSTRE_BOOL) & ((param_on_C : LUSTRE_BOOL) & ((param_ack_AB : LUSTRE_BOOL) & (param_ack_BC : LUSTRE_BOOL)))))
        THEN
            VAR var_on_A, var_on_B, var_on_C, var_ack_AB, var_ack_BC, var_empty_section, var_only_on_B IN
                var_on_A := param_on_A; 
                var_on_B := param_on_B; 
                var_on_C := param_on_C; 
                var_ack_AB := param_ack_AB; 
                var_ack_BC := param_ack_BC; 
                var_empty_section := l_not(l_or(var_on_A |-> l_or(var_on_B |-> var_on_C))); 
                var_only_on_B := l_and(var_on_B |-> l_not(l_or(var_on_A |-> var_on_C))); 
                var_grant_access := l_and(var_empty_section |-> var_ack_AB); 
                var_grant_exit := l_and(var_only_on_B |-> var_ack_BC); 
                var_do_AB := l_and(l_not(var_ack_AB) |-> var_empty_section); 
                var_do_BC := l_and(l_not(var_ack_BC) |-> var_only_on_B); 
                is_initialisation(M_UMS_clock) := FALSE

            END

        END



END