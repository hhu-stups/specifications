MACHINE Lift_verif

INCLUDES Node_1.Lift

VARIABLES Lift_verif_is_initialisation, Lift_verif_var_ok, Lift_verif_var_exec_up, Lift_verif_var_exec_down, Lift_verif_var_down, Lift_verif_var_not_higher_than_highest_floor, Lift_verif_var_floor, Lift_verif_var_not_lower_than_lowest_floor, Lift_verif_var_up, Lift_verif_var_only_exec_up_or_down

SETS Lift_verif_clocks = {Lift_verif_clock___basic__}; Lift_verif_refs = {Lift_verif_ref}

INVARIANT ((Lift_verif_is_initialisation : Lift_verif_clocks --> BOOL) & ((Lift_verif_var_ok : Lift_verif_refs +-> BOOL) & ((Lift_verif_var_exec_up : Lift_verif_refs +-> BOOL) & ((Lift_verif_var_exec_down : Lift_verif_refs +-> BOOL) & ((Lift_verif_var_down : Lift_verif_refs +-> BOOL) & ((Lift_verif_var_not_higher_than_highest_floor : Lift_verif_refs +-> BOOL) & ((Lift_verif_var_floor : Lift_verif_refs +-> INTEGER) & ((Lift_verif_var_not_lower_than_lowest_floor : Lift_verif_refs +-> BOOL) & ((Lift_verif_var_up : Lift_verif_refs +-> BOOL) & ((Lift_verif_var_only_exec_up_or_down : Lift_verif_refs +-> BOOL) & (((Lift_verif_is_initialisation(Lift_verif_clock___basic__) = FALSE) => (Lift_verif_var_ok /= {})) & (((Lift_verif_is_initialisation(Lift_verif_clock___basic__) = FALSE) & ((Lift_verif_var_ok /= {}) & (((Lift_verif_var_up /= {}) & (Lift_verif_var_down /= {})) => not(((Lift_verif_var_up(Lift_verif_ref) = TRUE) & (Lift_verif_var_down(Lift_verif_ref) = TRUE)))))) => (Lift_verif_var_ok(Lift_verif_ref) = TRUE)))))))))))))

INITIALISATION
    Lift_verif_is_initialisation := (Lift_verif_clocks * {TRUE});
    Lift_verif_var_ok := {};
    Lift_verif_var_exec_up := {};
    Lift_verif_var_exec_down := {};
    Lift_verif_var_down := {};
    Lift_verif_var_not_higher_than_highest_floor := {};
    Lift_verif_var_floor := {};
    Lift_verif_var_not_lower_than_lowest_floor := {};
    Lift_verif_var_up := {};
    Lift_verif_var_only_exec_up_or_down := {}


