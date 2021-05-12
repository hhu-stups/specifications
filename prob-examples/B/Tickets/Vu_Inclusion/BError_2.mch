MACHINE BError_2

INCLUDES Node_5.BError_4

VARIABLES BError_2_n, BError_2_is_initialisation, BError_2_current_state_integer

SETS BError_2_variables = {BError_2_var_n, BError_2_var_res}; BError_2_clocks = {BError_2_clock___basic__}

INVARIANT (BError_2_n : INTEGER) & (BError_2_is_initialisation : BError_2_clocks --> BOOL) & (BError_2_current_state_integer : BError_2_variables +-> INTEGER) & ((BError_2_is_initialisation(BError_2_clock___basic__) = FALSE) => (BError_2_var_res : dom(BError_2_current_state_integer)))

INITIALISATION
		BError_2_n :: INTEGER;
		BError_2_is_initialisation := (BError_2_clocks * {TRUE});
		BError_2_current_state_integer := {};
		Node_5.BError_4_clock_step(BError_2_n);
		BError_2_current_state_integer(BError_2_var_res) := Node_5.BError_4_current_state_integer(BError_4_var_res);
		BError_2_is_initialisation(BError_2_clock___basic__) := bool((0 = 1))

OPERATIONS

BError_2_clock_step(BError_2_param_n) =
	PRE
		(BError_2_param_n : INTEGER)
	THEN

		BError_2_n := BError_2_param_n;
		Node_5.BError_4_clock_step(BError_2_n);
		BError_2_current_state_integer(BError_2_var_res) := Node_5.BError_4_current_state_integer(BError_4_var_res);
		BError_2_is_initialisation(BError_2_clock___basic__) := bool((0 = 1))
	END


END
