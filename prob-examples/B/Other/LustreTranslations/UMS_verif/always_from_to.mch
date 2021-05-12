MACHINE always_from_to

INCLUDES Node_15.after, Node_16.always_since, Node_17.once_since, Node_18.implies

SEES LibraryLustre

VARIABLES always_from_to_is_initialisation, always_from_to_var_X

SETS always_from_to_clocks = {always_from_to_basic}

INVARIANT ((always_from_to_is_initialisation : always_from_to_clocks --> BOOL) & (always_from_to_var_X : REF +-> BOOL))

INITIALISATION 
    always_from_to_is_initialisation := (always_from_to_clocks * {TRUE}); 
    always_from_to_var_X := {}


OPERATIONS 

    always_from_to_clock_step(always_from_to_param_B, always_from_to_param_A, always_from_to_param_C) = 
        PRE
            ((always_from_to_param_B : REF +-> BOOL) & ((always_from_to_param_A : REF +-> BOOL) & (always_from_to_param_C : REF +-> BOOL)))
        THEN
            VAR always_from_to_var_B, always_from_to_var_A, always_from_to_var_C IN
                always_from_to_var_B := always_from_to_param_B; 
                always_from_to_var_A := always_from_to_param_A; 
                always_from_to_var_C := always_from_to_param_C; 
                Node_15.after_clock_step(always_from_to_var_A); 
                Node_16.always_since_clock_step(always_from_to_var_B, always_from_to_var_A); 
                Node_17.once_since_clock_step(always_from_to_var_C, always_from_to_var_A); 
                Node_18.implies_clock_step(Node_15.after_var_afterA, l_or(Node_16.always_since_var_alwaysBsinceA |-> Node_17.once_since_var_onceCsinceA)); 
                always_from_to_var_X := Node_18.implies_var_AimpliesB; 
                always_from_to_is_initialisation(always_from_to_basic) := FALSE

            END

        END



END