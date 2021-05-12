MACHINE edge

SEES LibraryLustre

VARIABLES edge_is_initialisation, edge_var_EDGE, edge_var_X

SETS edge_clocks = {edge_basic}

INVARIANT ((edge_is_initialisation : edge_clocks --> BOOL) & ((edge_var_X : REF +-> BOOL) & (edge_var_EDGE : REF +-> BOOL)))

INITIALISATION 
    edge_is_initialisation := (edge_clocks * {TRUE}); 
    edge_var_EDGE := {}; 
    edge_var_X := {}


OPERATIONS 

    edge_clock_step(edge_param_X) = 
        PRE
            (edge_param_X : REF +-> BOOL)
        THEN
            VAR edge_X_history IN
                edge_X_history := edge_var_X; 
                edge_var_X := edge_param_X; 
                edge_var_EDGE := l_fby_boolean(edge_is_initialisation(edge_basic) |-> edge_var_X |-> l_and(edge_var_X |-> l_not(edge_X_history))); 
                edge_is_initialisation(edge_basic) := FALSE

            END

        END



END