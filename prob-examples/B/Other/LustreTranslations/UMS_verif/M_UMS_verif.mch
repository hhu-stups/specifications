MACHINE M_UMS_verif

INCLUDES Node_1.M_edge, Node_2.M_implies, Node_3.M_edge, Node_4.M_implies, Node_5.M_edge, Node_6.M_implies, Node_7.M_edge, Node_8.M_implies, Node_9.M_UMS, Node_10.M_implies, Node_11.M_always_from_to, Node_12.M_always_from_to, Node_13.M_always_from_to, Node_14.M_always_from_to

SEES LibraryLustre

VARIABLES is_initialisation, var_property, var_empty_section, var_grant_access, var_grant_exit, var_on_B, var_on_A, var_on_C, var_ack_AB, var_do_BC, var_ack_BC, var_do_AB, var_no_collision, var_exclusive_req, var_no_derail_AB, var_no_derail_BC

SETS M_UMS_verif_clocks = {M_UMS_verif_clock}

INVARIANT ((is_initialisation : M_UMS_verif_clocks --> BOOL) & ((var_ack_BC : LUSTRE_BOOL) & ((var_ack_AB : LUSTRE_BOOL) & ((var_on_C : LUSTRE_BOOL) & ((var_on_B : LUSTRE_BOOL) & ((var_on_A : LUSTRE_BOOL) & ((var_property : LUSTRE_BOOL) & ((var_empty_section : LUSTRE_BOOL) & ((var_no_derail_BC : LUSTRE_BOOL) & ((var_no_derail_AB : LUSTRE_BOOL) & ((var_exclusive_req : LUSTRE_BOOL) & ((var_no_collision : LUSTRE_BOOL) & ((var_do_BC : LUSTRE_BOOL) & ((var_do_AB : LUSTRE_BOOL) & ((var_grant_exit : LUSTRE_BOOL) & ((var_grant_access : LUSTRE_BOOL) & (((is_initialisation(M_UMS_verif_clock) = FALSE) => (var_property /= {})) & ((is_initialisation(M_UMS_verif_clock) = FALSE) => (var_property = {ref |-> TRUE})))))))))))))))))))

INITIALISATION 
    is_initialisation := (M_UMS_verif_clocks * {TRUE}); 
    var_property := {}; 
    var_empty_section := {}; 
    var_grant_access := {}; 
    var_grant_exit := {}; 
    var_on_B := {}; 
    var_on_A := {}; 
    var_on_C := {}; 
    var_ack_AB := {}; 
    var_do_BC := {}; 
    var_ack_BC := {}; 
    var_do_AB := {}; 
    var_no_collision := {}; 
    var_exclusive_req := {}; 
    var_no_derail_AB := {}; 
    var_no_derail_BC := {}


