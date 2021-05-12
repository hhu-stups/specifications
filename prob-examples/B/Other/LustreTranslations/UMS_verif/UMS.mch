MACHINE UMS

SEES LibraryLustre

VARIABLES UMS_is_initialisation, UMS_var_grant_access, UMS_var_grant_exit, UMS_var_do_AB, UMS_var_do_BC

SETS UMS_clocks = {UMS_basic}

INVARIANT ((UMS_is_initialisation : UMS_clocks --> BOOL) & ((UMS_var_do_BC : REF +-> BOOL) & ((UMS_var_do_AB : REF +-> BOOL) & ((UMS_var_grant_exit : REF +-> BOOL) & (UMS_var_grant_access : REF +-> BOOL)))))

INITIALISATION 
    UMS_is_initialisation := (UMS_clocks * {TRUE}); 
    UMS_var_grant_access := {}; 
    UMS_var_grant_exit := {}; 
    UMS_var_do_AB := {}; 
    UMS_var_do_BC := {}


OPERATIONS 

    UMS_clock_step(UMS_param_on_A, UMS_param_on_B, UMS_param_on_C, UMS_param_ack_AB, UMS_param_ack_BC) = 
        PRE
            ((UMS_param_on_A : REF +-> BOOL) & ((UMS_param_on_B : REF +-> BOOL) & ((UMS_param_on_C : REF +-> BOOL) & ((UMS_param_ack_AB : REF +-> BOOL) & (UMS_param_ack_BC : REF +-> BOOL)))))
        THEN
            VAR UMS_var_on_A, UMS_var_on_B, UMS_var_on_C, UMS_var_ack_AB, UMS_var_ack_BC, UMS_var_empty_section, UMS_var_only_on_B IN
                UMS_var_on_A := UMS_param_on_A; 
                UMS_var_on_B := UMS_param_on_B; 
                UMS_var_on_C := UMS_param_on_C; 
                UMS_var_ack_AB := UMS_param_ack_AB; 
                UMS_var_ack_BC := UMS_param_ack_BC; 
                UMS_var_empty_section := l_not(l_or(UMS_var_on_A |-> l_or(UMS_var_on_B |-> UMS_var_on_C))); 
                UMS_var_only_on_B := l_and(UMS_var_on_B |-> l_not(l_or(UMS_var_on_A |-> UMS_var_on_C))); 
                UMS_var_grant_access := l_and(UMS_var_empty_section |-> UMS_var_ack_AB); 
                UMS_var_grant_exit := l_and(UMS_var_only_on_B |-> UMS_var_ack_BC); 
                UMS_var_do_AB := l_and(l_not(UMS_var_ack_AB) |-> UMS_var_empty_section); 
                UMS_var_do_BC := l_and(l_not(UMS_var_ack_BC) |-> UMS_var_only_on_B); 
                UMS_is_initialisation(UMS_basic) := FALSE

            END

        END



END