OPERATIONS

    Lift_verif_clock_step(Lift_verif_param_up, Lift_verif_param_down) =
        PRE
            ((Lift_verif_param_up : BOOL) & (Lift_verif_param_down : BOOL))
        THEN
              VAR Lift_verif_ok_history, Lift_verif_exec_up_history, Lift_verif_exec_down_history, Lift_verif_down_history, Lift_verif_not_higher_than_highest_floor_history, Lift_verif_floor_history, Lift_verif_not_lower_than_lowest_floor_history, Lift_verif_up_history, Lift_verif_only_exec_up_or_down_history IN
                  Lift_verif_ok_history := Lift_verif_var_ok;
                  Lift_verif_exec_up_history := Lift_verif_var_exec_up;
                  Lift_verif_exec_down_history := Lift_verif_var_exec_down;
                  Lift_verif_down_history := Lift_verif_var_down;
                  Lift_verif_not_higher_than_highest_floor_history := Lift_verif_var_not_higher_than_highest_floor;
                  Lift_verif_floor_history := Lift_verif_var_floor;
                  Lift_verif_not_lower_than_lowest_floor_history := Lift_verif_var_not_lower_than_lowest_floor;
                  Lift_verif_up_history := Lift_verif_var_up;
                  Lift_verif_only_exec_up_or_down_history := Lift_verif_var_only_exec_up_or_down;
                  Lift_verif_var_up(Lift_verif_ref) := bool((Lift_verif_param_up = TRUE));
                  Lift_verif_var_down(Lift_verif_ref) := bool((Lift_verif_param_down = TRUE));
                  IF ((Lift_verif_var_up /= {}) & (Lift_verif_var_down /= {})) THEN
                      Node_1.Lift_clock_step(Lift_verif_var_up(Lift_verif_ref), Lift_verif_var_down(Lift_verif_ref))
                  END;
                  IF ((Node_1.Lift_var_exec_up /= {}) & ((Node_1.Lift_var_exec_down /= {}) & (Node_1.Lift_var_floor /= {}))) THEN
                      Lift_verif_var_exec_up(Lift_verif_ref) := bool((Node_1.Lift_var_exec_up(Lift_ref) = TRUE))
                  ELSE
                      Lift_verif_var_exec_up := {}
                  END;
                  IF ((Node_1.Lift_var_exec_up /= {}) & ((Node_1.Lift_var_exec_down /= {}) & (Node_1.Lift_var_floor /= {}))) THEN
                      Lift_verif_var_exec_down(Lift_verif_ref) := bool((Node_1.Lift_var_exec_down(Lift_ref) = TRUE))
                  ELSE
                      Lift_verif_var_exec_down := {}
                  END;
                  IF ((Node_1.Lift_var_exec_up /= {}) & ((Node_1.Lift_var_exec_down /= {}) & (Node_1.Lift_var_floor /= {}))) THEN
                      Lift_verif_var_floor(Lift_verif_ref) := Node_1.Lift_var_floor(Lift_ref)
                  ELSE
                      Lift_verif_var_floor := {}
                  END;
                  IF ((Lift_verif_var_exec_up /= {}) & (Lift_verif_var_exec_down /= {})) THEN
                      Lift_verif_var_only_exec_up_or_down(Lift_verif_ref) := bool(not(((Lift_verif_var_exec_up(Lift_verif_ref) = TRUE) & (Lift_verif_var_exec_down(Lift_verif_ref) = TRUE))))
                  ELSE
                      Lift_verif_var_only_exec_up_or_down := {}
                  END;
                  IF (Lift_verif_var_floor /= {}) THEN
                      Lift_verif_var_not_lower_than_lowest_floor(Lift_verif_ref) := bool((Lift_verif_var_floor(Lift_verif_ref) >= 0))
                  ELSE
                      Lift_verif_var_not_lower_than_lowest_floor := {}
                  END;
                  IF (Lift_verif_var_floor /= {}) THEN
                      Lift_verif_var_not_higher_than_highest_floor(Lift_verif_ref) := bool((Lift_verif_var_floor(Lift_verif_ref) <= 100))
                  ELSE
                      Lift_verif_var_not_higher_than_highest_floor := {}
                  END;
                  IF ((Lift_verif_var_only_exec_up_or_down /= {}) & ((Lift_verif_var_not_lower_than_lowest_floor /= {}) & (Lift_verif_var_not_higher_than_highest_floor /= {}))) THEN
                      Lift_verif_var_ok(Lift_verif_ref) := bool(((Lift_verif_var_only_exec_up_or_down(Lift_verif_ref) = TRUE) & ((Lift_verif_var_not_lower_than_lowest_floor(Lift_verif_ref) = TRUE) & (Lift_verif_var_not_higher_than_highest_floor(Lift_verif_ref) = TRUE))))
                  ELSE
                      Lift_verif_var_ok := {}
                  END;
                  Lift_verif_is_initialisation(Lift_verif_clock___basic__) := FALSE;
                  ASSERT (((Lift_verif_var_up /= {}) & (Lift_verif_var_down /= {})) => not(((Lift_verif_var_up(Lift_verif_ref) = TRUE) & (Lift_verif_var_down(Lift_verif_ref) = TRUE)))) THEN skip END

              END
        END



END
