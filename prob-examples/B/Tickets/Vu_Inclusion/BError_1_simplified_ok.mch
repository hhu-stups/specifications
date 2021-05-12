MACHINE BError_1_simplified // remove Node_3

INCLUDES
 // Node_1.BError_5, // error appears when we comment this in
  Node_2.BError_4, // Node_3.BError_2,
  Node_4.BError_3

VARIABLES BError_1_n, BError_1_is_initialisation, BError_1_current_state_integer

SETS
 BError_1_variables = {BError_1_var_n, BError_1_var_res1, BError_1_var_res2, BError_1_var_res3, BError_1_var_res4};
 BError_1_clocks = {BError_1_clock___basic__}

INVARIANT
(BError_1_n : INTEGER) &
(BError_1_is_initialisation : BError_1_clocks --> BOOL) &
(BError_1_current_state_integer : BError_1_variables +-> INTEGER) & ((BError_1_is_initialisation(BError_1_clock___basic__) = FALSE) => (BError_1_var_res1 : dom(BError_1_current_state_integer))) &
((BError_1_is_initialisation(BError_1_clock___basic__) = FALSE) => (BError_1_var_res2 : dom(BError_1_current_state_integer))) &
((BError_1_is_initialisation(BError_1_clock___basic__) = FALSE) => (BError_1_var_res3 : dom(BError_1_current_state_integer))) &
((BError_1_is_initialisation(BError_1_clock___basic__) = FALSE) => (BError_1_var_res4 : dom(BError_1_current_state_integer)))

INITIALISATION
		BError_1_n :: INTEGER;
		BError_1_is_initialisation := (BError_1_clocks * {TRUE});
		BError_1_current_state_integer := {};
		/*Node_1.BError_5_clock_step(BError_1_n);
		BError_1_current_state_integer(BError_1_var_res1) := Node_1.BError_5_current_state_integer(BError_5_var_res);*/
		Node_2.BError_4_clock_step(BError_1_n);
		BError_1_current_state_integer(BError_1_var_res2) := Node_2.BError_4_current_state_integer(BError_4_var_res);
		//Node_3.BError_2_clock_step(BError_1_n);
		//BError_1_current_state_integer(BError_1_var_res3) := Node_3.BError_2_current_state_integer(BError_2_var_res);
		Node_4.BError_3_clock_step(BError_1_n);
		BError_1_current_state_integer(BError_1_var_res4) := Node_4.BError_3_current_state_integer(BError_3_var_res);
		BError_1_is_initialisation(BError_1_clock___basic__) := bool((0 = 1))

OPERATIONS

BError_1_clock_step(BError_1_param_n) =
	PRE
		(BError_1_param_n : INTEGER)
	THEN

		BError_1_n := BError_1_param_n;
		/*Node_1.BError_5_clock_step(BError_1_n);
		BError_1_current_state_integer(BError_1_var_res1) := Node_1.BError_5_current_state_integer(BError_5_var_res);*/
		Node_2.BError_4_clock_step(BError_1_n);
		BError_1_current_state_integer(BError_1_var_res2) := Node_2.BError_4_current_state_integer(BError_4_var_res);
		//Node_3.BError_2_clock_step(BError_1_n);
		//BError_1_current_state_integer(BError_1_var_res3) := Node_3.BError_2_current_state_integer(BError_2_var_res);
		Node_4.BError_3_clock_step(BError_1_n);
		BError_1_current_state_integer(BError_1_var_res4) := Node_4.BError_3_current_state_integer(BError_3_var_res);
		BError_1_is_initialisation(BError_1_clock___basic__) := bool((0 = 1))
	END


END
