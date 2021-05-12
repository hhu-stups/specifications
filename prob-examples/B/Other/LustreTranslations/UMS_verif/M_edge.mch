MACHINE M_edge

SEES LibraryLustre

VARIABLES is_initialisation, var_EDGE, var_X

SETS M_edge_clocks = {M_edge_clock}

INVARIANT ((is_initialisation : M_edge_clocks --> BOOL) & ((var_X : LUSTRE_BOOL) & (var_EDGE : LUSTRE_BOOL)))

INITIALISATION 
    is_initialisation := (M_edge_clocks * {TRUE}); 
    var_EDGE := {}; 
    var_X := {}


OPERATIONS 

    clock_step(param_X) = 
        PRE
            (param_X : LUSTRE_BOOL)
        THEN
            VAR hvar_X IN
                hvar_X := var_X; 
                var_X := param_X; 
                var_EDGE := l_fby_boolean(is_initialisation(M_edge_clock) |-> var_X |-> l_and(var_X |-> l_not(hvar_X))); 
                is_initialisation(M_edge_clock) := FALSE

            END

        END



END