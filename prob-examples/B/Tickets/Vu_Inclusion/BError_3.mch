MACHINE BError_3

INCLUDES Node_6.BError_4

VARIABLES BError_3_n, BError_3_is_initialisation, BError_3_current_state_integer

SETS BError_3_variables = {BError_3_var_n, BError_3_var_res}; BError_3_clocks = {BError_3_clock___basic__}

INVARIANT (BError_3_n : INTEGER) & (BError_3_is_initialisation : BError_3_clocks --> BOOL) & (BError_3_current_state_integer : BError_3_variables +-> INTEGER) & ((BError_3_is_initialisation(BError_3_clock___basic__) = FALSE) => (BError_3_var_res : dom(BError_3_current_state_integer)))

INITIALISATION
		BError_3_n :: INTEGER;
		BError_3_is_initialisation := (BError_3_clocks * {TRUE});
		BError_3_current_state_integer := {};
		Node_6.BError_4_clock_step(BError_3_n);
		BError_3_current_state_integer(BError_3_var_res) := Node_6.BError_4_current_state_integer(BError_4_var_res);
		BError_3_is_initialisation(BError_3_clock___basic__) := bool((0 = 1))

OPERATIONS

BError_3_clock_step(BError_3_param_n) =
	PRE
		(BError_3_param_n : INTEGER)
	THEN

		BError_3_n := BError_3_param_n;
		Node_6.BError_4_clock_step(BError_3_n);
		BError_3_current_state_integer(BError_3_var_res) := Node_6.BError_4_current_state_integer(BError_4_var_res);
		BError_3_is_initialisation(BError_3_clock___basic__) := bool((0 = 1))
	END


END