OPERATIONS 

    clock_step(param_on_A, param_on_B, param_on_C, param_ack_AB, param_ack_BC) = 
        PRE
            ((param_on_A : LUSTRE_BOOL_NOT_NIL) & ((param_on_B : LUSTRE_BOOL_NOT_NIL) & ((param_on_C : LUSTRE_BOOL_NOT_NIL) & ((param_ack_AB : LUSTRE_BOOL_NOT_NIL) & (param_ack_BC : LUSTRE_BOOL_NOT_NIL)))))
        THEN
            VAR var_only_on_B IN
                var_on_A := param_on_A; 
                var_on_B := param_on_B; 
                var_on_C := param_on_C; 
                var_ack_AB := param_ack_AB; 
                var_ack_BC := param_ack_BC; 
                var_empty_section := l_not(l_or(var_on_A |-> l_or(var_on_B |-> var_on_C))); 
                var_only_on_B := l_and(var_on_B |-> l_not(l_or(var_on_A |-> var_on_C))); 
                ASSERT (l_not(l_and(var_ack_AB |-> var_ack_BC)) /= {}) THEN skip END; 
                SELECT (l_not(l_and(var_ack_AB |-> var_ack_BC)) = {ref |-> TRUE}) THEN skip END; 
                ASSERT (l_fby_boolean(is_initialisation(M_UMS_verif_clock) |-> var_empty_section |-> {ref |-> TRUE}) /= {}) THEN skip END; 
                SELECT (l_fby_boolean(is_initialisation(M_UMS_verif_clock) |-> var_empty_section |-> {ref |-> TRUE}) = {ref |-> TRUE}) THEN skip END; 
                Node_1.clock_step(l_not(var_empty_section)); 
                Node_2.clock_step(Node_1.var_EDGE, var_grant_access); 
                ASSERT (l_fby_boolean(is_initialisation(M_UMS_verif_clock) |-> {ref |-> TRUE} |-> Node_2.var_AimpliesB) /= {}) THEN skip END; 
                SELECT (l_fby_boolean(is_initialisation(M_UMS_verif_clock) |-> {ref |-> TRUE} |-> Node_2.var_AimpliesB) = {ref |-> TRUE}) THEN skip END; 
                Node_3.clock_step(var_on_C); 
                Node_4.clock_step(Node_3.var_EDGE, var_grant_exit); 
                ASSERT (l_fby_boolean(is_initialisation(M_UMS_verif_clock) |-> {ref |-> TRUE} |-> Node_4.var_AimpliesB) /= {}) THEN skip END; 
                SELECT (l_fby_boolean(is_initialisation(M_UMS_verif_clock) |-> {ref |-> TRUE} |-> Node_4.var_AimpliesB) = {ref |-> TRUE}) THEN skip END; 
                Node_5.clock_step(l_not(var_on_A)); 
                Node_6.clock_step(Node_5.var_EDGE, var_on_B); 
                ASSERT (l_fby_boolean(is_initialisation(M_UMS_verif_clock) |-> {ref |-> TRUE} |-> Node_6.var_AimpliesB) /= {}) THEN skip END; 
                SELECT (l_fby_boolean(is_initialisation(M_UMS_verif_clock) |-> {ref |-> TRUE} |-> Node_6.var_AimpliesB) = {ref |-> TRUE}) THEN skip END; 
                Node_7.clock_step(l_not(var_on_B)); 
                Node_8.clock_step(Node_7.var_EDGE, l_or(var_on_A |-> var_on_C)); 
                ASSERT (l_fby_boolean(is_initialisation(M_UMS_verif_clock) |-> {ref |-> TRUE} |-> Node_8.var_AimpliesB) /= {}) THEN skip END; 
                SELECT (l_fby_boolean(is_initialisation(M_UMS_verif_clock) |-> {ref |-> TRUE} |-> Node_8.var_AimpliesB) = {ref |-> TRUE}) THEN skip END; 
                Node_9.clock_step(var_on_A, var_on_B, var_on_C, var_ack_AB, var_ack_BC); 
                var_grant_access := Node_9.var_grant_access; 
                var_grant_exit := Node_9.var_grant_exit; 
                var_do_AB := Node_9.var_do_AB; 
                var_do_BC := Node_9.var_do_BC; 
                Node_10.clock_step(var_grant_access, var_empty_section); 
                var_no_collision := Node_10.var_AimpliesB; 
                var_exclusive_req := l_not(l_and(var_do_AB |-> var_do_BC)); 
                Node_11.clock_step(var_ack_AB, var_grant_access, var_only_on_B); 
                var_no_derail_AB := Node_11.var_X; 
                Node_12.clock_step(var_ack_BC, var_grant_exit, var_empty_section); 
                var_no_derail_BC := Node_12.var_X; 
                var_property := l_and(var_no_collision |-> l_and(var_exclusive_req |-> l_and(var_no_derail_AB |-> var_no_derail_BC))); 
                Node_13.clock_step(var_ack_AB, var_ack_AB, var_do_BC); 
                ASSERT (l_fby_boolean(is_initialisation(M_UMS_verif_clock) |-> {ref |-> TRUE} |-> Node_13.var_X) /= {}) THEN skip END; 
                SELECT (l_fby_boolean(is_initialisation(M_UMS_verif_clock) |-> {ref |-> TRUE} |-> Node_13.var_X) = {ref |-> TRUE}) THEN skip END; 
                Node_14.clock_step(var_ack_BC, var_ack_BC, var_do_AB); 
                ASSERT (l_fby_boolean(is_initialisation(M_UMS_verif_clock) |-> {ref |-> TRUE} |-> Node_14.var_X) /= {}) THEN skip END; 
                SELECT (l_fby_boolean(is_initialisation(M_UMS_verif_clock) |-> {ref |-> TRUE} |-> Node_14.var_X) = {ref |-> TRUE}) THEN skip END; 
                is_initialisation(M_UMS_verif_clock) := FALSE

            END

        END



END