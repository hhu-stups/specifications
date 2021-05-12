MACHINE excludes2

SEES LibraryLustre

VARIABLES excludes2_is_initialisation, excludes2_var_excludes

SETS excludes2_clocks = {excludes2_clock___basic__}

INVARIANT ((excludes2_is_initialisation : excludes2_clocks --> BOOL) & (excludes2_var_excludes : REF +-> BOOL))

INITIALISATION 
    excludes2_is_initialisation := (excludes2_clocks * {TRUE}); 
    excludes2_var_excludes := {}


OPERATIONS 

    excludes2_clock_step(excludes2_param_X1, excludes2_param_X2) = 
        PRE
            ((excludes2_param_X1 : REF +-> BOOL) & (excludes2_param_X2 : REF +-> BOOL))
        THEN
            VAR excludes2_var_X2, excludes2_var_X1 IN
                excludes2_var_X1 := excludes2_param_X1; 
                excludes2_var_X2 := excludes2_param_X2; 
                excludes2_var_excludes := l_not(l_and(excludes2_var_X1 |-> excludes2_var_X2)); 
                excludes2_is_initialisation(excludes2_clock___basic__) := FALSE

            END

        END



END