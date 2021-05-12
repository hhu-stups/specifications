MACHINE implies

SEES LibraryLustre

VARIABLES implies_is_initialisation, implies_var_AimpliesB

SETS implies_clocks = {implies_basic}

INVARIANT ((implies_is_initialisation : implies_clocks --> BOOL) & (implies_var_AimpliesB : REF +-> BOOL))

INITIALISATION 
    implies_is_initialisation := (implies_clocks * {TRUE}); 
    implies_var_AimpliesB := {}


OPERATIONS 

    implies_clock_step(implies_param_A, implies_param_B) = 
        PRE
            ((implies_param_A : REF +-> BOOL) & (implies_param_B : REF +-> BOOL))
        THEN
            VAR implies_var_A, implies_var_B IN
                implies_var_A := implies_param_A; 
                implies_var_B := implies_param_B; 
                implies_var_AimpliesB := l_or(l_not(implies_var_A) |-> implies_var_B); 
                implies_is_initialisation(implies_basic) := FALSE

            END

        END



END