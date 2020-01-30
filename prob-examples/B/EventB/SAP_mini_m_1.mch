MODEL SAP_mini_m_1
SETS DATA
CONSTANTS no_data
PROPERTIES (no_data : DATA)
VARIABLES accepted_data,agr,buyer_turn,ccl,proposed_data,terminated
INVARIANT ((proposed_data = no_data) => (accepted_data = no_data)) & (((proposed_data /= no_data) & (proposed_data = accepted_data)) <=> (agr = TRUE)) & ((proposed_data = no_data) => (buyer_turn = TRUE)) & ((proposed_data = no_data) => (ccl = FALSE)) & ((proposed_data = no_data) => (terminated = FALSE)) & accepted_data:DATA & agr:BOOL & buyer_turn:BOOL & ccl:BOOL & proposed_data:DATA & terminated:BOOL

DEFINITIONS
SET_PREF_SHOW_EVENTB_ANY_VALUES==TRUE 
INITIALISATION agr := FALSE || ccl := FALSE || terminated := FALSE || proposed_data := no_data || accepted_data := no_data || buyer_turn := TRUE
OPERATIONS
 final = SELECT (terminated = FALSE) & ((ccl = TRUE) or (agr = TRUE)) & (buyer_turn = TRUE) THEN terminated := TRUE || buyer_turn := FALSE END ;
 initial_proposal_by_buyer = ANY data WHERE (data /= no_data) & (proposed_data = no_data) THEN proposed_data := data || buyer_turn := FALSE END ;
 conter_proposal_by_seller = ANY data WHERE (buyer_turn = FALSE) & (proposed_data /= accepted_data) & (data /= no_data) & (data /= proposed_data) & (ccl = FALSE) THEN accepted_data := data || buyer_turn := TRUE END ;
 change_proposal_by_buyer = ANY data WHERE (proposed_data /= no_data) & (data /= no_data) & (data /= accepted_data) & (data /= proposed_data) & (buyer_turn = TRUE) & (ccl = FALSE) & (terminated = FALSE) THEN proposed_data := data || buyer_turn := FALSE || agr := FALSE END ;
 accept_proposal_by_seller = SELECT (proposed_data /= accepted_data) & (terminated = FALSE) & (buyer_turn = FALSE) & (ccl = FALSE) THEN accepted_data := proposed_data || agr := TRUE || buyer_turn := TRUE END ;
 accept_conter_proposal_by_buyer = SELECT (accepted_data /= no_data) & (terminated = FALSE) & (buyer_turn = TRUE) & (accepted_data /= proposed_data) & (ccl = FALSE) THEN proposed_data := accepted_data || agr := TRUE || buyer_turn := FALSE END ;
 cancel_by_buyer = SELECT (proposed_data /= no_data) & (terminated = FALSE) & (ccl = FALSE) & (buyer_turn = TRUE) THEN ccl := TRUE || buyer_turn := FALSE END ;
 do_nothing_by_seller = SELECT (buyer_turn = FALSE) & ((ccl = TRUE) or (proposed_data = accepted_data)) THEN buyer_turn := TRUE END 
END