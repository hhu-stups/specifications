MACHINE UMS_verif

INCLUDES Node_1.edge, Node_2.implies, Node_3.edge, Node_4.implies, Node_5.edge, Node_6.implies, Node_7.edge, Node_8.implies, Node_9.UMS, Node_10.implies, Node_11.always_from_to, Node_12.always_from_to, Node_13.always_from_to, Node_14.always_from_to

SEES LibraryLustre

VARIABLES UMS_verif_is_initialisation, UMS_verif_var_property, UMS_verif_var_empty_section, UMS_verif_var_grant_access, UMS_verif_var_grant_exit, UMS_verif_var_on_B, UMS_verif_var_on_A, UMS_verif_var_on_C, UMS_verif_var_ack_AB, UMS_verif_var_do_BC, UMS_verif_var_ack_BC, UMS_verif_var_do_AB, UMS_verif_var_no_collision, UMS_verif_var_exclusive_req, UMS_verif_var_no_derail_AB, UMS_verif_var_no_derail_BC

SETS UMS_verif_clocks = {UMS_verif_basic}

INVARIANT ((UMS_verif_is_initialisation : UMS_verif_clocks --> BOOL) & ((UMS_verif_var_ack_BC : REF +-> BOOL) & ((UMS_verif_var_ack_AB : REF +-> BOOL) & ((UMS_verif_var_on_C : REF +-> BOOL) & ((UMS_verif_var_on_B : REF +-> BOOL) & ((UMS_verif_var_on_A : REF +-> BOOL) & ((UMS_verif_var_property : REF +-> BOOL) & ((UMS_verif_var_empty_section : REF +-> BOOL) & ((UMS_verif_var_no_derail_BC : REF +-> BOOL) & ((UMS_verif_var_no_derail_AB : REF +-> BOOL) & ((UMS_verif_var_exclusive_req : REF +-> BOOL) & ((UMS_verif_var_no_collision : REF +-> BOOL) & ((UMS_verif_var_do_BC : REF +-> BOOL) & ((UMS_verif_var_do_AB : REF +-> BOOL) & ((UMS_verif_var_grant_exit : REF +-> BOOL) & ((UMS_verif_var_grant_access : REF +-> BOOL) & (((UMS_verif_is_initialisation(UMS_verif_basic) = FALSE) => (UMS_verif_var_property /= {})) & (((UMS_verif_is_initialisation(UMS_verif_basic) = FALSE) => (l_not(l_and(UMS_verif_var_ack_AB |-> UMS_verif_var_ack_BC)) /= {})) & (((UMS_verif_is_initialisation(UMS_verif_basic) = FALSE) => (l_fby_boolean(UMS_verif_is_initialisation(UMS_verif_basic) |-> UMS_verif_var_empty_section |-> {ref |-> TRUE}) /= {})) & (((UMS_verif_is_initialisation(UMS_verif_basic) = FALSE) => (l_fby_boolean(UMS_verif_is_initialisation(UMS_verif_basic) |-> {ref |-> TRUE} |-> Node_2.implies_var_AimpliesB) /= {})) & (((UMS_verif_is_initialisation(UMS_verif_basic) = FALSE) => (l_fby_boolean(UMS_verif_is_initialisation(UMS_verif_basic) |-> {ref |-> TRUE} |-> Node_4.implies_var_AimpliesB) /= {})) & (((UMS_verif_is_initialisation(UMS_verif_basic) = FALSE) => (l_fby_boolean(UMS_verif_is_initialisation(UMS_verif_basic) |-> {ref |-> TRUE} |-> Node_6.implies_var_AimpliesB) /= {})) & (((UMS_verif_is_initialisation(UMS_verif_basic) = FALSE) => (l_fby_boolean(UMS_verif_is_initialisation(UMS_verif_basic) |-> {ref |-> TRUE} |-> Node_8.implies_var_AimpliesB) /= {})) & (((UMS_verif_is_initialisation(UMS_verif_basic) = FALSE) => (l_fby_boolean(UMS_verif_is_initialisation(UMS_verif_basic) |-> {ref |-> TRUE} |-> Node_13.always_from_to_var_X) /= {})) & (((UMS_verif_is_initialisation(UMS_verif_basic) = FALSE) => (l_fby_boolean(UMS_verif_is_initialisation(UMS_verif_basic) |-> {ref |-> TRUE} |-> Node_14.always_from_to_var_X) /= {})) & ((UMS_verif_is_initialisation(UMS_verif_basic) = FALSE) => (UMS_verif_var_property = {ref |-> TRUE})))))))))))))))))))))))))))

INITIALISATION 
    UMS_verif_is_initialisation := (UMS_verif_clocks * {TRUE}); 
    UMS_verif_var_property := {}; 
    UMS_verif_var_empty_section := {}; 
    UMS_verif_var_grant_access := {}; 
    UMS_verif_var_grant_exit := {}; 
    UMS_verif_var_on_B := {}; 
    UMS_verif_var_on_A := {}; 
    UMS_verif_var_on_C := {}; 
    UMS_verif_var_ack_AB := {}; 
    UMS_verif_var_do_BC := {}; 
    UMS_verif_var_ack_BC := {}; 
    UMS_verif_var_do_AB := {}; 
    UMS_verif_var_no_collision := {}; 
    UMS_verif_var_exclusive_req := {}; 
    UMS_verif_var_no_derail_AB := {}; 
    UMS_verif_var_no_derail_BC := {}


