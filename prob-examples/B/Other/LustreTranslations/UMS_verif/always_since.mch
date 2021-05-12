MACHINE always_since

INCLUDES Node_19.after

SEES LibraryLustre

VARIABLES always_since_is_initialisation, always_since_var_alwaysBsinceA

SETS always_since_clocks = {always_since_basic}

INVARIANT ((always_since_is_initialisation : always_since_clocks --> BOOL) & (always_since_var_alwaysBsinceA : REF +-> BOOL))

INITIALISATION 
    always_since_is_initialisation := (always_since_clocks * {TRUE}); 
    always_since_var_alwaysBsinceA := {}


OPERATIONS 

    always_since_clock_step(always_since_param_B, always_since_param_A) = 
        PRE
            ((always_since_param_B : REF +-> BOOL) & (always_since_param_A : REF +-> BOOL))
        THEN
            VAR always_since_var_B, always_since_var_A IN
                always_since_var_B := always_since_param_B; 
                always_since_var_A := always_since_param_A; 
                Node_19.after_clock_step(always_since_var_A); 
                always_since_var_alwaysBsinceA := l_ite_boolean(always_since_var_A |-> always_since_var_B |-> l_ite_boolean(Node_19.after_var_afterA |-> l_and(always_since_var_B |-> always_since_var_alwaysBsinceA) |-> {ref |-> TRUE})); 
                always_since_is_initialisation(always_since_basic) := FALSE

            END

        END



END