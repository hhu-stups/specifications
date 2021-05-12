MACHINE BError_4

VARIABLES BError_4_n, BError_4_is_initialisation, BError_4_current_state_integer

SETS BError_4_variables = {BError_4_var_n, BError_4_var_res}; BError_4_clocks = {BError_4_clock___basic__}

INVARIANT (BError_4_n : INTEGER) & (BError_4_is_initialisation : BError_4_clocks --> BOOL) & (BError_4_current_state_integer : BError_4_variables +-> INTEGER) & ((BError_4_is_initialisation(BError_4_clock___basic__) = FALSE) => (BError_4_var_res : dom(BError_4_current_state_integer)))

INITIALISATION
		BError_4_n :: INTEGER;
		BError_4_is_initialisation := (BError_4_clocks * {TRUE});
		BError_4_current_state_integer := {};
		BError_4_current_state_integer(BError_4_var_res) := BError_4_n;
		BError_4_is_initialisation(BError_4_clock___basic__) := bool((0 = 1))

OPERATIONS

BError_4_clock_step(BError_4_param_n) =
	PRE
		(BError_4_param_n : INTEGER)
	THEN

		BError_4_n := BError_4_param_n;
		BError_4_current_state_integer(BError_4_var_res) := BError_4_n;
		BError_4_is_initialisation(BError_4_clock___basic__) := bool((0 = 1))
	END


END
