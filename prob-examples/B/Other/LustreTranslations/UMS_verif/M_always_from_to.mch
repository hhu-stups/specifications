MACHINE M_always_from_to

INCLUDES Node_15.M_after, Node_16.M_always_since, Node_17.M_once_since, Node_18.M_implies

SEES LibraryLustre

VARIABLES is_initialisation, var_X

SETS M_always_from_to_clocks = {M_always_from_to_clock}

INVARIANT ((is_initialisation : M_always_from_to_clocks --> BOOL) & (var_X : LUSTRE_BOOL))

INITIALISATION 
    is_initialisation := (M_always_from_to_clocks * {TRUE}); 
    var_X := {}


OPERATIONS 

    clock_step(param_B, param_A, param_C) = 
        PRE
            ((param_B : LUSTRE_BOOL) & ((param_A : LUSTRE_BOOL) & (param_C : LUSTRE_BOOL)))
        THEN
            VAR var_B, var_A, var_C IN
                var_B := param_B; 
                var_A := param_A; 
                var_C := param_C; 
                Node_15.clock_step(var_A); 
                Node_16.clock_step(var_B, var_A); 
                Node_17.clock_step(var_C, var_A); 
                Node_18.clock_step(Node_15.var_afterA, l_or(Node_16.var_alwaysBsinceA |-> Node_17.var_onceCsinceA)); 
                var_X := Node_18.var_AimpliesB; 
                is_initialisation(M_always_from_to_clock) := FALSE

            END

        END



END