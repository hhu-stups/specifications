MACHINE M_always_since

INCLUDES Node_19.M_after

SEES LibraryLustre

VARIABLES is_initialisation, var_alwaysBsinceA

SETS M_always_since_clocks = {M_always_since_clock}

INVARIANT ((is_initialisation : M_always_since_clocks --> BOOL) & (var_alwaysBsinceA : LUSTRE_BOOL))

INITIALISATION 
    is_initialisation := (M_always_since_clocks * {TRUE}); 
    var_alwaysBsinceA := {}


OPERATIONS 

    clock_step(param_B, param_A) = 
        PRE
            ((param_B : LUSTRE_BOOL) & (param_A : LUSTRE_BOOL))
        THEN
            VAR var_B, var_A IN
                var_B := param_B; 
                var_A := param_A; 
                Node_19.clock_step(var_A); 
                var_alwaysBsinceA := l_ite_boolean(var_A |-> var_B |-> l_ite_boolean(Node_19.var_afterA |-> l_and(var_B |-> var_alwaysBsinceA) |-> {ref |-> TRUE})); 
                is_initialisation(M_always_since_clock) := FALSE

            END

        END



END