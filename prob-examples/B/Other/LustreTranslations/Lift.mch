MACHINE Lift

VARIABLES Lift_is_initialisation, Lift_var_exec_up, Lift_var_down, Lift_var_exec_down, Lift_var_old_floor, Lift_var_floor, Lift_var_tmp_1, Lift_var_tmp_0, Lift_var_up

SETS Lift_clocks = {Lift_clock___basic__}; Lift_refs = {Lift_ref}

INVARIANT ((Lift_is_initialisation : Lift_clocks --> BOOL) & ((Lift_var_exec_up : Lift_refs +-> BOOL) & ((Lift_var_down : Lift_refs +-> BOOL) & ((Lift_var_exec_down : Lift_refs +-> BOOL) & ((Lift_var_old_floor : Lift_refs +-> INTEGER) & ((Lift_var_floor : Lift_refs +-> INTEGER) & ((Lift_var_tmp_1 : Lift_refs +-> INTEGER) & ((Lift_var_tmp_0 : Lift_refs +-> INTEGER) & ((Lift_var_up : Lift_refs +-> BOOL) & (((Lift_is_initialisation(Lift_clock___basic__) = FALSE) => (Lift_var_exec_up /= {})) & (((Lift_is_initialisation(Lift_clock___basic__) = FALSE) => (Lift_var_exec_down /= {})) & ((Lift_is_initialisation(Lift_clock___basic__) = FALSE) => (Lift_var_floor /= {})))))))))))))

INITIALISATION 
    Lift_is_initialisation := (Lift_clocks * {TRUE}); 
    Lift_var_exec_up := {}; 
    Lift_var_down := {}; 
    Lift_var_exec_down := {}; 
    Lift_var_old_floor := {}; 
    Lift_var_floor := {}; 
    Lift_var_tmp_1 := {}; 
    Lift_var_tmp_0 := {}; 
    Lift_var_up := {}


OPERATIONS 

    Lift_clock_step(Lift_param_up, Lift_param_down) = 
        PRE
            ((Lift_param_up : BOOL) & (Lift_param_down : BOOL))
        THEN
            VAR Lift_exec_up_history, Lift_down_history, Lift_exec_down_history, Lift_old_floor_history, Lift_floor_history, Lift_tmp_1_history, Lift_tmp_0_history, Lift_up_history IN
                Lift_exec_up_history := Lift_var_exec_up; 
                Lift_down_history := Lift_var_down; 
                Lift_exec_down_history := Lift_var_exec_down; 
                Lift_old_floor_history := Lift_var_old_floor; 
                Lift_floor_history := Lift_var_floor; 
                Lift_tmp_1_history := Lift_var_tmp_1; 
                Lift_tmp_0_history := Lift_var_tmp_0; 
                Lift_up_history := Lift_var_up; 
                Lift_var_up(Lift_ref) := bool((Lift_param_up = TRUE)); 
                Lift_var_down(Lift_ref) := bool((Lift_param_down = TRUE)); 
                IF (Lift_tmp_0_history /= {}) THEN 
                    Lift_var_tmp_1(Lift_ref) := Lift_tmp_0_history(Lift_ref)
                ELSE 
                    Lift_var_tmp_1 := {}
                END; 
                IF (not((Lift_is_initialisation(Lift_clock___basic__) = TRUE)) => (Lift_var_tmp_1 /= {})) THEN 
                    Lift_var_old_floor(Lift_ref) := IF (Lift_is_initialisation(Lift_clock___basic__) = TRUE) THEN 0 ELSE Lift_var_tmp_1(Lift_ref) END
                ELSE 
                    Lift_var_old_floor := {}
                END; 
                IF ((Lift_var_up /= {}) & (Lift_var_old_floor /= {})) THEN 
                    Lift_var_exec_up(Lift_ref) := bool(((Lift_var_up(Lift_ref) = TRUE) & (Lift_var_old_floor(Lift_ref) < 100)))
                ELSE 
                    Lift_var_exec_up := {}
                END; 
                IF ((Lift_var_down /= {}) & (Lift_var_old_floor /= {})) THEN 
                    Lift_var_exec_down(Lift_ref) := bool(((Lift_var_down(Lift_ref) = TRUE) & (Lift_var_old_floor(Lift_ref) > 0)))
                ELSE 
                    Lift_var_exec_down := {}
                END; 
                IF ((Lift_var_exec_up /= {}) & (((Lift_var_exec_up(Lift_ref) = TRUE) => (Lift_var_old_floor /= {})) or (not((Lift_var_exec_up(Lift_ref) = TRUE)) => ((Lift_var_exec_down /= {}) & (((Lift_var_exec_down(Lift_ref) = TRUE) => (Lift_var_old_floor /= {})) or (not((Lift_var_exec_down(Lift_ref) = TRUE)) => (Lift_var_old_floor /= {}))))))) THEN 
                    Lift_var_floor(Lift_ref) := IF (Lift_var_exec_up(Lift_ref) = TRUE) THEN (Lift_var_old_floor(Lift_ref) + 1) ELSE IF (Lift_var_exec_down(Lift_ref) = TRUE) THEN (Lift_var_old_floor(Lift_ref) - 1) ELSE Lift_var_old_floor(Lift_ref) END END
                ELSE 
                    Lift_var_floor := {}
                END; 
                IF (Lift_var_floor /= {}) THEN 
                    Lift_var_tmp_0(Lift_ref) := Lift_var_floor(Lift_ref)
                ELSE 
                    Lift_var_tmp_0 := {}
                END; 
                Lift_is_initialisation(Lift_clock___basic__) := FALSE

            END

        END



END