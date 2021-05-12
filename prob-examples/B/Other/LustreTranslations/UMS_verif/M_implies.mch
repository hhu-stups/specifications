MACHINE M_implies

SEES LibraryLustre

VARIABLES is_initialisation, var_AimpliesB

SETS M_implies_clocks = {M_implies_clock}

INVARIANT ((is_initialisation : M_implies_clocks --> BOOL) & (var_AimpliesB : LUSTRE_BOOL))

INITIALISATION 
    is_initialisation := (M_implies_clocks * {TRUE}); 
    var_AimpliesB := {}


OPERATIONS 

    clock_step(param_A, param_B) = 
        PRE
            ((param_A : LUSTRE_BOOL) & (param_B : LUSTRE_BOOL))
        THEN
            VAR var_A, var_B IN
                var_A := param_A; 
                var_B := param_B; 
                var_AimpliesB := l_or(l_not(var_A) |-> var_B); 
                is_initialisation(M_implies_clock) := FALSE

            END

        END



END