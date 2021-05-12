MACHINE once_since

INCLUDES Node_20.after

SEES LibraryLustre

VARIABLES once_since_is_initialisation, once_since_var_onceCsinceA

SETS once_since_clocks = {once_since_basic}

INVARIANT ((once_since_is_initialisation : once_since_clocks --> BOOL) & (once_since_var_onceCsinceA : REF +-> BOOL))

INITIALISATION 
    once_since_is_initialisation := (once_since_clocks * {TRUE}); 
    once_since_var_onceCsinceA := {}


OPERATIONS 

    once_since_clock_step(once_since_param_C, once_since_param_A) = 
        PRE
            ((once_since_param_C : REF +-> BOOL) & (once_since_param_A : REF +-> BOOL))
        THEN
            VAR once_since_var_C, once_since_var_A IN
                once_since_var_C := once_since_param_C; 
                once_since_var_A := once_since_param_A; 
                Node_20.after_clock_step(once_since_var_A); 
                once_since_var_onceCsinceA := l_ite_boolean(once_since_var_A |-> once_since_var_C |-> l_ite_boolean(Node_20.after_var_afterA |-> l_or(once_since_var_C |-> once_since_var_onceCsinceA) |-> {ref |-> TRUE})); 
                once_since_is_initialisation(once_since_basic) := FALSE

            END

        END



END