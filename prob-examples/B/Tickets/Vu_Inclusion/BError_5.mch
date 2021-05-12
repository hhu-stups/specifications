MACHINE BError_5

VARIABLES BError_5_n, BError_5_is_initialisation, BError_5_current_state_integer

SETS BError_5_variables = {BError_5_var_n, BError_5_var_res}; BError_5_clocks = {BError_5_clock___basic__}

INVARIANT
 (BError_5_n : INTEGER) &
 (BError_5_is_initialisation : BError_5_clocks --> BOOL) &
  (BError_5_current_state_integer : BError_5_variables +-> INTEGER) &
  ((BError_5_is_initialisation(BError_5_clock___basic__) = FALSE) => (BError_5_var_res : dom(BError_5_current_state_integer)))

INITIALISATION
		BError_5_n :: INTEGER;
		BError_5_is_initialisation := (BError_5_clocks * {TRUE});
		BError_5_current_state_integer := {};
		BError_5_current_state_integer(BError_5_var_res) := BError_5_n;
		BError_5_is_initialisation(BError_5_clock___basic__) := bool((0 = 1))

OPERATIONS

BError_5_clock_step(BError_5_param_n) =
	PRE
		(BError_5_param_n : INTEGER)
	THEN

		BError_5_n := BError_5_param_n;
		BError_5_current_state_integer(BError_5_var_res) := BError_5_n;
		BError_5_is_initialisation(BError_5_clock___basic__) := bool((0 = 1))
	END


END