OPERATIONS 

    UMS_verif_clock_step(UMS_verif_param_on_A, UMS_verif_param_on_B, UMS_verif_param_on_C, UMS_verif_param_ack_AB, UMS_verif_param_ack_BC) = 
        PRE
            ((UMS_verif_param_on_A : REF --> BOOL) & ((UMS_verif_param_on_B : REF --> BOOL) & ((UMS_verif_param_on_C : REF --> BOOL) & ((UMS_verif_param_ack_AB : REF --> BOOL) & (UMS_verif_param_ack_BC : REF --> BOOL)))))
        THEN
            VAR UMS_verif_var_only_on_B IN
                UMS_verif_var_on_A := UMS_verif_param_on_A; 
                UMS_verif_var_on_B := UMS_verif_param_on_B; 
                UMS_verif_var_on_C := UMS_verif_param_on_C; 
                UMS_verif_var_ack_AB := UMS_verif_param_ack_AB; 
                UMS_verif_var_ack_BC := UMS_verif_param_ack_BC; 
                UMS_verif_var_empty_section := l_not(l_or(UMS_verif_var_on_A |-> l_or(UMS_verif_var_on_B |-> UMS_verif_var_on_C))); 
                UMS_verif_var_only_on_B := l_and(UMS_verif_var_on_B |-> l_not(l_or(UMS_verif_var_on_A |-> UMS_verif_var_on_C))); 
                SELECT (l_not(l_and(UMS_verif_var_ack_AB |-> UMS_verif_var_ack_BC)) = {ref |-> TRUE}) THEN skip END; 
                SELECT (l_fby_boolean(UMS_verif_is_initialisation(UMS_verif_basic) |-> UMS_verif_var_empty_section |-> {ref |-> TRUE}) = {ref |-> TRUE}) THEN skip END; 
                Node_1.edge_clock_step(l_not(UMS_verif_var_empty_section)); 
                Node_2.implies_clock_step(Node_1.edge_var_EDGE, UMS_verif_var_grant_access); 
                SELECT (l_fby_boolean(UMS_verif_is_initialisation(UMS_verif_basic) |-> {ref |-> TRUE} |-> Node_2.implies_var_AimpliesB) = {ref |-> TRUE}) THEN skip END; 
                Node_3.edge_clock_step(UMS_verif_var_on_C); 
                Node_4.implies_clock_step(Node_3.edge_var_EDGE, UMS_verif_var_grant_exit); 
                SELECT (l_fby_boolean(UMS_verif_is_initialisation(UMS_verif_basic) |-> {ref |-> TRUE} |-> Node_4.implies_var_AimpliesB) = {ref |-> TRUE}) THEN skip END; 
                Node_5.edge_clock_step(l_not(UMS_verif_var_on_A)); 
                Node_6.implies_clock_step(Node_5.edge_var_EDGE, UMS_verif_var_on_B); 
                SELECT (l_fby_boolean(UMS_verif_is_initialisation(UMS_verif_basic) |-> {ref |-> TRUE} |-> Node_6.implies_var_AimpliesB) = {ref |-> TRUE}) THEN skip END; 
                Node_7.edge_clock_step(l_not(UMS_verif_var_on_B)); 
                Node_8.implies_clock_step(Node_7.edge_var_EDGE, l_or(UMS_verif_var_on_A |-> UMS_verif_var_on_C)); 
                SELECT (l_fby_boolean(UMS_verif_is_initialisation(UMS_verif_basic) |-> {ref |-> TRUE} |-> Node_8.implies_var_AimpliesB) = {ref |-> TRUE}) THEN skip END; 
                Node_9.UMS_clock_step(UMS_verif_var_on_A, UMS_verif_var_on_B, UMS_verif_var_on_C, UMS_verif_var_ack_AB, UMS_verif_var_ack_BC); 
                UMS_verif_var_grant_access := Node_9.UMS_var_grant_access; 
                UMS_verif_var_grant_exit := Node_9.UMS_var_grant_exit; 
                UMS_verif_var_do_AB := Node_9.UMS_var_do_AB; 
                UMS_verif_var_do_BC := Node_9.UMS_var_do_BC; 
                Node_10.implies_clock_step(UMS_verif_var_grant_access, UMS_verif_var_empty_section); 
                UMS_verif_var_no_collision := Node_10.implies_var_AimpliesB; 
                UMS_verif_var_exclusive_req := l_not(l_and(UMS_verif_var_do_AB |-> UMS_verif_var_do_BC)); 
                Node_11.always_from_to_clock_step(UMS_verif_var_ack_AB, UMS_verif_var_grant_access, UMS_verif_var_only_on_B); 
                UMS_verif_var_no_derail_AB := Node_11.always_from_to_var_X; 
                Node_12.always_from_to_clock_step(UMS_verif_var_ack_BC, UMS_verif_var_grant_exit, UMS_verif_var_empty_section); 
                UMS_verif_var_no_derail_BC := Node_12.always_from_to_var_X; 
                UMS_verif_var_property := l_and(UMS_verif_var_no_collision |-> l_and(UMS_verif_var_exclusive_req |-> l_and(UMS_verif_var_no_derail_AB |-> UMS_verif_var_no_derail_BC))); 
                Node_13.always_from_to_clock_step(UMS_verif_var_ack_AB, UMS_verif_var_ack_AB, UMS_verif_var_do_BC); 
                SELECT (l_fby_boolean(UMS_verif_is_initialisation(UMS_verif_basic) |-> {ref |-> TRUE} |-> Node_13.always_from_to_var_X) = {ref |-> TRUE}) THEN skip END; 
                Node_14.always_from_to_clock_step(UMS_verif_var_ack_BC, UMS_verif_var_ack_BC, UMS_verif_var_do_AB); 
                SELECT (l_fby_boolean(UMS_verif_is_initialisation(UMS_verif_basic) |-> {ref |-> TRUE} |-> Node_14.always_from_to_var_X) = {ref |-> TRUE}) THEN skip END; 
                UMS_verif_is_initialisation(UMS_verif_basic) := FALSE

            END

        END



END