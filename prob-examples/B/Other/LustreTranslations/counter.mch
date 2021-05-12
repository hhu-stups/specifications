MACHINE counter

SEES LibraryLustre

VARIABLES counter_is_initialisation, counter_var_c, counter_var_tmp_0

SETS counter_clocks = {counter_clock___basic__}

INVARIANT ((counter_is_initialisation : counter_clocks --> BOOL) & ((counter_var_tmp_0 : REF +-> INTEGER) & (counter_var_c : REF +-> INTEGER)))

INITIALISATION 
    counter_is_initialisation := (counter_clocks * {TRUE}); 
    counter_var_c := {}; 
    counter_var_tmp_0 := {}


OPERATIONS 

    counter_clock_step(counter_param_init, counter_param_incr, counter_param_x, counter_param_reset) = 
        PRE
            ((counter_param_init : REF +-> INTEGER) & ((counter_param_incr : REF +-> INTEGER) & ((counter_param_x : REF +-> BOOL) & (counter_param_reset : REF +-> BOOL))))
        THEN
            VAR counter_tmp_0_history, counter_var_reset, counter_var_init, counter_var_incr, counter_var_pc, counter_var_tmp_1, counter_var_x IN
                counter_tmp_0_history := counter_var_tmp_0; 
                counter_var_init := counter_param_init; 
                counter_var_incr := counter_param_incr; 
                counter_var_x := counter_param_x; 
                counter_var_reset := counter_param_reset; 
                counter_var_tmp_1 := counter_tmp_0_history; 
                counter_var_pc := l_fby_integer(counter_is_initialisation(counter_clock___basic__) |-> counter_var_init |-> counter_var_tmp_1); 
                counter_var_c := l_ite_integer(counter_var_reset |-> counter_var_init |-> l_ite_integer(l_and(counter_var_x |-> l_and(l_greater(counter_var_pc |-> l_unary_minus({ref |-> 1000})) |-> l_less(counter_var_pc |-> {ref |-> 1000}))) |-> l_plus(counter_var_pc |-> counter_var_incr) |-> counter_var_pc)); 
                counter_var_tmp_0 := counter_var_c; 
                counter_is_initialisation(counter_clock___basic__) := FALSE

            END

        END



END